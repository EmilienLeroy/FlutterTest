abstract class ListItem {}

class Pokemon implements ListItem {
  final String name;
  final String type;

  Pokemon(this.name, this.type);
}