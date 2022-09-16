import 'package:chat_app/provider/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class GoogleSignupWidget extends StatelessWidget {
  const GoogleSignupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            const Text(
              "  Welcome to Chat App",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            
            const Icon(
              Icons.chat,
              size: 42,
            ),
            const SizedBox(
              height: 18,
            ),
            ElevatedButton.icon(
              
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
              icon: const FaIcon(

                FontAwesomeIcons.google,size: 24,
                
              ),
              
              label: const Text("Sign In With Google ",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      );
}
