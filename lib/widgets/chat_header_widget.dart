import 'package:chat_app/model/user.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ChatHeaderWidget extends StatelessWidget {
  final List<User> users;

  const ChatHeaderWidget({
    required this.users,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        // color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        //width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Container(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.logout();
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12),
                        child: CircleAvatar(
                          radius: 24,

                          //child: FaIcon(FontAwesomeIcons.exit),
                          child: Icon(Icons.logout_rounded),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChatPage(user: users[index]),
                          ));
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage:
                              NetworkImage(user.urlAvatar.toString()),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.chat,
                    size: 32,
                  ),
                  Text(
                    'Chat App',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
