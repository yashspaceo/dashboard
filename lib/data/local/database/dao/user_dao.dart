import 'package:floor/floor.dart';

import '../entity/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();

  @insert
  Future<void> insertUser(User user);

  @Query('DELETE FROM User WHERE id=:id')
  Future<void> deleteUserById(int id);

  @Query('DELETE FROM User')
  Future<void> deleteAllUsers();
}
