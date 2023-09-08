import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomeScreen(),
      title: 'OSTAD APP',
    );
  }
}

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 70,
        leading: Icon(Icons.store),
        actions: [
          Icon(Icons.search)
        ],
        centerTitle: true,
        title: Text('Home'),
        backgroundColor: Colors.green,

      ),



    );
  }
}