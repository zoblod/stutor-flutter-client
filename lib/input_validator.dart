// validators for user input
extension TextValidator on String {
  // regex to validate email accept all emails however must terminate in .edu
  bool isValidEmail() {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.edu$").hasMatch(this);
  }

  // regex to validate. accept all characters and be at least 6 characters or less than 50 characters
  bool isValidPassword() {
    return RegExp(r"^[a-zA-Z0-9.].{6,50}$").hasMatch(this);
  }
}
