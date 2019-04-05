import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

abstract class ListItem {}

class Pokemon implements ListItem {
  final String name;
  final String type;
  final String cri;
  final AssetImage img;
  static AudioCache player = new AudioCache();

  Pokemon(this.name, this.type, this.img,this.cri);

  void sound(){
    player.play(this.cri);
  }
}