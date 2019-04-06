import 'package:flutter/material.dart';
import 'package:test_flutter/screens/about.dart';
import 'package:test_flutter/screens/random.dart';
import 'package:test_flutter/screens/chat.dart';
import 'package:test_flutter/models/Pokemon.dart';
import 'package:test_flutter/data/pokemons.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {


  Drawer getNavDrawer(BuildContext context) {
    var headerChild = new DrawerHeader(child: new Text("Header"));


    ListTile getNavItem(var icon, String s, String routeName) {
      return new ListTile(
        leading: new Icon(icon),
        title: new Text(s),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.home, "Home", "/"),
      getNavItem(Icons.account_box, "Random", RandomWords.routeName),
      getNavItem(Icons.comment, "Chat", ChatScreen.routeName),
      getNavItem(Icons.settings, "About", AboutScreen.routeName),
    ];

    ListView listView = new ListView(children: myNavChildren);

    return new Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Testing Flutter"),
      ),
        drawer: getNavDrawer(context),
      body: new Container(
          child: new Center(
            child: new GridView.builder(
                itemCount: pokemons.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder:  (BuildContext context, int index){
                  final pokemon = pokemons[index];

                  return GridTile(
                    child: new GestureDetector(
                      child: new Card(
                        elevation: 5.0,
                        semanticContainer: true,
                        margin: const EdgeInsets.all(10.0),
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: new Container(
                            decoration: new BoxDecoration(
                              image: new DecorationImage(image: pokemon.img,fit: BoxFit.cover),
                              borderRadius: new BorderRadius.all(new Radius.circular(5)),
                              gradient: LinearGradient(
                                // Where the linear gradient begins and ends
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                // Add one stop for each color. Stops should increase from 0 to 1
                                stops: [0.1, 0.5, 0.7, 0.9],
                                colors: [
                                  // Colors are easy thanks to Flutter's Colors class.
                                  Color(0xff845ec2),
                                  Color(0xffe65faa),
                                  Color(0xffff8080),
                                  Color(0xfff9f871),
                                ],
                              ),
                            ),
                            alignment: Alignment.center,
                        ),
                      ),
                      onTap: (){
                        pokemon.sound();
                      },
                    ),
                    footer: new GestureDetector(
                      child: new Container(
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.all(10.0),
                        width: double.infinity,
                        decoration: new BoxDecoration(
                          color: Colors.black45,
                          borderRadius: new BorderRadius.all(new Radius.circular(5)),
                        ),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Nom: ${pokemon.name}',style: TextStyle(color: Colors.white)),
                            Text('Type: ${pokemon.type}',style: TextStyle(color: Colors.white)),
                          ],
                        )
                        ,
                      ),
                    ),
                  );
                }
            )
          ),
      )
      // Set the nav drawer

    );
  }
}