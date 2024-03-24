import { useNavigation, useRoute } from '@react-navigation/core'
import React, { useEffect, useRef, useState } from 'react'
import { View, Text, TextInput, StyleSheet, Dimensions, ScrollView, TouchableOpacity, Pressable } from 'react-native'
import { Avatar } from 'react-native-paper'
import Icon from 'react-native-vector-icons/Ionicons'
import { useSelector } from 'react-redux'
import { addMessage } from '../../../firebase/functions'
import { subChat } from '../../../firebase/subscriptions'
import { selectAllUser } from '../../../redux/slices/allUserSlice'
import { selectUser } from '../../../redux/slices/userSlice'
import { theme } from '../../Style/Constants'
import { CHAT_MESSAGE_TYPE, DUMMY_DATA } from '../../CONSTANTS'

export default function Chat() {
    const navigation = useNavigation();
    const route = useRoute()
    const allUser = useSelector(selectAllUser)

    const [data, setData] = useState(null)
    const [chatList, setChatList] = useState([]);

    const [message, setMessage] = useState("");
    const [toccid, setToccid] = useState(null);

    const [sending, setSending] = useState(false);

    const scrollViewRef = useRef(null);
    const [itemPos, setItemPos] = useState({});

    useEffect(() => {
        if(scrollViewRef && scrollViewRef.current){
            scrollViewRef.current.scrollToEnd({animated:true})
        }
    }, [scrollViewRef])

    useEffect(() => {
        const unsubscribe = subChat(route.params.chatId, setData)
        if (allUser && allUser.loaded) {
            navigation.setOptions({ title: allUser[route.params.uid].username })
        }
        return () => {
            console.log("unsubcribed chat: " + route.params.chatId)
            unsubscribe();
        }
    }, [route])

    useEffect(() => {
        let list = getChatList(data);
        setChatList(list);
    }, [data])


    const sendMessage = async () => {
        if (sending) {
            console.log("Already sending please wait");
            return
        }
        if (message.length == 0) {
            console.log("Write some message to send");
            return;
        }
        setSending(true);
        let data = {
            content: message,
            toccid: toccid,
            type: toccid ? CHAT_MESSAGE_TYPE.REPLY : CHAT_MESSAGE_TYPE.NORMAL
        }
        setToccid(null)
        await addMessage(route.params.chatId, data, setSending)
        setMessage("") 
    }

    const iconColor = message.length > 0 ? theme.lightButton : 'gray';

    const scrollTo = (key) => {
        console.log(key)
        console.log(itemPos[key])
        scrollViewRef.current.scrollTo({
            x: 0,
            y: itemPos[key],
            animated: true
        })
    }

    return (
        <View style={{ flex: 1, flexDirection: 'column' }}>
            <ScrollView
                ref={scrollViewRef}
                onContentSizeChange={() => scrollViewRef.current.scrollToEnd({ animated: true })}
            >
                <Text style={{ alignSelf: 'center', color: 'gray', fontSize: 12 }}>{route.params.uid}</Text>
                {chatList.map((item) => {
                    let key = item.ccid.uid + '_' + item.ccid.time;
                    if (item.type == CHAT_MESSAGE_TYPE.NORMAL) {
                        return (
                            <ChatNormal data={item} key={key} keyId={key} toccidSetter={setToccid} setItemPos={setItemPos} />
                        )
                    }
                    if (item.type == CHAT_MESSAGE_TYPE.POST) {
                        return (
                            <ChatPost data={item} key={key} keyId={key} toccidSetter={setToccid}  setItemPos={setItemPos} />
                        )
                    }
                    if (item.type == CHAT_MESSAGE_TYPE.REPLY) {
                        let replyTo = data[item.toccid.uid][item.toccid.time]
                        return (
                            <ChatReply data={item} key={key} keyId={key} toccidSetter={setToccid} replyTo={replyTo} setItemPos={setItemPos} scrollTo={scrollTo} />
                        )
                    }

                })}
            </ScrollView>

            <View style={styles.sendMessageContainer}>
                <View>
                    {toccid ? <ReplyBox data={data[toccid.uid][toccid.time]} uid={toccid.uid} time={toccid.time} toccidSetter={setToccid} scrollTo={scrollTo} /> : null}
                    <TextInput style={styles.sendInput} onSubmitEditing={sendMessage} placeholder="Type Your Message Here"
                        value={message}
                        onChangeText={(mess) => setMessage(mess)}
                        maxLength={100}
                        blurOnSubmit={false}
                    />
                </View>
                <TouchableOpacity onPress={sendMessage}
                    disabled={message.length === 0}
                    style={{ alignSelf: 'flex-end', borderRadius: 50, borderWidth: 2, marginBottom: 10, borderColor: iconColor }}>
                    <Icon name="send" style={[styles.icon, { color: iconColor }]} />
                </TouchableOpacity>
            </View>

        </View>
    )
}

const ReplyBox = ({ data, toccidSetter, uid, time, scrollTo }) => {
    const allUser = useSelector(selectAllUser);
    const user = useSelector(selectUser);

    const replyColor = uid == user.uid ? '#184d47' : '#810034';

    const handlePress = () => {
        scrollTo(uid + '_' + time)
    }
    const handleLongPress = () => {
        toccidSetter(null)
    }
    return (
        <Pressable onPress={handlePress} onLongPress={handleLongPress} style={[styles.reply, styles.replyTextBox, {borderLeftColor: replyColor}]}>
             <Text style={[styles.replyOwner, {color: replyColor}]}>{uid == user.uid ? 'You' : allUser[uid].name}</Text>
            <Text>{data.content}</Text>
        </Pressable>
    )
}

const ChatNormal = ({ data, keyId, toccidSetter, setItemPos }) => {
    const allUser = useSelector(selectAllUser);
    const user = useSelector(selectUser)
    const time = new Date(data.time)

    const userAvatar = () => {
        if (data.uid == user.uid)
            return null
        let img = allUser[data.uid].dp.length > 0 ? allUser[data.uid].dp : DUMMY_DATA.dp;
        return (<Avatar.Image source={{ uri: img }} size={42} style={{ marginTop: 10 }} key={keyId} />)

    }

    const handleLayout = (event) => {
        const layout = event.nativeEvent.layout;
        setItemPos(prev => {
            let data = {
                ...prev
            }
            data[keyId] = layout.y
            return {
                ...data
            }
        })
    }

    const alignDirection = data.uid == user.uid ? 'flex-end' : 'flex-start';
    const viewStyle = data.uid == user.uid ? null : styles.vStyle
    const backgroundColor = data.uid == user.uid ? { backgroundColor: '#623FD7CF' } : { backgroundColor: 'lightgray' }
    const colorText = data.uid == user.uid ? null : { color: theme.lightfont }

    if (!data) {
        return (
            <View style={[styles.chatItem, { alignSelf: alignDirection }, backgroundColor]}>
                <Text style={[styles.chatText, colorText]}>Error in Chat</Text>
            </View>
        )
    }

    return (
        <Pressable style={viewStyle} onLongPress={() => toccidSetter(data.ccid)} onLayout={handleLayout}>
            {userAvatar()}
            <View style={[styles.chatItem, { alignSelf: alignDirection }, backgroundColor]}>
                <Text style={[styles.chatText, colorText]}>{data.content}</Text>
                <Text style={[styles.chatTextSmall, colorText]}>{time.toLocaleString()}</Text>
            </View>
        </Pressable>

    )
}

const ChatReply = ({ data, keyId, toccidSetter, setItemPos, scrollTo, replyTo }) => {
    const allUser = useSelector(selectAllUser);
    const user = useSelector(selectUser)
    const time = new Date(data.time)

    const userAvatar = () => {
        if (data.uid == user.uid)
            return null
        let img = allUser[data.uid].dp.length > 0 ? allUser[data.uid].dp : DUMMY_DATA.dp;
        return (<Avatar.Image source={{ uri: img }} size={42} style={{ marginTop: 10 }} key={keyId} />)
    }

    const alignDirection = data.uid == user.uid ? 'flex-end' : 'flex-start';
    const viewStyle = data.uid == user.uid ? null : styles.vStyle
    const backgroundColor = data.uid == user.uid ? { backgroundColor: '#623FD7CF' } : { backgroundColor: 'lightgray' }
    const colorText = data.uid == user.uid ? null : { color: theme.lightfont }

    const replyColor = data.toccid.uid == user.uid ? '#184d47' : '#810034'

    if (!data) {
        return (
            <View style={[styles.chatItem, { alignSelf: alignDirection }, backgroundColor]}>
                <Text style={[styles.chatText, colorText]}>Error in Chat</Text>
            </View>
        )
    }

    const handleLayout = (event) => {
        const layout = event.nativeEvent.layout;
        setItemPos(prev => {
            let data = {
                ...prev
            }
            data[keyId] = layout.y
            return {
                ...data
            }
        })
    }

    return (
        <View style={viewStyle} onLayout={handleLayout}>
            {userAvatar()}
            <View>
                <Pressable style={[styles.chatItem, { alignSelf: alignDirection }, backgroundColor]} onLongPress={() => toccidSetter(data.ccid)}>
                    <Pressable onPress={() => scrollTo(data.toccid.uid + '_' + data.toccid.time)} style={[styles.reply, {alignSelf: 'flex-start', borderLeftColor: replyColor}]}>
                        <Text style={[styles.replyOwner, {color: replyColor}]}>{data.toccid.uid == user.uid ? 'You' : allUser[data.toccid.uid].name}</Text>
                        <Text style={{ color: theme.lightfont}}>{replyTo.content}</Text>
                    </Pressable>
                    <Text style={[styles.chatText, colorText]}>{data.content}</Text>
                    <Text style={[styles.chatTextSmall, colorText]}>{time.toLocaleString()}</Text>
                </Pressable>
            </View>
            
            
        </View>

    )
}

const ChatPost = ({ data, keyId, toccidSetter, setItemPos }) => {
    const allUser = useSelector(selectAllUser);
    const user = useSelector(selectUser)
    const time = new Date(data.time)

    const userAvatar = () => {
        if (data.uid == user.uid)
            return null
        let img = allUser[data.uid].dp.length > 0 ? allUser[data.uid].dp : DUMMY_DATA.dp;
        return (<Avatar.Image source={{ uri: img }} size={42} style={{ marginTop: 10 }} key={keyId} />)

    }

    const alignDirection = data.uid == user.uid ? 'flex-end' : 'flex-start';
    const viewStyle = data.uid == user.uid ? null : styles.vStyle
    const backgroundColor = data.uid == user.uid ? { backgroundColor: '#623FD7CF' } : { backgroundColor: 'lightgray' }
    const colorText = data.uid == user.uid ? null : { color: theme.lightfont }

    if (!data) {
        return (
            <View style={[styles.chatItem, { alignSelf: alignDirection }, backgroundColor]}>
                <Text style={[styles.chatText, colorText]}>Error in Chat</Text>
            </View>
        )
    }

    const handleLayout = (event) => {
        const layout = event.nativeEvent.layout;
        setItemPos(prev => {
            let data = {
                ...prev
            }
            data[keyId] = layout.y
            return {
                ...data
            }
        })
    }

    return (
        <Pressable style={viewStyle} onLongPress={() => toccidSetter(data.ccid)} onLayout={handleLayout}>
            {userAvatar()}
            <View style={[styles.chatItem, { alignSelf: alignDirection }, backgroundColor]}>
                <Text style={[styles.chatText, colorText]}>{data.content}</Text>
                {/* <Text style={styles.chatTextSmall}>Sender: {data.uid == user.uid ? "ME" : allUser[data.uid].name} at  */}
                <Text style={[styles.chatTextSmall, colorText]}>{time.toLocaleString()}</Text>
            </View>
        </Pressable>

    )
}

function getChatList(data) {
    let list = [];
    if (!data) {
        return list;
    }
    for (const uid in data) {
        if (uid == 'subscribed') {
            continue;
        }
        for (const time in data[uid]) {
            list.push({
                ccid: { uid: uid, time: parseInt(time) },
                content: data[uid][time].content,
                time: parseInt(time),
                toccid: data[uid][time].toccid,
                type: data[uid][time].type,
                uid: uid
            })
        }
    }
    list.sort((a, b) => a.time > b.time ? 1 : -1)
    return list
}

const styles = StyleSheet.create({
    chatItem: {
        flexDirection: 'column',
        alignItems: 'flex-start',
        justifyContent: 'center',
        padding: 12,
        paddingLeft: 12,
        paddingRight: 18,
        paddingBottom: 10,
        width: Dimensions.get('window').width / 1.5,
        margin: 5,
        borderRadius: 10,
    },
    vStyle: {
        flexDirection: 'row',
    },
    chatText: {
        color: theme.darkfont,
        // fontWeight: 'bold'
    },
    chatTextSmall: {
        marginTop: 2,
        color: theme.darkfont,
        fontSize: 8,
    },
    sendInput: {
        flexDirection: 'column',
        alignItems: 'flex-start',
        justifyContent: 'flex-start',
        backgroundColor: 'rgba(255, 255, 255, 0.7)',
        borderRadius: 10,
        borderColor: theme.lightGrayBorder,
        padding: 10,
        margin: 5,
        borderWidth: 1,
        width: Dimensions.get('window').width - 60,
    },
    icon: {
        fontSize: 28,
        padding: 3,
        paddingLeft: 7,
    },
    sendMessageContainer: {
        flexDirection: 'row',
    },
    reply: { 
        padding: 10,
        paddingTop: 5,
        paddingBottom: 8,
        marginBottom: 5, 
        backgroundColor: 'rgba(255, 255, 255, 0.7)',
        width:  (Dimensions.get('window').width - 80)/ 1.5,
        borderLeftWidth: 5,
        borderRadius: 5,
    },
    replyOwner: {
        color: '#184d47',
        fontSize: 12,
        fontWeight: 'bold',
    },
    replyTextBox: {
       margin: 10, 
       backgroundColor: 'rgba(255, 255, 255, 0.6)',
       width: Dimensions.get('window').width - 80,
       marginBottom: 2,
    }
})