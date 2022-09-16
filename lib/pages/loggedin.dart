import 'package:chat_app/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class loggedin extends StatefulWidget {
  const loggedin({Key? key}) : super(key: key);

  @override
  State<loggedin> createState() => _loggedinState();
}

class _loggedinState extends State<loggedin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: (){
          final provderlogout=Provider.of<GoogleSignInProvider>(context,listen: false);
          provderlogout.logout();
        }, child: Text("logout")),
        Center(child: CircularProgressIndicator()),
      ],
    );
  }
}