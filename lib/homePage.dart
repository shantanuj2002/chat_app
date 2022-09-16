import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/chats_page.dart';
import 'package:chat_app/pages/loggedin.dart';
import 'package:chat_app/widgets/google_signup_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return ChatsPage();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Something went Wrong"),
                );
              } else {
                return GoogleSignupWidget();
              }
            }),
      ),
    );
  }
}