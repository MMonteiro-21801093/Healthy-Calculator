import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import '../controllers/calculator_controller.dart';

class TmbPage extends StatelessWidget {
  final controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    controller.calculateTMB();
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Taxa metabólica basal",
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
              "A taxa metabólica basal, conhecida também como gasto energético basal, "
              "é a quantidade de energia que o corpo, em repouso, gasta para manter as "
              "suas funções vitais, como respiração, batimentos do coração e manutenção da temperatura corporal.",
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
                controller.tmb,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              );
            }),
            CustomDataTable(),
          ]),
    ));
  }
}

Widget CustomDataTable() {
  return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
    columns: [
      DataColumn(
          label: Text('Idade',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Mulher',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Homem',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    ],
    rows: [
      DataRow(cells: [
        DataCell(Text('18-30')),
        DataCell(Text('(14,818 x peso em kg) + 486,6')),
        DataCell(Text('(15,057 x peso em kg) + 692,2')),
      ]),
      DataRow(cells: [
        DataCell(Text('30-60')),
        DataCell(Text('(8,126 x peso em kg) + 845,6')),
        DataCell(Text('(11,472 x peso em kg) + 873,1')),
      ]),
      DataRow(cells: [
        DataCell(Text('> 60')),
        DataCell(Text('(9,082 x peso em kg) + 658,5')),
        DataCell(Text('(11,711 x peso em kg) + 587,7')),
      ]),
 
    ],
      ),
  );
}
