import 'package:dartz/dartz.dart';

import '../utils/valid_text_field.dart';
import 'reg_exp.dart';

class InputValidate {
  const InputValidate();

  static Either<Invalid, Valid> commonValidate(String value) {
    return validateEmpty(value).fold((l) => Left(l), (r) => Right(r));
  }

  static Either<Invalid, Valid> validateEmpty(String value) {
    if (value.isEmpty) {
      return Left(Invalid("Input validate require not empty"));
    }
    return Right(Valid());
  }

  static Either<Invalid, Valid> validateEmail(String value) {
    bool emailValid = RegExpApp.validateEmail.hasMatch(value);
    if (emailValid) {
      return Right(Valid());
    }
    return Left(Invalid("Wrong format email"));
  }

  static Either<Invalid, Valid> validatePhone(String value) {
    bool emailValid = RegExpApp.validatePhoneNumber.hasMatch(value);
    if (emailValid) {
      return Right(Valid());
    }
    return Left(Invalid("Wrong format phone number"));
  }

  static Either<Invalid, Valid> validateConfirmPassword(
      String value, String password, String confirmPassword) {
    if (password == confirmPassword) {
      return Right(Valid());
    }
    return Left(Invalid("Input validate password confirm not matching"));
  }

  static Either<Invalid, Valid> validatePasswordLengthAndAlphabets(
      String value) {
    bool passwordValidLength = RegExpApp.validateCharacter.hasMatch(value);
    bool passwordValidAlphabets =
        RegExpApp.passwordValidAlphabets.hasMatch(value);
    if (passwordValidLength && passwordValidAlphabets) {
      return Right(Valid());
    } else {
      if (passwordValidLength == false) {
        return Left(Invalid("Input validate password length too short"));
      } else {
        return Left(Invalid("Input validate password alphabets"));
      }
    }
  }
}
