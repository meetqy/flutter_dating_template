
import '../../../../shared/domain/repository/auth_repository.dart';
import '../../../../shared/domain/usecase/usecase.dart';

class LogoutUser implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  LogoutUser(this.authRepository);

  @override
  Future<void> call(NoParams params) {
    //TODO:　add another repo to save the info a database when he regi
    return authRepository.logout();
  }
}