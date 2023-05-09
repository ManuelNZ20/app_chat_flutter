import 'package:flutter/material.dart';

class ChatTextFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const ChatTextFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    final textController = TextEditingController();

    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: Colors.transparent),
    );

    final inputDecoration = InputDecoration(
        hintText: 'Ingresa un texto...',
        filled: true,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                  onPressed: () {
                    final textValue = textController.value.text;
                    textController.clear();
                    focusNode.requestFocus();
                    onValue(textValue);
                  },
                  icon: const Icon(Icons.send_rounded))),
        ));

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      textAlignVertical: TextAlignVertical.center,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        onValue(value);
        focusNode.requestFocus();
      },
    );
  }
}
