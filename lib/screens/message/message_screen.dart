import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  final List<Message> messages = [
    Message(content: 'Hola, ¿cómo estás?', sender: 'other'),
    Message(content: 'Estoy bien, gracias. ¿Y tú?', sender: 'self'),
    Message(content: 'También estoy bien, gracias por preguntar.', sender: 'other'),
    Message(content: '¿Qué planes tienes para hoy?', sender: 'self'),
    Message(content: 'Voy a trabajar en un proyecto de Flutter.', sender: 'other'),
    Message(content: '¡Eso suena genial!', sender: 'self'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensajes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(
                    message: messages[index],
                  );
                },
              ),
            ),
          ),
          MessageInput(),
        ],
      ),
    );
  }
}

class Message {
  final String content;
  final String sender;

  Message({required this.content, required this.sender});
}

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelf = message.sender == 'self';
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      alignment: isSelf ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelf ? Colors.green[300] : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: isSelf ? Radius.circular(12) : Radius.circular(0),
            bottomRight: isSelf ? Radius.circular(0) : Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Text(
          message.content,
          style: TextStyle(color: isSelf ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

class MessageInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Escribe un mensaje...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}