import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../controllers/calculator_controller.dart';

class IacPage extends StatelessWidget {
  final controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    controller.calculateIAC();
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
        Text(
            "Índice de adiposidade", textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,fontWeight: FontWeight.bold
            ),
          ),
        SizedBox( height: 20, ),
         Text(
          " O Índice de Adiposidade Corporal, mais conhecido como IAC,"
              " é um método utilizado para medir a gordura corporal."
              " Para o cálculo desse índice são utilizadas medidas antropométricas,"
              " como circunferência do quadril e altura", textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        SizedBox( height: 40, ),
          RxBuilder(
            builder: (_) {
              return   Text(
                controller.iac, textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,fontWeight: FontWeight.bold
                ),
              );
            }

          ),
      ]),
    ));
  }
}
