import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new AwesomeButton()
    )
  );
}


class AwesomeButton extends StatefulWidget{
  
  //we need to create a state for this button
  @override
  AwesomeButtonState createState() => new AwesomeButtonState();

}

class AwesomeButtonState extends State<AwesomeButton>{

	int counter = 0;
	List<String> strings = ["Flutter", "is", "...", "confusing"];
	String displayStr = "";

	void onButtonPress(){
		setState(() {
			displayStr = strings[counter];
			counter = counter < 3 ? counter + 1 : 0;
		});
	}

	@override
	Widget build(BuildContext context){
		return new Scaffold(
			appBar: new AppBar(title: new Text("Stateful Widgets"), backgroundColor: Colors.green),

			body: new Container(
				child: new Center(
					child: new Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							new Text(displayStr, style: new TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold)),
							new Padding(padding: new EdgeInsets.all(15.0)),
							new RaisedButton(
								child: new Text("Press me!", style: new TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
								color: Colors.green,
								onPressed: onButtonPress,
							)
						],
					)
				)
			)
		);
	}
}