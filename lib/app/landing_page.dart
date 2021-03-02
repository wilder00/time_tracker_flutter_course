import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/home_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.authStateChange(),
      //inicialData: //puede sustituir la comprobación de connectionState
      builder: (context, snapshot) {
        //connectionState nos dice si el stream comenzó a emitir eventos o no
        if (snapshot.connectionState == ConnectionState.active) {
          final User user = snapshot.data;
          //snapshot.hasError //tambien se puede obtener los errores enviado por stream con hasError
          if (user == null) {
            return SignInPage(
              //usamos auth, porque auth está en el statefull widget y no este widget, por ello hacemos referencia al widget original
              auth: auth,
            );
          }
          return HomePage(
            auth: auth,
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
