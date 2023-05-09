import 'package:app_chat_exercise/domain/entities/message.dart';
import 'package:app_chat_exercise/presentation/providers/chat_provider.dart';
import 'package:app_chat_exercise/presentation/widget/chat/her_message_bubble.dart';
import 'package:app_chat_exercise/presentation/widget/chat/my_message_bubble.dart';
import 'package:app_chat_exercise/presentation/widget/shared/text_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/originals/6c/e4/bc/6ce4bc56de3dc654ec0d1c6c1579e596.jpg'),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Friend',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Online',
                  style: TextStyle(
                      color: Color.fromARGB(141, 224, 224, 224), fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(23, 120, 231, 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.navigate_before_rounded,
                  size: 30, color: Colors.grey.shade300)),
        ),
        actions: [
          _IconButtonBar(
            icon: Icons.videocam_outlined,
            color: Colors.grey.shade300,
            sizeIcon: 30,
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: _IconButtonBar(
              icon: Icons.local_phone_outlined,
              color: Colors.grey.shade300,
              sizeIcon: 30,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
              child: ListView.builder(
            itemCount: chatProvider.messageList.length,
            itemBuilder: (context, index) {
              final message = chatProvider.messageList[index];

              return (message.fromWho == FromWho.hers)
                  ? const HerMessageBubble()
                  : MyMessageBubble(
                      message: message,
                    );
            },
          )),
          ChatTextFieldBox(
            onValue: (value) => chatProvider.sendMessage(value),
          ),
        ]),
      ),
    );
  }
}

class _IconButtonBar extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double sizeIcon;
  final VoidCallback onPressed;

  const _IconButtonBar(
      {required this.icon,
      required this.color,
      required this.sizeIcon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: sizeIcon,
      color: color,
    );
  }
}
