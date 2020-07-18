import React from 'react';
import styles from './Styles';
import TextInput from '../../components/textInput/TextInput'
import FontAwesomeIcon from 'react-native-vector-icons/FontAwesome';
import { View, Dimensions } from 'react-native';


export default function Login() {
    const WIDTH = Dimensions.get('screen').width;

    return (
        <View style={styles.container}>

            <View style={styles.form}>
                <TextInput
                    label={'Usuário'}
                    iconClass={FontAwesomeIcon}
                    iconName={'pencil'}
                    iconColor={'white'}
                    inputPadding={16}
                    labelHeight={24}
                    borderHeight={2}
                    autoCapitalize={'none'}
                    autoCorrect={false}
                />

                <TextInput
                    label={'Senha'}
                    iconClass={FontAwesomeIcon}
                    iconName={'pencil'}
                    iconColor={'white'}
                    inputPadding={16}
                    labelHeight={24}
                    borderHeight={2}
                    autoCapitalize={'none'}
                    autoCorrect={false}
                />
            </View>

        </View>
    );
}