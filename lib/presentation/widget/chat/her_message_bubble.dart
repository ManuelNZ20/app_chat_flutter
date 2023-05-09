import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

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
          child: const Text(
            'No me quiero ir señor stark',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageChat(),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class _ImageChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "https://yesno.wtf/assets/no/4-122be48db47678331dbef3dd6ac6ff56.gif",
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
