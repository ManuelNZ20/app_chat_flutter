import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(23, 120, 231, 1),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
             message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
