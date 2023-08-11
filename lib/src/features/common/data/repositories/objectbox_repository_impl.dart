import 'package:flutter_ecom/src/features/common/domain/domain.dart';
import 'package:objectbox/objectbox.dart';

class ObjectBoxRepositoryImpl implements ObjectBoxRepository {
  @override
  Future<int> getCount<T>(Box<T> box) async {
    return box.count();
  }

  @override
  Future<T?> getObjectById<T>(Box<T> box, int id) async {
    return box.get(id);
  }

  @override
  Future<T> getObjectByKey<T>(Box<T> box, String key) async {
    throw UnimplementedError();
  }

  @override
  Future<T?> getObjectByQuery<T>(Box<T> box, Condition<T>? qc) async {
    final qb = box.query(qc).build();
    return qb.findFirst();
  }

  @override
  Stream<List<T>> getObjectStream<T>(Box<T> box, Condition<T>? qc) {
    final qb = box.query(qc);
    return qb.watch(triggerImmediately: true).map((query) => query.find());
  }

  @override
  Future<T> saveAndGetObject<T>(Box<T> box, T object) async {
    return box.putAndGetAsync(object);
  }

  @override
  Future<void> saveObject<T>(Box<T> box, T object) async {
    await box.putAsync(object);
  }

  @override
  Future<int> saveObjectAndGetId<T>(Box<T> box, T object) async {
    return box.putAsync(object);
  }
}
