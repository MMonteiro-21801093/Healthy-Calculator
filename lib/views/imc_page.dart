import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../controllers/calculator_controller.dart';

class ImcPage extends StatelessWidget {
  final controller = CalculatorController();
  @override
  Widget build(BuildContext context) {
    controller.calculateIMC();
    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
            Text(
              "IMC", textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,fontWeight: FontWeight.bold
              ),
            ),
            SizedBox( height: 20, ),
            Text(
              "O índice de massa corporal (IMC) é uma medida internacional usada para "
                  "calcular se uma pessoa está no peso ideal. Desenvolvido pelo polímata Lambert "
                  "Quételet no fim do século XIX, trata-se de um método fácil e rápido para a avaliação "
                  "do nível de gordura de cada pessoa, sendo, por isso, um preditor internacional de"
                  "obesidade adotado pela Organização Mundial da Saúde (OMS).", textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox( height: 20, ),
            RxBuilder(
                builder: (_) {
                  return   Text(
                    controller.imc, textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,fontWeight: FontWeight.bold
                    ),
                  );
                }
            ),


              DataTable(
                columns: [
                  DataColumn(label: Text(
                      'IMC',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  )),
                  DataColumn(label: Text(
                      'Classificação',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  )),


                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Baixo Peso')),
                    DataCell(Text('<18,5'))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Peso Normal')),
                    DataCell(Text('18,5 a 24,9')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Excesso de Peso')),
                    DataCell(Text('25 a 29,9')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Obesidade Grau I')),
                    DataCell(Text('30 a 34,9')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Obesidade Grau II')),
                    DataCell(Text('35 a 39,9')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Obesidade Mórbida')),
                    DataCell(Text('> 39,9')),
                  ]),
                ],
              ),
            ])
          ,
        ));
  }
  
}