import 'package:flutter/material.dart';

class First extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		return new Container(
			child: new Center(
				child: new Icon(Icons.local_pizza, size: 150.0, color: Colors.amber)
			),
		);
	}
}