import React from 'react';
import { View, StatusBar as StatusBarComponent } from 'react-native';
import styles from './Styles';


const StatusBar = () => (
    <View style={styles.statusBar} >
        <StatusBarComponent backgroundColor="#772ea2" barStyle="light-content" translucent />
    </View >
);

export default StatusBar;