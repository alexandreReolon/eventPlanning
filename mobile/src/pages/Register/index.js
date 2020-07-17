import React from 'react';
import{View,Text,TouchableOpacity} from 'react-native';
import {Feather} from '@expo/vector-icons'
import { useNavigation} from '@react-navigation/native';
import styles from './styles';

export default function Login(){
    const navigation = useNavigation();

    function navegateToCadastro(){
        navigation.navigate('Register');
    }
    return(
<View style={styles.container}>  
<View style={styles.header}>  
<Text style={styles.headerText}>

</Text>
</View>
<Text style={styles.title}>Bem Vindo ao Event Planner</Text>


<TouchableOpacity style={styles.detalsButton}
    onPress={navegateToCadastro}><Text style={styles.detailsButtonText}>
        Não é cadastrado?</Text>
        
        </TouchableOpacity>
</View>
    );
}
