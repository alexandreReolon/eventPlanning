import axios from 'axios';


function service(url, method, sucess, failed) {
    const address = 'https://localhost:8443/usuarioService/efetuarLogin/';
    const addressConfig = {
        method: method,
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json'
        },
    }

    return axios[method](address, addressConfig)
        .then((response) => response.json())

        //Sucesso da requisição
        .then((responseJson) => {
            sucess(responseJson);
        })
        //If response is not in json then in error
        .catch((error) => {
            console.log(error);
        });
}

export default service;