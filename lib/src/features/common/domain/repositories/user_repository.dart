import 'dart:async';

import 'package:flutter_ecom/src/features/common/common.dart';

abstract class UserRepository {
  FutureOr<UserEntity?> getCurrentUser(int id);
  void setCurrentUser(UserEntity entity);
  void updateUser(UserEntity entity);
  void deleteUser(int id, {String? userId});
}
