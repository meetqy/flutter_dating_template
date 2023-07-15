// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_dating_template/src/features/auth/data/datasource/mock_auth_data.dart';
import 'package:flutter_dating_template/src/features/auth/domain/entities/login_user.dart';
import 'package:flutter_dating_template/src/shared/domain/entity/user.dart';
import 'package:flutter_dating_template/src/shared/domain/repository/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository {
  final MockauthDatadsource authDatasource;
  AuthRepositoryImp(
    this.authDatasource,
  );

  @override
  Stream<AuthStatus> get status => authDatasource.status;

  @override
  Future<LoginUser> get loginUser => authDatasource.loginUser;

  @override
  Future<void> login({required Username username, required Password password}) {
    return authDatasource.login(username: username, password: password);
  }

  @override
  Future<void> logout() {
    return authDatasource.logout();
  }

  @override
  Future<void> signup({required LoginUser loginUser}) {
    return authDatasource.signup(loginUser: loginUser);
  }
}
