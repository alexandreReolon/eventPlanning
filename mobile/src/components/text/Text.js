import React, { Component } from 'react';
import { Text as TextComponent, View } from 'react-native';
import styles from './Styles';

export default class Text extends Component {
    render() {
        const { text } = this.props;

        return (
            <TextComponent style={styles.text}>{text}</TextComponent>
        )
    }

}
