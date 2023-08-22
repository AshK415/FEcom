import 'package:flutter_ecom/src/features/common/data/data.dart';
import 'package:flutter_ecom/src/features/common/domain/domain.dart';
import 'package:flutter_ecom/src/shared/shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectbox_repository.g.dart';

@Riverpod(keepAlive: true)
ObjectBoxRepository objectBoxRepository(ObjectBoxRepositoryRef ref) {
  final ob = ref.watch(objectBoxServiceProvider);
  if (ob.value != null) {
    return ObjectBoxRepositoryImpl(objectBoxService: ob.value!);
  } else {
    throw UnimplementedError();
  }
  // ref.listen(objectBoxServiceProvider, (previous, next) {
  //   if(next.value!=null){
  //     return ObjectBoxRepositoryImpl(objectBoxService: next.value);
  //   }
  // })
}
// ObjectBoxRepositoryImpl(
//     objectBoxService: ref.watch(objectBoxServiceProvider).asData!.value);
