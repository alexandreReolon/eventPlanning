import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createStackNavigator} from '@react-navigation/stack';

const AppStack = createStackNavigator();

import Home from './pages/Home';
import Login from './pages/Login';
export default function Routes(){
    return ( 
<NavigationContainer>

    <AppStack.Navigator >
        <AppStack.Screen name="Home" component={Home}/>
        <AppStack.Screen name="Login" component={Login}/>
    </AppStack.Navigator>
    
</NavigationContainer>
    ); 
}