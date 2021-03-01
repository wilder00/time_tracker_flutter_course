import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          //flat button no tiene edges a diferencia de raisebutton que sí la tiene
          FlatButton(
            child: Text(
              "Logout",
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
