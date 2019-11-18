import 'package:flutter/material.dart';
import 'package:orion/pages/dash_page.dart';
import 'package:orion/pages/login_page.dart';
import 'package:orion/pages/pdfView.dart';
import 'package:orion/pages/personal_page.dart';
import 'package:orion/pages/vacaciones_page.dart';
import 'package:orion/providers/recibosInfo.dart';
import 'package:orion/providers/usuarioInfo.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (context) => UsuarioInfo()),
          ChangeNotifierProvider(builder: (context) => RecibosInfo()),
        ],
        child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Material App',
              initialRoute: 'login',
              routes: {
                'login': (BuildContext context) => LoginPage(),
                'menu': (BuildContext context) => Navegador(),
                'pdf': (BuildContext context) => PdfView(),
                'vacaciones': (BuildContext context) => Vacaciones(),
                'notificaciones': (BuildContext context) => CardInfo(),
              },
              theme: ThemeData(
                primaryColor: Colors.lightBlue,
              ),
            )
        );
  }
}
