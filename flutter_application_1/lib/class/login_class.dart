
class Login_class {
  String username;
  String password;
  Login_class({required this.username, required this.password});

  void inputValues(String uname, String pword) {
    username = uname;
    password = pword;
  }
}
