import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';

//si usamos async await debemos devolver un Future
Future<void> main() async {
  // la siguiente línea es necesario [no tengo idea porqué pero lo pone], si no está genera error. Segun parece, si se desea correr binarios antes de correr el app() es necesario.
  //ya que estamos inicializando un plugin, se debe correr el WidgetsFlutterBinding entes.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tracker',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SignInPage(),
    );
  }
}
