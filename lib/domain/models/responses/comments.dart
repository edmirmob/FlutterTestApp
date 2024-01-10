class Comments {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  Comments({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });
  factory Comments.fromMap(Map<dynamic, dynamic> map) {
    return Comments(
      postId: map['postId'],
      id: map['id'],
      name: map['name'],
      email: map['email'],
      body: map['body'],
    );
  }
}
