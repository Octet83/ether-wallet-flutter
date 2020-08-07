import 'package:flutter/material.dart';

class NodePage extends StatefulWidget {
  @override
  _NodePageState createState() => _NodePageState();
}

class _NodePageState extends State<NodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey.shade700, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text('My Masternode', style:TextStyle(color: Colors.grey.shade700, fontSize: 18)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromRGBO(79, 42, 152, 1), Color.fromRGBO(17, 35, 129, 1)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Text('Salut')
      ),
    );
  }
}