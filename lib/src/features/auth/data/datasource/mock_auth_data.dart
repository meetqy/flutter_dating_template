import 'dart:async';

import 'package:flutter_dating_template/src/features/auth/domain/entities/login_user.dart';
import 'package:flutter_dating_template/src/shared/domain/entity/user.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

abstract class MockauthDatadsource {
  Stream<AuthStatus> get status;
  Future<LoginUser> get loginUser;
  Future<void> signup({required LoginUser loginUser});
  Future<void> login({required Username username, required Password password});
  Future<void> logout();
}

class MockAuthDataImp extends MockauthDatadsource {
  MockAuthDataImp({CacheClient? cache}) : _cache = cache ?? CacheClient();
  final CacheClient _cache;
  final _controller = StreamController<AuthStatus>();

  static const userCacheKey = '_user_cache_key';

  @override
  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  Future<void> login({required Username username, required Password password}) {
    return Future.delayed(Duration(milliseconds: 300), () {
      for (final user in _allUsers) {
        if (user.username.value == username.value) {
          _updateLoggedInUser(id: user.id,username: user.username,);
          _controller.add(AuthStatus.authenticated);
          return;
        }
      }
    });
  }

  @override
  Future<LoginUser> get loginUser {
    return Future.delayed(Duration(milliseconds: 300), () {
      return _cache.read(key: userCacheKey) ?? LoginUser.empty;
      // return LoginUser.empty;
    });
  }

  @override
  Future<void> logout() {
    return Future.delayed(Duration(milliseconds: 300), () {
       _cache.write(
      key: userCacheKey,
      value: LoginUser.empty
    );
      _controller.add(AuthStatus.unauthenticated);
    });
  }

  @override
  Future<void> signup({required LoginUser loginUser}) {
    return Future.delayed(Duration(milliseconds: 300), () {
      _allUsers.add(loginUser);
      _updateLoggedInUser(
          id: loginUser.id,
          username: loginUser.username,
          email: loginUser.email);
      _controller.add(AuthStatus.unauthenticated);
    });
  }

  void _updateLoggedInUser({
    String? id,
    Username? username,
    Email? email,
  }) {
    LoginUser loginUser = _cache.read(key: userCacheKey) ?? LoginUser.empty;

    _cache.write(
      key: userCacheKey,
      value: loginUser.copywith(id: id, username: username, email: email),
    );
  }

  final List<User> _allUsers = <User>[
    const User(
        id: 'User_1',
        username: Username.dirty('Massimo'),
        imgpath: 'assets/images/image_1.jpg'),
    const User(
        id: 'User_2',
        username: Username.dirty('Shara'),
        imgpath: 'assets/images/image_2.jpg'),
    const User(
        id: 'User_3',
        username: Username.dirty('John'),
        imgpath: 'assets/images/image_3.jpg')
  ];
}

class CacheClient {
  CacheClient() : _cache = <String, Object>{};
  final Map<String, Object> _cache;

  void write<T extends Object>({required String key, required T value}) {
    _cache[key] = value;
  }

  T? read<T extends Object>({required String key}) {
    final value = _cache[key];
    if (value is T) return value;
    return null;
  }
}
