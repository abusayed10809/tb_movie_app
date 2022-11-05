class LoginRequestParams{
  final String userName;
  final String password;

  LoginRequestParams({required this.userName, required this.password,});

  Map<String, dynamic> toJson() => {
    'userName': userName,
    'password': password,
  };

}