import 'package:chat_app/widgets/messages_widget.dart';
import 'package:chat_app/widgets/new_message_widget.dart';
import 'package:chat_app/widgets/profile_header_widget.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class ChatPage extends StatefulWidget {
  final User user;

  const ChatPage({
    required this.user,
     Key? key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            children: [
              ProfileHeaderWidget(name: widget.user.name.toString()),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: MessagesWidget(idUser: widget.user.idUser.toString()),
                ),
              ),
              NewMessageWidget(idUser: widget.user.idUser.toString())
            ],
          ),
        ),
      );
}