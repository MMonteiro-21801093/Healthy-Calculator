import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../controllers/user_controller.dart';
import '../models/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKeyValidator = GlobalKey<FormState>();
  final controller = UserController();


  @override
  Widget build(BuildContext context) {
    controller.getUser();
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
      Container(
        height: 50.0,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            int? id = null;
            if(controller.id!=0)
                id = controller.id;

            User user = User(id, int.parse(controller.ageController.text),
                double.parse(controller.weightController.text),
                int.parse(controller.heightController.text),
                int.parse(controller.hipController.text),"Masculino");
            if(id != null){
              controller.updateUser(user);
            }else{
               controller.insertNewUser(user);
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

CustomTextField({required String label, required IconData icon, required TextInputType input, required UserController controller, required TextEditingController textController}) {
  return TextFormField(
    keyboardType: input,
    controller: textController,
    onChanged:  (value) {
  /*  switch(label) {
      case "Idade": controller.setAge(int.parse(value));break;
      case "Altura": controller.setHeight(int.parse(value));break;
      case "Peso": controller.setWeight(double.parse(value));break;
      case "Quadril": controller.setHip(int.parse(value));break;
    }*/
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
