import 'package:objectbox/objectbox.dart';

abstract class ObjectBoxRepository {
  Future<void> saveObject<T>(Box<T> box, T object);
  Future<int> saveObjectAndGetId<T>(Box<T> box, T object);
  Future<T> saveAndGetObject<T>(Box<T> box, T object);
  Stream<List<T>> getObjectStream<T>(Box<T> box, Condition<T>? qc);
  Future<T?> getObjectById<T>(Box<T> box, int id);
  Future<T?> getObjectByQuery<T>(Box<T> box, Condition<T>? qc);
  Future<T?> getObjectByKey<T>(Box<T> box, String key);
  Future<int> getCount<T>(Box<T> box);
}
