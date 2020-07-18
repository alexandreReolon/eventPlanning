
import React from 'react';
import Routes from './src/routes';
import styles from './styles';
import StatusBar from './src/components/statusBar/StatusBar'
import { View } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <StatusBar />
      <Routes />
    </View>
  );
}

