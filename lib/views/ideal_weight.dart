

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../controllers/calculator_controller.dart';

class IdealWeight extends StatelessWidget {
  final controller = CalculatorController();
  @override
  Widget build(BuildContext context) {
    controller.calculateIdealWeight();
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
            Text(
              "Peso Ideal", textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,fontWeight: FontWeight.bold
              ),
            ),
            SizedBox( height: 20, ),
            Text(
              "O peso ideal é o peso que uma pessoa deve ter para a sua altura,"
                  " sendo considerado um intervalo de peso saudável e que permite"
                  " reduzir acentuadamente o risco de diversos problemas de saúde,"
                  " como obesidade, hipertensão e diabetes ou até mesmo a desnutrição.", textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox( height: 40, ),
            RxBuilder(
                builder: (_) {
                  return   Text(
                    controller.idealWeight, textAlign: TextAlign.center,
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