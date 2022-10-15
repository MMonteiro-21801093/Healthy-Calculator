import 'package:healthy_calculator/models/user.dart';

import '../database/database.dart';

class Services{
  Future<AppDatabase> getDB() async{
    return  await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  Future<User?> getUser() async {
    final _appDatabase= await getDB();
    return _appDatabase.userDao.findAllUser();
  }
  Future<void> insert(user) async {
    final _appDatabase= await getDB();
    _appDatabase.userDao.insertUser(user);
  }
  Future<void> update(user) async {
    final _appDatabase= await getDB();
    _appDatabase.userDao.updateUser(user);
  }
}