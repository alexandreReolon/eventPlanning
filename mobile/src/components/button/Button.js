import React, { Component } from 'react';
import { Text, TouchableOpacity, View } from 'react-native';
import Styles from './Styles'

export default class Button extends Component {
    render() {
        const {
            title,
            onPress,
            style,
        } = this.props;

        return (
            <TouchableOpacity onPress={onPress}>
                <View style={{ ...Styles.button, ...style }}>
                    <Text style={Styles.text}>{title}</Text>
                </View>
            </TouchableOpacity>
        )
    }
}
