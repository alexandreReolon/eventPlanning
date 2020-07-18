
import React from 'react';
import Routes from './src/Routes';
import styles from './styles';
import StatusBar from './src/components/statusBar/StatusBar'
import { View } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <Routes />
    </View>
  );
}

