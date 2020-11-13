class PasswordCheck {
  List<String> err = [];
  double strength = 0;

  double validatePassword(String password) {
    //reset the errors
    err.clear();
    _validatePasswordLength(password);
    _validateNumbers(password);
    _validateUppercaseChars(password);
    _validateSpecialChars(password);

    if (err.length == 0) {
      strength = 1;
    }
    return strength;
  }

  _validatePasswordLength(String password) {
    double deduction = 0;
    if (password.length == 0) {
      deduction = 1;
    } else if (password.length <= 3) {
      deduction = 0.45;
    } else if (password.length >= 4 && password.length < 10) {
      deduction = 0.25;
    } else {
      deduction = 0;
      return;
    }

    return _constructError(deduction, 'letters');
  }

  _validateSpecialChars(String password) {
    final RegExp specialChars = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    double deduction = 0;
    int count = 0;
    List<String> pass = password.split('');
    pass.forEach((element) {
      if (specialChars.hasMatch(element)) {
        count++;
      }
    });

    if (count == 0) {
      deduction = 0.30;
    } else if (count <= 3) {
      deduction = 0.20;
    } else {
      deduction = 0;
      return;
    }

    return _constructError(deduction, 'special characters');
  }

  _validateUppercaseChars(String password) {
    final RegExp uppercase = RegExp('[A-Z]');
    double deduction = 0;
    int count = 0;
    List<String> pass = password.split('');
    pass.forEach((element) {
      if (uppercase.hasMatch(element)) {
        count++;
      }
    });

    if (count == 0) {
      deduction = 0.20;
    } else if (count <= 4) {
      deduction = 0.10;
    } else {
      deduction = 0;
      return;
    }

    return _constructError(deduction, 'uppercase letters');
  }

  _validateNumbers(String password) {
    final RegExp numberRegExp = RegExp(r'\d');
    double deduction = 0;
    int count = 0;
    List<String> pass = password.split('');
    pass.forEach((element) {
      if (numberRegExp.hasMatch(element)) {
        count++;
      }
    });

    if (count == 0) {
      deduction = 0.25;
    } else if (count <= 2) {
      deduction = 0.15;
    } else {
      deduction = 0;
      return;
    }

    return _constructError(deduction, 'numbers ');
  }

  _constructError(double deduction, String forElement) {
    deduction = deduction;
    err.add('Please add more $forElement to your password');
    _caclulatePasswordStrength(deduction);
  }

  _caclulatePasswordStrength(double deductions) {
    double score = 1;
    // calculate the deduction and return the password strength
    score -= deductions;
    strength = score;
  }
}

PasswordCheck passwordCheck = PasswordCheck();
