import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

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
	
	Future<List<Post>> getPosts() async {
		var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

		var jsonData = jsonDecode(response.body);

		List<Post> posts = [];

		for(var item in jsonData){
			Post post = Post(title:item["title"], body:item["body"]);

			posts.add(post);
		}

		return posts;
	}
	
	@override
	Widget build(BuildContext context){
		return new Scaffold(
			appBar: AppBar(title: Text("Future Builder test"), backgroundColor: Colors.lightGreen[700]),

			body: Container(
				//create a future builder, it takes two parameters
				//one is name of the function, in our case it is getPosts
				//second one is the builder, it takes build context and async snapshot
				child: FutureBuilder(
					future: getPosts(),
					builder: (BuildContext context, AsyncSnapshot snapshot){
						//AsyncSnapshot gives us the data when the future getPosts() gets resolved
						//lets use ListView builder to show the data

						//if data is null, return a loading widget, else return the list
						if(snapshot.data == null){
							return Container(
								/*child: Center(
									child: Text("Loading..."),
								),*/
								child: Center(
									child: Row(
										crossAxisAlignment: CrossAxisAlignment.center,
										mainAxisAlignment: MainAxisAlignment.center,
										children: <Widget>[
											Text("Loading...", style: TextStyle(fontSize: 18),),
											
											Padding(padding: EdgeInsets.only(right: 10)),
											
											CircularProgressIndicator(
												valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen[700]),
											)
										],
									)
								)
							);
						}
						else{
							return ListView.builder(
								itemCount: snapshot.data.length,

								itemBuilder: (BuildContext context, int index){
									//we can return any widget here, lets return a ListTile
									return Container(
										padding: EdgeInsets.all(10),
										child:new Card(
											child: Container(
												child: Text(snapshot.data[index].title, textAlign: TextAlign.start,),
											)
										)
									);
								},
							);
						}
					},
				),

			)
		);
	}
}

class Post{
	final String title;
	final String body;

	Post({this.title, this.body});
}