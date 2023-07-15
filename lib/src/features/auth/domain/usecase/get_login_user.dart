
import 'package:flutter_dating_template/src/features/auth/domain/entities/login_user.dart';

import '../../../../shared/domain/repository/auth_repository.dart';
import '../../../../shared/domain/usecase/usecase.dart';

class GetLoginUser implements UseCase<LoginUser, NoParams> {
  final AuthRepository authRepository;

  GetLoginUser(this.authRepository);

  @override
  Future<LoginUser> call(NoParams params) {
    return authRepository.loginUser;
  }
}