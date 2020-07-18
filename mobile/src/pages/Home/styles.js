import { StyleSheet } from 'react-native';
import Constants from 'expo-constants';

export default StyleSheet.create({
    container: {
        flex: 1,
        paddingHorizontal: 24,
        paddingTop: Constants.statusBarHeight + 20,
        backgroundColor: '#062D4C',

    },
    title: {
        fontSize: 25,
        marginBottom: 16,
        marginTop: 48,
        color: '#FFFF',
        fontWeight: 'bold'
    },
},

);