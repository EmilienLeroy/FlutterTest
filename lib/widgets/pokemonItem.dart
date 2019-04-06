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
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
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
    );

    //Return a grid tile with the content and the footer
    return GridTile(
      child: content,
      footer: footer,
    );
  }
}