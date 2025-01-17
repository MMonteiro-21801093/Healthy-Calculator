import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthy_calculator/views/adjusted_weight.dart';
import 'package:healthy_calculator/views/iac_page.dart';
import 'package:healthy_calculator/views/ideal_weight.dart';
import 'package:healthy_calculator/views/imc_page.dart';
import 'package:healthy_calculator/views/profile_page.dart';
import 'package:healthy_calculator/views/tmb_page.dart';

import 'my_drawer_header.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}
class _NavigationDrawerState extends State<NavigationDrawer> {
  var currentPage = DrawerSections.profile;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.profile) {
      container = ProfilePage();
    }else if (currentPage == DrawerSections.adjustedWeight) {
    container = AdjustedWeight();
    }else if (currentPage == DrawerSections.idealWeight) {
      container = IdealWeight();
    }else if (currentPage == DrawerSections.imc) {
      container = ImcPage();
    }else if (currentPage == DrawerSections.iac) {
      container = IacPage();
    }else if (currentPage == DrawerSections.tmb) {
      container = TmbPage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );

  }
  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Perfil", Icons.account_circle,
              currentPage == DrawerSections.profile ? true : false),
          menuItem(2, "Peso Ajustado", Icons.people_alt_outlined,
              currentPage == DrawerSections.adjustedWeight ? true : false),
          menuItem(3, "Peso Ideal", Icons.event,
              currentPage == DrawerSections.idealWeight ? true : false),
          menuItem(4, "IMC", Icons.notes,
              currentPage == DrawerSections.imc ? true : false),
          menuItem(5, "Índice de adiposidade", Icons.flatware,
              currentPage == DrawerSections.iac ? true : false),
          menuItem(6, "Taxa metabólica basal", Icons.no_food,
              currentPage == DrawerSections.tmb ? true : false),
     /*     Divider(),
          menuItem(6, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(7, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(8, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(9, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),*/
        ],
      ),
    );
  }
  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.profile;
            } else if (id == 2) {
              currentPage = DrawerSections.adjustedWeight;
            } else if (id == 3) {
              currentPage = DrawerSections.idealWeight;
            } else if (id == 4) {
              currentPage = DrawerSections.imc;
            } else if (id == 5) {
              currentPage = DrawerSections.iac;
            }else if (id == 6) {
              currentPage = DrawerSections.tmb;
            }
/*            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }*/
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  profile,
  adjustedWeight,
  idealWeight,
  imc,
  iac,
  tmb,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}