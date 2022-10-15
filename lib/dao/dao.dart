
import 'package:floor/floor.dart';

import '../models/user.dart';


@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<User?> findAllUser();

  @Query('SELECT * FROM User WHERE id = :id')
  Stream<User?> findUserById(int id);

  @Query('DELETE FROM User WHERE id = :id')
  Future<void> delete(int id);

  @update
  Future<void> updateUser(User user);

  @insert
  Future<void> insertUser(User user);

}