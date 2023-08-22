import 'package:flutter_ecom/src/features/common/domain/entities/base_entity.dart';
import 'package:objectbox/objectbox.dart';

// @Entity()
// class UserEntity {
//   @Id()
//   int id;
//   @Index(type: IndexType.value)
//   String uid;
//   String email;
//   String displayName;
//   String? photoUrl;
//   String? phoneNumber;
//   int? createdAt;
//   int updatedAt;

//   UserEntity(
//       {required this.uid,
//       required this.email,
//       required this.displayName,
//       this.photoUrl,
//       this.phoneNumber,
//       this.createdAt,
//       required this.updatedAt,
//       this.id = 0});
// }

class UserEntity extends BaseEntity {
  int iid;
  @Index(type: IndexType.value)
  String uid;
  String email;
  String displayName;
  String? photoUrl;
  String? phoneNumber;
  int? createdAt;
  int updatedAt;
  @override
  UserEntity(
      {required this.uid,
      required this.email,
      required this.displayName,
      this.photoUrl,
      this.phoneNumber,
      this.createdAt,
      required this.updatedAt,
      this.iid = 0})
      : super(id: iid);
}
