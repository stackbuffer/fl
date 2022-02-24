import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      home: new MyTextInput()
    )
  );
}

class MyTextInput extends StatefulWidget{
	@override
	MyTextInputState createState() => new MyTextInputState();
}

class MyTextInputState extends State<MyTextInput>{

	//we can delete the text in the field with a input text editing controller
	final TextEditingController textController = new TextEditingController();

	String result = "";

	@override
	Widget build(BuildContext context){
		return new Scaffold(
			appBar: new AppBar(title: new Text("Text Input test"), backgroundColor: Colors.green),

			body: new Container(
				child: new Center(
					child: new Column(
						mainAxisAlignment: MainAxisAlignment.center,
						
						//now add text field in this
						children: <Widget>[
							new TextField(
								//add some decoration to this text field
								decoration: new InputDecoration(
									hintText: "Type in here"
								),

								//attach the controller
								controller: textController,

								/*
								onChanged: (String str){
									setState(() {
										result = str;
									});
								},*/
								//instead of on changed, we can use on submitted
								onSubmitted: (String str){
									setState(() {
										result = result + '\n' + str;
										//reset the field to empty string
										//with controller
										textController.text = "";									  
									});
								},
							),

							new Padding(padding: EdgeInsets.only(top: 30.0)),
							//add a text widget
							new Text(result)
						],
					)
				)
			) 
		);
	}
}
