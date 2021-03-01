import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        elevation: 10.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 48.0),
          CustomRaisedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("images/google-logo.png"),
                Text("Sign in With Google"),
                Opacity(
                    opacity: 0.0, child: Image.asset("images/google-logo.png")),
              ],
            ),
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: "Sign in With Google",
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: "Sign in With Facebook",
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: "Sign in With Email",
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          Text(
            "or",
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: "Go anonimous",
            textColor: Colors.black,
            color: Colors.lime[700],
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void _signInWithGoogle() {
    //TODO: Auth (de Authentication) with google
  }
}
