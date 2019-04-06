import 'package:flutter/material.dart';
import 'package:test_flutter/models/Pokemon.dart';

//grid item for the main grid view
class PokemonItem extends StatelessWidget
{
  final Pokemon pokemon;

  PokemonItem(
    this.pokemon,
  );

  @override
  Widget build(BuildContext context) {

    //the content of the item
    final Widget content = new GestureDetector(
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
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              stops: [0.1, 0.9],
              colors: [
              Color(0xffff9800),
              Color(0xffffffff),
            ],
          ),
        ),
        alignment: Alignment.center,
       ),
      ),
      onTap: pokemon.sound,
    );

    //the footer item
    final Widget footer = new GestureDetector(
      child: new Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: new BoxDecoration(
          color: Colors.black45,
          borderRadius: new BorderRadius.only(bottomLeft: new Radius.circular(5), bottomRight: new Radius.circular(5)),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${pokemon.name}',style: TextStyle(color: Colors.white)),
            Text('${pokemon.type}',style: TextStyle(color: Colors.white70)),
          ],
        )
        ,
      ),
    );

    //Return a grid tile with the content and the footer
    return GridTile(
        child: content,
        footer: footer,
    );

  }
}