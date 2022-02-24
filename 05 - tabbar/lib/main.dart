import 'package:flutter/material.dart';

import 'FirstPage.dart' as first;
import 'SecondPage.dart' as second;
import 'ThirdPage.dart' as third;



void main(){
  runApp(
    new MaterialApp(
		home: new MyTabBar()
    )
  );
}

class MyTabBar extends StatefulWidget{
  @override
  MyTabBarState createState() => new MyTabBarState();

}

class MyTabBarState extends State<MyTabBar> with SingleTickerProviderStateMixin{
	
	//we need a tab controller to add tabs
	TabController tabController;

	//in the following override, we need to use 'with SingleTickerProviderStateMixin'
	@override
	void initState(){
		super.initState();
		tabController = new TabController(vsync: this, length: 3); //lenght is the amount of tabs
	}

	@override
	void dispose(){
		tabController.dispose();
		super.dispose();
	}


	@override
	Widget build(BuildContext context){
		return new Scaffold(
			appBar: new AppBar(
				title: new Text("Tab Bar test"), 
				backgroundColor: Colors.green,
				//to add a tab bar, we need to use bottom property of appbar
				bottom: new TabBar(
					//controller is a must for this
					controller: tabController,
					tabs: <Tab>[
						new Tab(icon: new Icon(Icons.home)),
						new Tab(icon: new Icon(Icons.wifi)),
						new Tab(icon: new Icon(Icons.usb))
					]
				),
			),

			//we can add a bottom navigation bar as well with the
			//following property or attribute
			bottomNavigationBar: new Material(
				color: Colors.green,
				child: new TabBar(
					controller: tabController,
					tabs: <Tab>[
						new Tab(icon: new Icon(Icons.home)),
						new Tab(icon: new Icon(Icons.wifi)),
						new Tab(icon: new Icon(Icons.usb))
					]
				)
			),
			
			body: new TabBarView(
				controller: tabController,
				children: <Widget>[
					new first.First(),
					new second.Second(),
					new third.Third()
				],
			)
		);
	}
}