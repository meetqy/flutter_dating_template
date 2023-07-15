import 'package:flutter_dating_template/src/shared/domain/entity/user.dart';
import 'package:formz/formz.dart';

class LoginUser extends User {
  final Email? email;
  const LoginUser(
      {this.email,
      required String id,
      required Username username,
      super.followers,
      super.imgpath,
      super.matchedUser})
      : super(id: id, username: username);
  static const empty =
      LoginUser(id: '-', username: Username.pure(), email: Email.pure());

  @override
  List<Object?> get props => [id, username, email];

  LoginUser copywith(
      {String? id,
      Username? username,
      Email? email,
      String? imgpath,
      int? followers,
      List<String>? matchedUser}) {
    return LoginUser(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      imgpath: imgpath ?? this.imgpath,
      followers: followers ?? this.followers,
      matchedUser: matchedUser ?? this.matchedUser,
    );
  }
}

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  @override
  PasswordValidationError? validator(String value) {
    return _passwordRegExp.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}
