import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Índice de adiposidade",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              " O Índice de Adiposidade Corporal, mais conhecido como IAC,"
              " é um método utilizado para medir a gordura corporal."
              " Para o cálculo desse índice são utilizadas medidas antropométricas,"
              " como circunferência do quadril e altura",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RxBuilder(builder: (_) {
              return Text(
                controller.iac,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              );
            }),
            RxBuilder(builder: (_) {
              return controller.sex == "Masculino"
                  ? MenDataTable()
                  : WomanDataTable();
            }),
          ]),
    ));
  }
}

Widget WomanDataTable() {
  return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
   child: DataTable(
      columns: [
        DataColumn(
            label: Text('Idade',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Abaixo Peso',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Saudável',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Acima do Peso',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Obesidade',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('20-39')),
          DataCell(Text('< 21%')),
          DataCell(Text('21% a 33%')),
          DataCell(Text('33% a 39%')),
          DataCell(Text('> 39%')),
        ]),
        DataRow(cells: [
          DataCell(Text('40-59')),
          DataCell(Text('< 23%')),
          DataCell(Text('23% a 35%')),
          DataCell(Text('35% a 41%')),
          DataCell(Text('> 41%')),
        ]),
        DataRow(cells: [
          DataCell(Text('60-79')),
          DataCell(Text('< 25%')),
          DataCell(Text('25% a 38%')),
          DataCell(Text('38% a 43%')),
          DataCell(Text('> 43%')),
        ]),

      ],
    ),
  );
}

Widget MenDataTable() {
  return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
    columns: [
      DataColumn(
          label: Text('Idade',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Abaixo Peso',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Saudável',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Acima do Peso',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Obesidade',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    ],
    rows: [
      DataRow(cells: [
        DataCell(Text('20-39')),
        DataCell(Text('< 8%')),
        DataCell(Text('8% a 21%')),
        DataCell(Text('21% a 26%')),
        DataCell(Text('> 26%')),
      ]),
      DataRow(cells: [
        DataCell(Text('40-59')),
        DataCell(Text('< 11%')),
        DataCell(Text('11% a 23%')),
        DataCell(Text('23% a 29%')),
        DataCell(Text('> 29%')),
      ]),
      DataRow(cells: [
        DataCell(Text('60-79')),
        DataCell(Text('< 13%')),
        DataCell(Text('13% a 25%')),
        DataCell(Text('25% a 31%')),
        DataCell(Text('> 31%')),
      ]),
 
    ],
      ),
  );
}
