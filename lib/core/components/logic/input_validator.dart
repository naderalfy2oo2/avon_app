class InputValidator {
  static String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'phone must be Not Empty';
    } else if (value.length < 10) {
      return 'phone must be 10 digits';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'password must be Not Empty';
    } else if (value.length < 7) {
      return 'password must be  at least 7 digits';
    }
    return null;
  }
}
