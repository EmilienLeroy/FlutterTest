import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = "/about";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("About"),
      ),
      body: new Container(

        child: new Container(
          height: 200,
          margin: const EdgeInsets.all(20.0),
          decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                  color: Colors.black,
                  offset: new Offset(0, 10),
                  blurRadius: 20,
                  spreadRadius: -10
              )
            ]
          ),
          child: new Center(
            child: new ClipRRect(
              borderRadius: new BorderRadius.all(new Radius.circular(10)),
              child: new Image(image: AssetImage('assets/setup.JPG')),
            ),
          )


        )
      )
    );
  }
}