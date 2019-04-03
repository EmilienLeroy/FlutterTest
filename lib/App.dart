import 'package:flutter/material.dart';
import 'package:test_flutter/screens/random.dart';
import 'package:test_flutter/screens/about.dart';
import 'package:test_flutter/screens/home.dart';
import 'package:test_flutter/screens/chat.dart';

//main class
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //generate a material app
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test',
        theme: new ThemeData(
          primaryColor: Colors.lightGreen,
        ),
        home: new HomeScreen(),
        routes: <String, WidgetBuilder>{
        // define the routes
          AboutScreen.routeName: (BuildContext context) => new AboutScreen(),
          RandomWords.routeName: (BuildContext context) => new RandomWords(),
          ChatScreen.routeName: (BuildContext context) => new ChatScreen()
        },
    );
  }
}

