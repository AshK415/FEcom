import 'dart:async';

import 'package:flutter_ecom/src/features/common/common.dart';
import 'package:objectbox/objectbox.dart';

class UserRepositoryImpl implements UserRepository {
  final ObjectBoxRepository objectBoxRepository;
  late Box<UserEntity> _userBox;
  UserRepositoryImpl({required this.objectBoxRepository}) {
    _userBox = objectBoxRepository.getBoxByName('') as Box<UserEntity>;
  }
  @override
  void deleteUser(int id, {String? userId}) {
    _userBox.remove(id);
  }

  @override
  FutureOr<UserEntity?> getCurrentUser(int id) async {
    return _userBox.get(id);
  }

  @override
  void setCurrentUser(UserEntity entity) {
    _userBox.put(entity);
  }

  @override
  void updateUser(UserEntity entity) {
    _userBox.put(entity);
  }
}
