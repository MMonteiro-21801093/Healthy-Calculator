import 'package:flutter/cupertino.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../models/user.dart';
import '../services/service.dart';

class UserController extends ChangeNotifier  {
  final _id = RxNotifier<int?>(0);
  /*
  final _age = RxNotifier<int>(0);
  final _weight = RxNotifier<double>(0);
  final _height = RxNotifier<int>(0);
  final _hip = RxNotifier<int>(0);
  final _sex = RxNotifier<String>('');

  void setAge(int value)=> _age.value = value;
  void setWeight(double value)=> _weight.value = value;
  void setHeight(int value)=> _height.value = value;
  void setHip(int value)=> _hip.value = value;
  void setSex(String value)=> _sex.value = value;*/
  int? get id => _id.value;

  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final hipController = TextEditingController();
  final sexController = TextEditingController();

Future<void> getUser()async{
  final Services _service = new Services ();
  User? user = await _service.getUser();

/*  _age.value = user!.getAge;
  _weight.value = user!.getWeight;
  _height.value = user!.getHeight;
  _hip.value = user!.getHip;
  _sex.value = user!.getSex;*/
  if(user !=null){
   _id.value = user!.getId;
    ageController.text = user!.getAge.toString();
    weightController.text = user!.getWeight.toString();
    heightController.text = user!.getHeight.toString();
    hipController.text = user!.getHip.toString();
    sexController.text = user!.getSex.toString();
  }
  notifyListeners();
}

  Future<void> insertNewUser(User user) async {
    final Services _service = new Services ();
    await _service.insert(user);
  }

  Future<void> updateUser(User user) async {
    final Services _service = new Services ();
    await _service.update(user);
  }
}