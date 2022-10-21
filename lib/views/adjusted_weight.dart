import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../controllers/calculator_controller.dart';

class AdjustedWeight extends StatelessWidget {
 // const AdjustedWeight({super.key});
  final controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    controller.calculateAdjustedWeight();
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
        Text(
            "Peso ajustado", textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,fontWeight: FontWeight.bold
            ),
          ),
        SizedBox( height: 20, ),
         Text(
          "Peso ajustado. Também chamado de peso ideal corrigido, é calculado com base nos pesos atual e teórico, quando"
              " o indivíduo significativamente abaixo ou acima do seu peso saudável"
              " (índice de adequação menor que 95% ou superior a 115%)", textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        SizedBox( height: 40, ),
          RxBuilder(
            builder: (_) {
              return   Text(
                controller.adjustedWeight, textAlign: TextAlign.center,
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
