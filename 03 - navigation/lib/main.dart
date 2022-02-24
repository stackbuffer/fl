import 'package:flutter/material.dart';

void main(){
  runApp(
	  new MaterialApp(
		  home: new HomePage(),
		  routes: <String, WidgetBuilder> {
			  "/SecondPage": (BuildContext context) => new SecondPage()
		  }
	  )
  );
}

//let's create a first screen
class HomePage extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		return new Scaffold(
			appBar: new AppBar(title: new Text("Home"), backgroundColor: Colors.green),
			
			body: new Container(
				child: new Center(
					child: new Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[

							new IconButton(
								icon: new Icon(Icons.favorite, color: Colors.redAccent),
								iconSize: 70.0,
								onPressed: (){
									Navigator.of(context).pushNamed("/SecondPage");
								}
							),

							new Text("Home", style: new TextStyle(fontSize: 20))
						]
					)
				)
			)
		);
	}
}


//now let's create a second screen

class SecondPage extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		return new Scaffold(
			appBar: new AppBar(title: new Text("Second Page"), backgroundColor: Colors.green),
			
			body: new Container(
				child: new Center(
					child: new Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[

							new IconButton(
								icon: new Icon(Icons.circle, color: Colors.green),
								iconSize: 70.0,
								onPressed: (){
									Navigator.of(context).pushNamed("/");
								}
							),

							new Text("Second Page", style: new TextStyle(fontSize: 20))
						]
					)
				)
			)
		);
	}
}