class Posts {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Posts({
    this.userId,
    this.id,
    this.title,
    this.body,
  });
  factory Posts.fromMap(Map<dynamic, dynamic> map) {
    return Posts(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }
}
