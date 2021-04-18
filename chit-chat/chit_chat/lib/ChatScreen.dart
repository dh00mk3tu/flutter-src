import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  @override
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: new IconThemeData(
        color: Colors.blue[400],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "Enter Message",
                ),
                controller: _textController,
                onSubmitted: _handleSubmitted,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return _textComposerWidget();
  }
}
