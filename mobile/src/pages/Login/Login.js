import { View } from 'react-native';
import React from 'react';
import styles from './Styles';
import FontAwesomeIcon from 'react-native-vector-icons/FontAwesome';
import TextInput from '../../components/textInput/TextInput';
import Text from '../../components/text/Text';
import Button from '../../components/button/Button';

export default function Login() {
    return (
        <View style={styles.container}>
            <View style={styles.text}>
                <Text text="Olá!" />
                <Text text="Seja bem vindo ao" />
                <Text text="Event Planning" />
            </View>


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

                <Button
                    title="ENTRAR" width='200'
                />

                <Button
                    title="REGISTRAR-SE"
                />
            </View>

        </View>
    );
}