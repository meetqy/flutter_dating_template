import 'package:flutter_dating_template/src/features/auth/domain/entities/login_user.dart';
import 'package:flutter_dating_template/src/shared/data/datasource/user_data.dart';
import 'package:flutter_dating_template/src/shared/domain/entity/user.dart';
import 'package:flutter_dating_template/src/shared/domain/repository/auth_repository.dart';
import 'package:flutter_dating_template/src/shared/domain/usecase/usecase.dart';

class SignupUser implements UseCase<void, SignupUserParams> {
  final AuthRepository authRepository;

  SignupUser(this.authRepository);

  @override
  Future<void> call(SignupUserParams params) {
    //TODO:　add another repo to save the info a database when he regi
    return authRepository.signup(loginUser: params.user);
  }
}

class SignupUserParams extends Params {
  final LoginUser user;

  SignupUserParams({required this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
