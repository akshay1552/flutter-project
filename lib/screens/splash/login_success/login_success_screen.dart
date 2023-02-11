// ignore_for_file: unnecessary_import

import 'dart:ui';

import 'package:flutter/material.dart';
//import 'components/body.dart';
import 'components/main_drawer.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //body: Body(),
      debugShowCheckedModeBanner: false,
      home: ListViewHomePage(),
    );
  }
}

class ListViewHomePage extends StatefulWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  _ListViewHomePageState createState() => _ListViewHomePageState();
}

class _ListViewHomePageState extends State<ListViewHomePage> {
  var titleList = [
    "Python Project",
    "Mini Project",
    "E-Campus",
    "MAD Lab",
    "Dart Project",
  ];

  var desclist = [
    "Deep Neural net with forward and back propagation from scratch Python.",
    "Mini project on the use of machine learning algorithms Python.",
    "E-Campus is a web application for students to register for the courses.",
    "MAD Lab is a web application for students to register for the courses.",
    "Dart Project on the use of machine learning algorithms Dart.",
  ];

  var imgList = [
    "assets/images/img1.png",
    "assets/images/img2.png",
    "assets/images/img3.png",
    "assets/images/img4.png",
    "assets/images/img5.png"
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Projects",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 174, 255),
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
          itemCount: imgList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //print(titleList[index]);
                showDialogFunc(
                    context, imgList[index], titleList[index], desclist[index]);
              },
              child: Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            desclist[index],
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 174, 255),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
            );
          }),
    );
  }
}

showDialogFunc(context, img, title, desc) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 370,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      img,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.green[500],
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        );
      });
}
