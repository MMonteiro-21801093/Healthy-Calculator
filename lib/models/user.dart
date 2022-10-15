import 'dart:io';
import 'package:floor/floor.dart';


@entity
class User{
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int age;
  final double weight;
  final int height;
  final int hip;
  final String sex;

  User(this.id, this.age, this.weight, this.height, this.hip, this.sex);

  int? get getId => id;
  int get getAge => age;
  double get getWeight => weight;
  int get getHeight => height;
  int get getHip => hip;
  String get getSex => sex;
 /* set setTitle(String value) =>  title = value;
  set setDescription(String value) =>  description = value;*/
}