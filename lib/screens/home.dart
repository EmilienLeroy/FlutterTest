import 'package:flutter/material.dart';
import 'package:test_flutter/screens/about.dart';
import 'package:test_flutter/screens/random.dart';
import 'package:test_flutter/screens/chat.dart';
import 'package:test_flutter/models/Pokemon.dart';
import 'package:test_flutter/data/pokemons.dart';
import 'package:test_flutter/widgets/pokemonItem.dart';

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
      drawer: getNavDrawer(context),
      body: new Container(
          child: new Center(
            child: new GridView.builder(
                itemCount: pokemons.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder:  (BuildContext context, int index){

                  final pokemon = pokemons[index];
                  return new PokemonItem(pokemon);

                }
            )
          ),
      )
      // Set the nav drawer

    );
  }
}