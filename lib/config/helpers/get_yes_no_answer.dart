// es la respuesta de la petición

import 'package:app_chat_exercise/domain/entities/message.dart';
import 'package:app_chat_exercise/infrastucture/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");
    // throw UnimplementedError();

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
