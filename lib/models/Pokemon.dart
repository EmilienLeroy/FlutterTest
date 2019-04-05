import 'package:flutter/material.dart';

abstract class ListItem {}

class Pokemon implements ListItem {
  final String name;
  final String type;
  final AssetImage img;

  Pokemon(this.name, this.type, this.img);
}