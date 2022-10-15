// database.dart
//Run the generator with flutter packages pub run build_runner build.
// automatically run it, whenever a file changes,
// use flutter packages pub run build_runner watch.

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../dao/dao.dart';
import '../models/user.dart';


part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}