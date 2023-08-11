import 'package:flutter_ecom/src/features/common/data/data.dart';
import 'package:flutter_ecom/src/features/common/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectbox_repository.g.dart';

@Riverpod(keepAlive: false)
ObjectBoxRepository objectBoxRepository(ObjectBoxRepositoryRef ref) =>
    ObjectBoxRepositoryImpl();
