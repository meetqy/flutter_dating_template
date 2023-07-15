import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class User extends Equatable {
  final String id;
  final Username username;
  final int followers;
  final List<String> matchedUser;
  final String? imgpath;

  const User(
      {required this.id,
      required this.username,
      this.followers = 0,
      this.matchedUser = const [],
      this.imgpath});

  static const empty = User(id: 'user_0', username: Username.pure());

  @override
  List<Object?> get props => [id, username, followers, matchedUser, imgpath];
}

enum UsernameValidationError { invalid }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');
  const Username.dirty([String value = '']) : super.dirty(value);

  static final RegExp _usernameRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  @override
  UsernameValidationError? validator(String value) {
    return _usernameRegExp.hasMatch(value)
        ? null
        : UsernameValidationError.invalid;
  }
}
