class ChatMessageEntity{

  String text;
  String? imageUrl;
  String id;
  int createdAt;
  Author athor;

  ChatMessageEntity(
      { required this.text,
        required this.id,
        required this.createdAt,
        this.imageUrl,
        required this.athor
      });

}


class Author {
  String userName;

  Author({required this.userName});
}