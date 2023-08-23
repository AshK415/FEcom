import 'package:flutter_ecom/objectbox.g.dart';
import 'package:flutter_ecom/src/features/common/domain/domain.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBoxService {
  late final Store _store;
  late final Box<UserEntity> _userBox;
  Box<UserEntity> get userBox => _userBox;
  ObjectBoxService._create(this._store) {
    _userBox = Box<UserEntity>(_store);
  }

  static Future<ObjectBoxService> init() async {
    final store = await openStore(
        directory: p.join(
            (await getApplicationDocumentsDirectory()).path, "flutter-ecom"));
    return ObjectBoxService._create(store);
  }
}
