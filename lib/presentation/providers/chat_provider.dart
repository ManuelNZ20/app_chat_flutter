import 'package:app_chat_exercise/config/helpers/get_yes_no_answer.dart';
import 'package:app_chat_exercise/domain/entities/message.dart';
import 'package:flutter/material.dart';

// Puede notificar cuando ahí cambios
class ChatProvider extends ChangeNotifier {
  // permite tener el control de un unico scroll
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola Flynn', fromWho: FromWho.me),
    Message(text: 'Ya  regresante de la red', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    // TODO:implementar método
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    if (text.endsWith('?')) {
      herReplay();
    }
    notifyListeners(); //permite modificar el cambio que  se realiza, notifica a mi clase los cambios
    moveScrollToBottom(); //despues de
  }

  Future<void> herReplay() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position
            .maxScrollExtent, //posicion, quiero que valla a lo maximo que puede dar
        duration: const Duration(milliseconds: 300), //duracion de la animación
        curve: Curves.easeOut); //que tipo de animacion quiero
  }
}
