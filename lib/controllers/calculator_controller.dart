import 'package:flutter/cupertino.dart';
import 'package:rx_notifier/rx_notifier.dart';
import '../models/user.dart';
import '../services/service.dart';

class CalculatorController extends ChangeNotifier  {
  final _adjustedWeight = RxNotifier<String>('');
  final _idealWeight = RxNotifier<String>('');
  String get adjustedWeight => _adjustedWeight.value;
  String get idealWeight => _idealWeight.value;

  Future<void> calculateAdjustedWeight() async {
    User? user = await getUser();
    if(user!=null){
      double idealWeight =0;
      if(user.getSex=="Masculino"){
        idealWeight = 52 + (0.75 *(user.getHeight - 152.4));
      }else{
        idealWeight = 49 + (0.67 *(user.getHeight - 152.4));
      }
      _adjustedWeight.value = ((user.getWeight -idealWeight )* 0.25 + idealWeight).toStringAsFixed(2) + "kg";
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
      _idealWeight.value = idealWeight.toStringAsFixed(2) + "kg";
      notifyListeners();
    }

  }
  Future<User?> getUser()async{
    final Services _service = new Services ();
    return await _service.getUser();
  }
}