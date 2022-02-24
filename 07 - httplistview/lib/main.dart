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
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{

  List jsonData;
  String url = "https://jsonplaceholder.typicode.com/posts";

  Future<String> getData() async{
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept" : "application/json"
        }
      );

      print(response.body);

	  //to render the list view, we need to set the state
	  	this.setState(() {
			jsonData = jsonDecode(response.body);
		});

      return "success";
  }

  //before we build a listview, we need to call the getData function
  //we can do that with initState, it will run before anything gets rendered to the screen
  @override
  void initState(){
    this.getData();
  }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("HTTP ListView"), backgroundColor: Colors.lightGreen[7000],),

      //create a new list view build for the body
      body: new ListView.builder(
        itemCount: jsonData == null ? 0 : jsonData.length,
        
        //it also needs an itemBuilder, it takes the context and index to keep track of lists
        itemBuilder: (BuildContext context, int index){
          //now we can build any widget here, let's just use card to keep track of this
          return new Card(
			  child: new Container(
				  padding: new EdgeInsets.all(10.0),
				  child: new Column(
					  children: <Widget>[
						  new Text(jsonData[index]["title"])
					  ],
				  )
			  )
          );
        },
      )
      
    );
  }
}