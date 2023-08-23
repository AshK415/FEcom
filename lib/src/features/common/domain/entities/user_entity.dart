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

@Entity()
class UserEntity {
  @Id()
  int id;
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
      this.id = 0});
}
