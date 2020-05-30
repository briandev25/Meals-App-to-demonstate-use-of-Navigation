import 'package:flutter/material.dart';
import '../Widgets/mainDrawer.dart';
class FilterScreen extends StatefulWidget {
  static const filterName ='/filters';
  // final Function saveFilters;
  // FilterScreen(this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian =false;
  var _vegan=false;
  var _lactoseFree=false;

  Widget _useSwitchListTile(String title,String subtitle,bool currentValue ,Function updateValue){
    return  SwitchListTile(value:currentValue,
                     title: Text(title),
                     subtitle: Text(subtitle),
                      onChanged: updateValue,
                 );
                      }
                     
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        // actions: <Widget>[
        //   IconButton(icon: Icon(Icons.save), onPressed: widget.saveFilters)
        // ],
      ),
    
      drawer: MainDrawer(),
          body:Column(
            children: <Widget>[
              Container(
                padding:EdgeInsets.all(20),
                child: Text("Adjust your meal selection",
                style:  Theme.of(context).textTheme.title,
                ),),
                 Expanded(child: ListView(
                   children: <Widget>[
                  _useSwitchListTile("Gluten-Free", "Only include gluten-free meals", _glutenFree, (newValue){
                    setState(() {
                      _glutenFree=newValue;
                    });
                  }),
                  _useSwitchListTile("Vegeterian", "Only include gluten-free meals", _vegetarian, (newValue){
                    setState(() {
                      _vegetarian=newValue;
                    });
                  }),
                   _useSwitchListTile("Vegan", "Only include vegan meals", _vegan, (newValue){
                    setState(() {
                      _vegan=newValue;
                    });
                  }),
                   _useSwitchListTile("Lactose-Free", "Only include Lactose-free meals", _lactoseFree, (newValue){
                    setState(() {
                      _lactoseFree=newValue;
                    });
                  }),
                     
                   ],
                 ))
            ],
          ), 
          
    );
  }
}