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
      title: 'Assignment APP',
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
        leading: Icon(Icons.store, size: 36),
        actions: [
          Icon(Icons.search, size: 36)
        ],
        centerTitle: true,
        title: Text('Home', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26
        ),),
        backgroundColor: Colors.green,

      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('This is mod 5 Assignment', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),)

            ],

          ),

          RichText(text: TextSpan(
            text: 'My ',
            style: TextStyle(
                color: Colors.pink,
                fontSize: 28
            ),

              children: [
              TextSpan(
                text: 'phone ',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 18
                )
              ),
              TextSpan(
                text: 'name ',
                style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                )
              ),
              TextSpan(
                text: 'Your phone name',
                style: TextStyle(
                  color: Colors.orange
                )
              )
            ]

          ))
        ],
      )
    );
  }
}