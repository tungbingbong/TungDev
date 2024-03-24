import React, { useEffect } from 'react'
import { createStackNavigator } from '@react-navigation/stack'

import { useDispatch } from 'react-redux';
import { unset as unsetUser } from '../redux/slices/userSlice'
import { unset as unsetAllUser } from '../redux/slices/allUserSlice'
import { unset as unsetAllPosts } from '../redux/slices/allPostsSlice'

import { subAllPosts, subAllUser, subUser } from '../firebase/subscriptions';

import HomeScreen from './Home/Home';
import CommentsScreen from './Comments/Comments'
import OptionsScreen from './Options/OptionStack';
import EditScreen from './Edit/Edit'
import AddScreen from './Add/Add'


const Stack = createStackNavigator();

function LoggedIn({ uid }) {

    const dispatch = useDispatch();

    useEffect(() => {
        const unsubUser = subUser(uid);
        const unsubAllUser = subAllUser();
        const unsubAllPosts = subAllPosts();
        return () => {
            console.log("Unsub from All subscribers")
            unsubUser();
            unsubAllUser();
            unsubAllPosts();
            resetReduxStates(dispatch);
        };
    }, [])

    return (
        <Stack.Navigator initialRouteName="Home">
            <Stack.Screen name="Home" component={HomeScreen} options={{ headerShown: false, title: 'Feed' }} initialParams={{ uid: uid }} />
            <Stack.Screen name="Comments" component={CommentsScreen} />
            <Stack.Screen name="Options" component={OptionsScreen} />
            <Stack.Screen name="Edit" component={EditScreen} />
            <Stack.Screen name="Add" component={AddScreen} />
        </Stack.Navigator>
    )
}

function resetReduxStates(dispatch) {
    dispatch(unsetUser)
    dispatch(unsetAllUser)
    dispatch(unsetAllPosts)
}

export default LoggedIn
