import 'package:chat_app/model/user.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:flutter/material.dart';

class ChatBodyWidget extends StatelessWidget {
  final List<User> users;

  const ChatBodyWidget({
    required this.users,
     Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: buildChats(),
        ),
      );

  Widget buildChats() => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final user = users[index];

          return Container(
            height: 75,
            child: Card(
              child: ListTile(
                
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChatPage(user: user),
                  ));
                },
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(user.urlAvatar.toString()),
                ),
                title: Text(user.name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),
              ),
            ),
          );
        },
        itemCount: users.length,
      );
}