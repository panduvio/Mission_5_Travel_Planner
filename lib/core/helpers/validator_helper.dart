class ValidatorHelper {
  ValidatorHelper._(); // prevent instantiation

  static String? fullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full Name is required';
    }

    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }

  static String? Function(String?) confirmPassword(String password) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return 'Password is required';
      }

      if (value.length < 8) {
        return 'Password must be at least 8 characters';
      }

      if (value != password) {
        return 'Password doesn\'t match';
      }

      return null;
    };
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone is required';
    }

    if (value.length < 8) {
      return 'Invalid phone format';
    }

    return null;
  }
}
