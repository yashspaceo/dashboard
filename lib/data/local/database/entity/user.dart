import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String? name;
  final String? number;
  final String? email;
  final String? password;

  User({
    this.id,
    required this.name,
    required this.number,
    required this.email,
    required this.password,
  });
}
