import '../../../features/auth/data/datasource/mock_auth_data.dart';
import '../../../features/auth/domain/entities/login_user.dart';
import '../entity/user.dart';

abstract class AuthRepository {
  Stream<AuthStatus> get status;
  Future<LoginUser> get loginUser;
  Future<void> signup({required LoginUser loginUser});
  Future<void> login({required Username username, required Password password});
  Future<void> logout();
}
