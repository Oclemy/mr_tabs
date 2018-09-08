import 'package:flutter/material.dart';

//Our Category Data Object
class Category {
  const Category({ this.name, this.icon });
  final String name;
  final IconData icon;
}

// List of Category Data objects.
const List<Category> categories = <Category>[
  Category(name: 'General', icon: Icons.assessment),
  Category(name: 'Tech', icon: Icons.code),
  Category(name: 'Lifestyle', icon: Icons.people),
  Category(name: 'Finance', icon: Icons.account_balance),
  Category(name: 'Education', icon: Icons.school),
  Category(name: 'Sports', icon: Icons.settings_input_composite),
];


// Our MrTabs class.
//Will build and return our app structure.
class MrTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: categories.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: const Text('Tabbed AppBar'),
            bottom: new TabBar(
              isScrollable: true,
              tabs: categories.map((Category choice) {
                return new Tab(
                  text: choice.name,
                  icon: new Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: new TabBarView(
            children: categories.map((Category choice) {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new CategoryCard(choice: choice),
              );
            }).toList(),
          ),
        ),
      ),
	   theme: new ThemeData(primaryColor: Colors.deepOrange),
    );
  }
}

// Our CategoryCard data object
class CategoryCard extends StatelessWidget {
  const CategoryCard({ Key key, this.choice }) : super(key: key);
  final Category choice;

  //build and return our card with icon and text
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.name, style: textStyle),
          ],
        ),
      ),
    );
  }
}
// Our main method
void main() {
  runApp(new MrTabs());
}

//end