import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(
    new MaterialApp(
      home: new HomePage()
    )
  );
}

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{

  //just like nodejs, we don't know when we'll get the data but we will get it in future
  //and this should be asynchronous and Future<String> tells us that it will get the string in the future
  Future<String> getData() async {
    http.Response response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept" : "application/json"
      }
    );


    List data = jsonDecode(response.body);
    print(data[0]['title']);
  }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("HTTP test"), backgroundColor: Colors.lightGreen[800]),

      body: new Container(
        child: new Center(
          child: new RaisedButton(
            child: new Text("Get data"),
            onPressed: getData,
          ),
        ),
      )

    );
  }
}