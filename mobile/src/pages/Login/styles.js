import{ StyleSheet} from 'react-native';
import Constants from 'expo-constants';
export default StyleSheet.create({
container:{
flex:1,
paddingHorizontal:24,
paddingTop: Constants.statusBarHeight + 20,
e


},
header:{
    flexDirection:'row',
    justifyContent: 'space-between',
    alignItems:'center'
},
headerText:{
    fontSize:15,
    color:'#737380',
},
headerTextBold:{
    fontWeight:'bold'
},
title:{
   fontSize:25,
   marginBottom:16,
   marginTop:48,
   color:'#FFFF',
   fontWeight:'bold'

},
cadastro:{
    alignItems:'center',
    fontSize:15,

  
},

detailsButtonText:{
    color:'#e02041',
    fontSize:15,
    fontWeight:'bold'
},

});