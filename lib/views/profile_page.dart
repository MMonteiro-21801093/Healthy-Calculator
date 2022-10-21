import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../controllers/user_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKeyValidator = GlobalKey<FormState>();
  final controller = UserController();
  final List<String> items = [
    'Masculino',
    'Feminino',
  ];
void initState(){
  super.initState();
  controller.getUser();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
    child: Form(
    key: _formKeyValidator,
    child: RxBuilder(
    builder: (_)   {

    return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      CustomTextField(label:"Idade",icon:Icons.apps_outage,input:TextInputType.number,controller:controller,textController:controller.ageController),
      SizedBox( height: 5, ),
      CustomTextField(label:"Peso",icon:Icons.monitor_weight,input:TextInputType.number,controller:controller,textController:controller.weightController),
      SizedBox( height: 5, ),
      CustomTextField(label:"Altura(cm)",icon:Icons.height,input:TextInputType.number,controller:controller,textController:controller.heightController),
      SizedBox( height: 5, ),
      CustomTextField(label:"Quadril",icon:Icons.fastfood_sharp,input:TextInputType.number,controller:controller,textController:controller.hipController),
      SizedBox( height: 5, ),
      CustomDropDown(items,controller),
      SizedBox( height: 5, ),
      Container(
        height: 50.0,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if(controller.id!=0){
              controller.updateUser();
            }else{
               controller.insertNewUser();
            }
          },
          child: Text(
            "Submeter",
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          ),

        ),
      ),
    ],
    );

    },
        )
    ,
    )
    ,
        ));
  }
}
CustomDropDown(List<String> items, UserController controller){
  return      DropdownButtonFormField2(
    decoration: InputDecoration(
      //Add isDense true and zero Padding.
      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
      isDense: true,
      contentPadding: EdgeInsets.zero,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      //Add more decoration as you want here
      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
    ),
    isExpanded: true,
    hint: const Text(
      'Sexo',
      style: TextStyle(fontSize: 14),
    ),
    icon: const Icon(
      Icons.arrow_drop_down,
      color: Colors.black45,
    ),
    iconSize: 30,
    buttonHeight: 60,
    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
    dropdownDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    items: items
        .map((item) =>
        DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ))
        .toList(),
    validator: (value) {
      if (value == null) {
        return 'Por favor selecione o género.';
      }
    },
    value: controller.sex,
    onChanged: (value) {
      controller.setSex(value.toString()) ;
    },
    onSaved: (value) {
      controller.setSex(value.toString()) ;
    },
  );
}
CustomTextField({required String label, required IconData icon, required TextInputType input, required UserController controller, required TextEditingController textController}) {
  return TextFormField(
    keyboardType: input,
    controller: textController,
    onChanged:  (value) {
    },
    validator: (value) {
      if (value!.isEmpty) {
        return "Campo obrigatório";
      }
    },
    decoration:InputDecoration(
      labelText: label,
      border:OutlineInputBorder(),
      prefixIcon: Icon(icon),
    ),
  );
}
