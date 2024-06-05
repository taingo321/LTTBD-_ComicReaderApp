class Users {
  String username;
  String password;
  // String email;

  Users({
    required this.username,
    required this.password,
    // required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      // 'email': email,
    };
  }
}
