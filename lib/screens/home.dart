import 'package:flutter/material.dart';
import 'package:test_flutter/screens/about.dart';
import 'package:test_flutter/screens/random.dart';
import 'package:test_flutter/screens/chat.dart';
import 'package:test_flutter/models/Pokemon.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List<Pokemon> pokemons = [
    new Pokemon("Pikachu", "Electrique", new AssetImage('assets/pikachu.png'),'pikachu.wav'),
    new Pokemon("Salameche", "Feu", new AssetImage('assets/salameche.png'),'salameche.mp3'),
    new Pokemon("Bulbizarre", "Plante", new AssetImage('assets/bulbizarre.png'),'bulbizarre.mp3'),
    new Pokemon("Carapuce", "Eau", new AssetImage('assets/carapuce.png'),'carapuce.mp3')
  ];

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

                  return new GestureDetector(
                      child: new Card(
                      elevation: 5.0,
                      semanticContainer: true,
                      child: new Container(
                        decoration: new BoxDecoration(
                          image: new DecorationImage(image: pokemon.img,fit: BoxFit.cover),
                          borderRadius: new BorderRadius.all(new Radius.circular(5)),
                        ),
                        alignment: Alignment.center,
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(pokemon.name),
                            Text(pokemon.type)
                          ]
                        ),
                      ),
                    ),
                    onTap: (){
                        pokemon.sound();
                    },
                  );
                }
            )
          ),
      )
      // Set the nav drawer

    );
  }
}