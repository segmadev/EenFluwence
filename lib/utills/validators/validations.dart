import 'package:enfluwence/http/auth/auth.dart';

class AValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required.';
    }

    // Regular expression for username validation
    final usernameRegExp = RegExp(
        r'[\^$*\[\]{}()?\-"!@#%&/\,><:;~`+=' // <-- Notice the escaped symbols
        "'" // <-- ' is added to the expression
        ']');
    if (usernameRegExp.hasMatch(value)) {
      return 'Invalid username';
    }

    if (value.contains(' ')) {
      return 'username can\'t have a space';
    }

    if (value.length < 3) {
      return 'username must be at least 3 characters long.';
    }
    // var response = await AuthApi.validateUsername(value);
    // if (response.statusCode == 200 || response.statusCode == 201) {
    // } else if (response.statusCode == 400) {
    //   return "Username Taken";
    // } else {
    //   return "Can not validate username.";
    // }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }

    return null;
  }

  static String? validateUrl(String? value) {
    if (value == null || value.length < 6) {
      return 'Url is required.';
    }

    String pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = new RegExp(pattern);

    if (!regExp.hasMatch(value!)) {
      return 'Please enter valid url';
    }
    return null;

// Add more custom validators as needed for your specific requirements.
  }
}
