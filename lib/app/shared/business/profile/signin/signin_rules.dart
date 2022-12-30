class SigninRules {
  static bool isValidEmail(String? str) => (str?.contains("@") ?? false) && (str?.contains(".com") ?? false);
}