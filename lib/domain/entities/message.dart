enum FromWho { me, hers }

class Message {
  
  final String? imgeUrl;
  final String text;
  final FromWho fromWho;
// Provider gestor de estados
  Message({required this.text, this.imgeUrl, required this.fromWho});


}
