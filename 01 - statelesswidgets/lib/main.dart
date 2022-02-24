import 'package:flutter/material.dart';

void main() {
	runApp(
		new MaterialApp(
			home: new MyStatelessWidget()
		)
	);
}


//lets create a stateless widget
class MyStatelessWidget extends StatelessWidget{
	//we need to override a function called build
	@override
	Widget build(BuildContext context){
		return new Scaffold(
			appBar: new AppBar(title: new Text("Stateless Widget")),
			
			body: new Container(
				padding: new EdgeInsets.all(20.0),
				child: new Column(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					children: <Widget>[
						new MyCard(
							title: new Text("Hello there!",
							style: new TextStyle(
								fontSize: 20.0
							)),

							icon: new Icon(Icons.favorite, size:30, color: Colors.redAccent)
						),
						new MyCard(
							title: new Text("This is a large donut",
							style: new TextStyle(
								fontSize: 20.0
							)),

							icon: new Icon(Icons.donut_large, size:30, color: Colors.brown)
						),
						new MyCard(
							title: new Text("I see you!",
							style: new TextStyle(
								fontSize: 20.0
							)),

							icon: new Icon(Icons.visibility, size:30, color: Colors.blue)
						),
						new MyCard(
							title: new Text("and this is a wifi symbol",
							style: new TextStyle(
								fontSize: 20.0
							)),

							icon: new Icon(Icons.wifi, size:30, color: Colors.green)
						)
					]
				)
			)
		);
	}
}

class MyCard extends StatelessWidget{
	MyCard({this.title, this.icon});

	final Widget title;
	final Widget icon;

	@override
	Widget build(BuildContext context){
		return new Container(
			padding: new EdgeInsets.only(bottom: 10.0, top: 3.0),
			child: new Card(
				child: new Container(
					padding: new EdgeInsets.all(10.0),
					child: new Column(
						children: <Widget>[
							this.title,
							this.icon
						]
					)
				)
			)
		);
	}
}