import 'package:objectbox/objectbox.dart';

@Entity()
class BaseEntity {
  @Id()
  int id;

  BaseEntity({required this.id});
}
