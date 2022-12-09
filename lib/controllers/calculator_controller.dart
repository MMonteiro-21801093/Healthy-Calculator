import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:rx_notifier/rx_notifier.dart';
import '../models/user.dart';
import '../services/service.dart';

class CalculatorController extends ChangeNotifier  {
  final _adjustedWeight = RxNotifier<String>('');
  final _idealWeight = RxNotifier<String>('');
  final _imc = RxNotifier<String>('');
  final _tmb = RxNotifier<String>('');
  final _iac = RxNotifier<String>('');
  final _sex = RxNotifier<String>('');

  String get adjustedWeight => _adjustedWeight.value;
  String get idealWeight => _idealWeight.value;
  String get imc => _imc.value;
  String get tmb => _tmb.value;
  String get iac => _iac.value;
  String get sex => _sex.value;

  Future<void> calculateAdjustedWeight() async {
    User? user = await getUser();
    if(user!=null){
      double idealWeight =0;
      if(user.getSex=="Masculino"){
        idealWeight = 52 + (0.75 *(user.getHeight - 152.4));
      }else{
        idealWeight = 49 + (0.67 *(user.getHeight - 152.4));
      }
      _adjustedWeight.value = ((user.getWeight -idealWeight )* 0.25 + idealWeight).toStringAsFixed(2) + "Kg";
      notifyListeners();
    }

  }
  Future<void> calculateIdealWeight() async {
    User? user = await getUser();
    if(user!=null){
      double idealWeight =0;
      if(user.getSex=="Masculino"){
        idealWeight = 52 + (0.75 *(user.getHeight - 152.4));
      }else{
        idealWeight = 49 + (0.67 *(user.getHeight - 152.4));
      }
      _idealWeight.value = idealWeight.toStringAsFixed(2) + "Kg";
      notifyListeners();
    }

  }
  Future<void> calculateIAC() async {
    User? user = await getUser();
    if(user!=null){
      double height = user.getHeight/100;
      double iac = (user.getHip/pow(height,1.5))-18;
      _iac.value = iac.toStringAsFixed(2)+"%";
      _sex.value = user!.getSex.toString();
      notifyListeners();
    }

  }
  Future<User?> getUser()async{
    final Services _service = new Services ();
    return await _service.getUser();
  }

  Future<void>  calculateIMC()  async {
    User? user = await getUser();
    if(user!=null){

      double height = (user.getHeight * user.getHeight).toDouble()/10000;
      double imc =user.getWeight/height;
      _imc.value = imc.toStringAsFixed(2) +"%";
      notifyListeners();
    }

  }

  Future<void>  calculateTMB() async {
    User? user = await getUser();
    if(user!=null){
      double resultTMB =0;
      if(user.sex=="Feminino"){
        if(user.age >= 18 && user.age <30){
          resultTMB =14.818 * user.getWeight + 486.6;
        }
        if(user.age >= 30 && user.age <60){
          resultTMB =8.126 * user.getWeight + 845.6;
        }
        if(user.age >= 60){
          resultTMB =9.082 * user.getWeight + 658.5;
        }
      }
      if(user.sex=="Masculino"){
        if(user.age >= 18 && user.age <30){
          resultTMB =15.057 * user.getWeight + 692.2;
        }
        if(user.age >= 30 && user.age <60){
          resultTMB =11.472 * user.getWeight + 873.1;
        }
        if(user.age >= 60){
          resultTMB =11.711 * user.getWeight + 587.7;
        }
      }

      _tmb.value = resultTMB.toStringAsFixed(2)+"Kcal";
      notifyListeners();
    }
  }
}