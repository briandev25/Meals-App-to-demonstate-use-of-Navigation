import 'package:flutter/material.dart';
import '../Screens/filterScreen.dart';
class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title,IconData icon ,Function tapHandler){
    return ListTile(
            leading: Icon(
              icon,
              size: 26,
              ),
              title: Text(title,
               style: TextStyle(
                 fontFamily: 'RobotoCondensed',
                 fontSize:24,
                 fontWeight: FontWeight.bold,
               ),
              ),
              onTap: tapHandler ,
          );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text("Prepare a meal",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize : 30,
              color:Colors.white,
            ),
            ),
          ),
          SizedBox(height: 20,),
          buildListTile('Meals', Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile("Filter", Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FilterScreen.filterName);
          }),
        ],
      ),
    );
  }
}