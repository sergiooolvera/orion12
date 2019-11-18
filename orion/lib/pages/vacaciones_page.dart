import 'package:flutter/material.dart';
 

class Vacaciones extends StatefulWidget {
   Vacaciones({Key key}) : super(key: key);
  @override
  _VacacionesState createState() => _VacacionesState();
}

class _VacacionesState extends State<Vacaciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Vacaciones'),
        ),
        body: Center(
          child: Container(
            child: Image(
               image: AssetImage('assets/enConstruccion.jpg'),
            )
          ),
        ),     
    );
  }
}