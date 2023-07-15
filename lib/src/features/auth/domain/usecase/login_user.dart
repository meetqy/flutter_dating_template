import 'package:flutter_dating_template/src/features/auth/domain/entities/login_user.dart';
import 'package:flutter_dating_template/src/shared/domain/entity/user.dart';
import 'package:flutter_dating_template/src/shared/domain/repository/auth_repository.dart';
import 'package:flutter_dating_template/src/shared/domain/usecase/usecase.dart';

class LoginUser implements UseCase<void, LoginUserParams> {
  final AuthRepository authRepository;

  LoginUser(this.authRepository);

  @override
  Future<void> call(LoginUserParams params) {
    return authRepository.login(
        username: params.username, password: params.password);
  }
}

class LoginUserParams extends Params {
  final Username username;
  final Password password;

  LoginUserParams({required this.username, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [username, password];
}
