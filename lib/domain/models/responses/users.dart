class Users {
  final int? id;
  final String? name;
  final String? username;
  final String? email;

  Users({this.id, this.name, this.username, this.email});
  factory Users.fromMap(Map<dynamic, dynamic> map) {
    return Users(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
    );
  }
}
