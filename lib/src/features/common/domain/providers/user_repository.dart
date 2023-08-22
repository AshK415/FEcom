import 'package:flutter_ecom/src/features/common/common.dart';
import 'package:flutter_ecom/src/features/common/data/repositories/user_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  final ob = ref.watch(objectBoxRepositoryProvider);
  return UserRepositoryImpl(objectBoxRepository: ob);
}
