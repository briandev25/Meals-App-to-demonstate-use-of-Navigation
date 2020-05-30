import 'package:flutter/material.dart';
import './catergoriesScreen.dart';
import './favoritesScreen.dart';
import '../Widgets/mainDrawer.dart';
import '../Models/meal.dart';
class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>> _pages;

  void initState(){
     _pages =[
    {'page': CategoriesScreen(), 'title' : 'Categories'},
     {'page': FavoritesScreen(widget.favoriteMeals), 'title' : 'Favorites'},
    
  ];
  super.initState();
  }
  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
    print(_selectedPageIndex);
  }
 
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),

      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPageIndex]['page'] ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor:Colors.yellowAccent,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
            ), 
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
            ), 
      ],
      ),
     
     );
  }
}