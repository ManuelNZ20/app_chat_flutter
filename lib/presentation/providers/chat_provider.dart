import 'package:app_chat_exercise/domain/entities/message.dart';
import 'package:flutter/material.dart';

// Puede notificar cuando ahí cambios
class   ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola Flynn', fromWho: FromWho.me),
    Message(text: 'Ya  regresante de la red', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    // TODO:implementar método
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    
    notifyListeners();//permite modificar el cambio que  se realiza

  }
}
