import { View, Switch } from 'react-native';
import React from 'react';
import styles from './Styles';
import FontAwesomeIcon from 'react-native-vector-icons/FontAwesome';
import TextInput from '../../components/textInput/TextInput';
import Text from '../../components/text/Text';
import Button from '../../components/button/Button';
import Service from '../../Service'

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

                <View style={styles.margin}>
                    <Text size={15} text="Permanecer conectado" />

                    <Switch style={styles.toggle}
                        trackColor={{ false: "#767577", true: "#81b0ff" }}
                        ios_backgroundColor="#3e3e3e"
                    />

                    <Text size={15} text="Esqueceu sua senha?" />
                </View>

                <View style={styles.center}>
                    <Button title="ENTRAR" onPress={validarLogin} />
                    <Button title="REGISTRAR-SE" />
                </View>
            </View>
        </View>
    );

    function validarLogin() {

        const failed = function name(params) {
            console.log("failed" + params);
        }

        const sucess = function name(params) {
            console.log("sucess" + params);
        }

        Service('usuarioService/efetuarLogin', 'get', sucess, failed);
    }
}