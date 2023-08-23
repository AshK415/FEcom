import 'package:flutter_ecom/src/features/common/common.dart';

class UserService {
  UserEntity? _currentUser;
  UserEntity? get currentUser => _currentUser;
  late final UserRepository _userRepository;

  Future<void> getCurrentUser(UserRepository rep) async {
    _userRepository = rep;
    _currentUser = await _userRepository.getCurrentUser();
  }
}
