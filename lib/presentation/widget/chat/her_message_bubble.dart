import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {

  final Message message;

  const HerMessageBubble({super.key, required this.message});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 206, 208, 209),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            message.text,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageChat(
          imageUrl: message.imageUrl!,
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class _ImageChat extends StatelessWidget {
  final String imageUrl;
  const _ImageChat({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * .8,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Text('Cargando mensage...');
        },
      ),
    );
  }
}
