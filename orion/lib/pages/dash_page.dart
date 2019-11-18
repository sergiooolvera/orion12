import 'package:flutter/material.dart';

class Navegador extends StatelessWidget {
  const Navegador({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      margin: EdgeInsets.symmetric(vertical: 1.0),
      accountName: Container( margin: EdgeInsets.symmetric(: .0), child: Text('User Name')),
      accountEmail: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('user.name@email.com'),        
        ],
      ),
      currentAccountPicture: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                                image: AssetImage('assets/empleado.jpg'),
                                fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 7.0, color: Colors.black)
                            ]),
                      ),
                    );
   
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: Text('Consultar Recibos'),
          onTap: () => Navigator.of(context).pushNamed('pdf'),
        ),
        ListTile(
          title: Text('Solicitar Vacaciones'),
          onTap: () => Navigator.of(context).pushNamed('vacaciones'),
        ),
        ListTile(
          title: Text('Notificaciones'),
          onTap: () => Navigator.of(context).pushNamed('notificaciones'),
        ),
        ListTile(
          title: Text('other drawer item'),
          onTap: () {},
        ),
      ],
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('Informacíon personal'),
        ),
        body: Container(    
          alignment: Alignment.topCenter,     
          child: Card(
            margin: EdgeInsets.only(top: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                                image: DecorationImage(
                                       image: AssetImage('assets/empleado.jpg'),
                                        fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 7.0, color: Colors.black)
                            ]),
                      ),
                FlatButton(
                        child: const Text('BUY TICKETS'),
                        onPressed: () {/* ... */},
                      ),
                FlatButton(
                        child: const Text('LISTEN'),
                        onPressed: () {/* ... */},
                      ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: drawerItems,
        ));
  }
}
