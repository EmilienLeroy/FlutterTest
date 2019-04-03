import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = "/chat";

  @override
  State createState() => new ChatScreenState();
}


class ChatScreenState extends State<ChatScreen>{

  //the text data
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chat"),
      ),
      body: _buildTextComposer(),
    );
  }

  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(
              children: <Widget>[

                //first container
                new Flexible(
                    child:  new TextField(
                      controller: _textController,
                      onSubmitted: _handleSubmitted,
                      decoration: new InputDecoration.collapsed(
                          hintText: "Send a message"),
                    )
                ),

                //second container
                new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 4.0),
                  child: new IconButton(
                      icon: new Icon(Icons.send),
                      onPressed: () => {
                      _handleSubmitted(_textController.text)
                      }
                  ),
                )

              ],
            )
        )
    );

  }

  //call when the form is submit
  void _handleSubmitted(String text) {
    _textController.clear();
  }
}