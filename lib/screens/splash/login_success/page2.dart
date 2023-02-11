import 'package:flutter/material.dart';
//import 'components/body.dart';
import 'components/main_drawer.dart';

class Page2 extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("FutureScapes"),
      ),
      //body: Body(),
      drawer: MainDrawer(),
    );
  }
}
