import React, { useEffect, useState } from 'react'
import { View, StyleSheet, StatusBar, ActivityIndicator, Text, Dimensions } from 'react-native'
import Posts from '../Post/Posts'
import Header from './Header'
import { theme } from '../../Style/Constants'
import { useSelector } from 'react-redux'
import { selectUser } from '../../../redux/slices/userSlice'
import { selectAllPosts } from '../../../redux/slices/allPostsSlice'
import Icon from 'react-native-vector-icons/Ionicons'
import { POST_VISIBILITY } from '../../CONSTANTS'
import { descriptiveText } from '../../Style/Common'
import Loading from '../../Helper/Loading'

const LIMIT = 3;

export default function Feed() {

    const user = useSelector(selectUser);
    const allPosts = useSelector(selectAllPosts);

    const [update, setUpdate] = useState(false)
    const [currentPostList, setCurrentPostList] = useState([]);

    useEffect(() => {
        if (loadingDependency(user, allPosts)) {
            return
        }
        let data = extractPostsList(allPosts, user);
        if (currentPostList.length < LIMIT) {
            setCurrentPostList(data)
        } else {
            let toBeUpdated = false; 
            for (const item of data) {
                let diff = currentPostList.filter((val) => val.pid == item.pid)
                if (diff.length == 0) {
                    toBeUpdated = true;
                    break;
                }
            }
            if(data.length != currentPostList.length){
                toBeUpdated = true;
            }
            setUpdate(toBeUpdated)
        }
    }, [allPosts, user])

    const updateData = () => {
        let data = extractPostsList(allPosts, user);
        setCurrentPostList(data);
        setUpdate(false);
    }

    if (loadingDependency(user, allPosts)) {
        return (
            <Loading />
        )
    }

    if (currentPostList.length == 0) {
        return (
            <View style={{ flex: 1 }}>
                <Header />
                {descriptiveText('Opps! No Post Yet.')}
            </View>
        )
    }
    return (
        <View style={styles.container}>
            <Header />
            <Posts showStory={false} margin={50} data={currentPostList} />
            {update ? <Icon name="md-add-circle-outline" onPress={updateData} style={styles.icon} /> : null}
        </View>
    )
}


function extractPostsList(allPosts, user) {
    let list = [];
    let totalLikes = 0;
    const following = user.following;

    for (const key in allPosts) {
        if (key == 'loaded') {
            continue
        }
        if (following.includes(allPosts[key].uid)) {
            list.push({ pid: key, ...allPosts[key] })
            totalLikes = totalLikes + allPosts[key].numLikes
        } else if (allPosts[key].uid == user.uid) {
            console.log("here?")
            list.push({ pid: key, ...allPosts[key] })
            totalLikes = totalLikes + allPosts[key].numLikes
        } else if (allPosts[key].visibility == POST_VISIBILITY.PUBLIC) {
            console.log("here")
            if (totalLikes <= allPosts[key].numLikes * list.length) {
                list.push({ pid: key, ...allPosts[key] })
                totalLikes = totalLikes + allPosts[key].numLikes
            }
        }
    }

    list.sort((a, b) => a.time < b.time ? 1 : -1)
    return list;
}

function loadingDependency(user, allPosts) {
    if (!user || !user.loaded || !user.following) {
        return true
    }
    if (!allPosts || !allPosts.loaded) {
        return true
    }
    return false
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: theme.lightbg,
        color: theme.lightfont,
        justifyContent: 'flex-start',
        flexDirection: 'column',
        paddingTop: StatusBar.currentHeight,
    },
    icon: {
        fontSize: 32,
        fontWeight: 'bold',
        justifyContent: 'center',
        alignContent: 'center',
        position: 'absolute',
        top: 60,
        left: Dimensions.get('window').width / 2,
        zIndex: 99999,
        height:30,
        width:30
    }
})
