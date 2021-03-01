import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/home_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  @override
  void initState() {
    super.initState();
    //cada vez que se inicialice este widget, se actualizará el _user por la instancia de Firebase
    _updateUser(widget.auth.currentUser);
  }

  /// Permite actualizar la variable [_user]
  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: widget.auth.authStateChange(),
      //inicialData: //puede sustituir la comprobación de connectionState
      builder: (context, snapshot) {
        //connectionState nos dice si el stream comenzó a emitir eventos o no
        if (snapshot.connectionState == ConnectionState.active) {
          final User user = snapshot.data;
          //snapshot.hasError //tambien se puede obtener los errores enviado por stream con hasError
          if (user == null) {
            return SignInPage(
              //usamos widget.auth, porque auth está en el statefull widget y no este widget, por ello hacemos referencia al widget original
              auth: widget.auth,
              onSignIn: _updateUser,
            );
          }
          return HomePage(
            auth: widget.auth,
            onSignOut: () => _updateUser(null),
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
