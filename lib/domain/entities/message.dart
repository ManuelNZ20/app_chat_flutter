enum FromWho { me, hers }

class Message {
  
  final String? imageUrl;
  final String text;
  final FromWho fromWho;
// Provider gestor de estados
  Message({required this.text, this.imageUrl, required this.fromWho});


}
