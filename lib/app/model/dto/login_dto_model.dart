class LoginDTO {
  String user;
  String pass;

  LoginDTO({
    required this.user,
    required this.pass,
  });

  Map<String, dynamic> toJson() => {
        'user': user,
        'pass': pass,
      };
}
