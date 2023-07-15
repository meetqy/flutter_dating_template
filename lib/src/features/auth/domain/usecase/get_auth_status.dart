
import 'package:flutter_dating_template/src/features/auth/data/datasource/mock_auth_data.dart';

import '../../../../shared/domain/repository/auth_repository.dart';
import '../../../../shared/domain/usecase/usecase.dart';

class GetLoginUser implements UseCase<AuthStatus, NoParams> {
  final AuthRepository authRepository;

  GetLoginUser(this.authRepository);

  @override
  Stream<AuthStatus> call(NoParams params) {
    return authRepository.status;
  }
}