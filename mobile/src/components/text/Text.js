import React, { Component } from 'react';
import { Text as TextComponent } from 'react-native';
import styles from './Styles';

export default class Text extends Component {
    render() {
        const { text, size = 20 } = this.props;

        return (
            <TextComponent
                style={{
                    ...
                    styles.text,
                    fontSize: size,
                }}
            >
                {text}
            </TextComponent >
        )
    }

}
