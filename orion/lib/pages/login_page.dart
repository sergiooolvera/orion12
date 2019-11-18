import 'package:flutter/material.dart';
import 'package:orion/providers/usuarioInfo.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  
   Widget build(BuildContext context) {
    final usuariosInfo   = Provider.of<UsuarioInfo>(context);    
    return Scaffold(
      body: Stack(
        
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context,usuariosInfo),
        ],
      )
    );
  }

  Widget _loginForm(BuildContext context, UsuarioInfo usuariosInfo) {

   
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
         
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric( vertical: 50.0 ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                 Image(
            image: AssetImage('assets/orion.jpg')
            ),
                SizedBox( height: 60.0 ),
                _crearEmail(usuariosInfo),
                SizedBox( height: 30.0 ),
                _crearPassword(usuariosInfo),
                SizedBox( height: 30.0 ),
                _crearBoton(context, usuariosInfo)
              ],
            ),
          ),

          Text('Demo'),
          SizedBox( height: 100.0 )
        ],
      ),
    );


  }

  Widget _crearEmail(UsuarioInfo usuariosInfo) {

    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon( Icons.person, color: Colors.lightBlue ),
            labelText: 'Usuario',
            
            
            
           // counterText: snapshot.data,
          // errorText: snapshot.error
          ),
        onChanged: (valor) =>setState(() {
        usuariosInfo.usuario= valor;
      })
        ),

      );


  }

  Widget _crearPassword(UsuarioInfo usuarioInfo) {

     
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon( Icons.lock_outline, color: Colors.lightBlue ),
              labelText: 'Contraseña',
              //counterText: snapshot.data,
              //errorText: snapshot.error
            ),
           onChanged: (valor) =>setState(() {
          usuarioInfo.password = valor;
      })
          ),

        );

  }

  Widget _crearBoton( BuildContext context, UsuarioInfo usuarioInfo) {

     return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.lightBlue,
          textColor: Colors.white,
          onPressed: ()=> _login(context, usuarioInfo) 
        );
  }
Future<void> _neverSatisfied() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Las credenciales ingresadas con incorrectas'),             
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
  _login( BuildContext context, UsuarioInfo usuarioInfo) {

    //print(usuarioInfo.usuario);
    //print(usuarioInfo.password);
    //print('---');
    if(usuarioInfo.usuario==usuarioInfo.password)
     Navigator.pushReplacementNamed(context, 'menu');
    else
      _neverSatisfied();

  }

  Widget _crearFondo(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0)
          ]
        )
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );


    return Stack(
      children: <Widget>[
        
        
        fondoModaro,
        
        Positioned( top: 90.0, left: 30.0, child: circulo ),
        Positioned( top: -40.0, right: -30.0, child: circulo ),
        Positioned( bottom: -50.0, right: -10.0, child: circulo ),
        Positioned( bottom: 120.0, right: 20.0, child: circulo ),
        Positioned( bottom: -50.0, left: -20.0, child: circulo ),
        
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[

             
              SizedBox( height: 10.0, width: double.infinity ),
             
            ],
          ),
        )

      ],
    );

  }
}