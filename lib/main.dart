import 'package:flutter/material.dart';
import './Screens/catergoriesScreen.dart';
import './Screens/selectedCategoryScreen.dart';
import './Screens/mealDetailPage.dart';
import './Screens/tabsScreen.dart';
import './Screens/filterScreen.dart';
import './Data/dummyData.dart';
import './Models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _favoriteMeals =[];


   void _toggleFavorite(String mealId){
    final _existingIndex =_favoriteMeals.indexWhere((meal) => meal.id ==mealId);
      if(_existingIndex >=0){
       setState(() {
          _favoriteMeals.removeAt(_existingIndex);
       });
      }else{
        setState(() {
          _favoriteMeals.add(DUMMY_MEALS.firstWhere((meals)=> meals.id == mealId)
          );
        });
      }
  }

  bool _checkFavorite(String checkId){
    return _favoriteMeals.any((meal) => meal.id == checkId);
  }
  // Map<String,bool> _filters ={
  //    'gluten':false,
  //    'lactose':false,
  //    'vegan':false,
  //    'vegetarian':false,
  // };
// List<Meal> _availableMeal =DUMMY_MEALS;


  // void _setFilters(Map<String,bool> _filterData){
  //     setState(() {
  //       _filters =_filterData;
  //       _availableMeal = DUMMY_MEALS.where((meal){
  //           if(_filters['gluten'] && !meal.isGlutenFree){
  //             return false;
  //           }
  //            if(_filters['lactose'] && !meal.isLactoseFree){
  //             return false;
  //           } if(_filters['vegan'] && !meal.isVegan){
  //             return false;
  //           } if(_filters['vegetarian'] && !meal.isVegetarian){
  //             return false;
  //           }
  //           return true;
  //       }).toList();
  //     });
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( 
        fontFamily: 'Raleway', 
        primarySwatch: Colors.blue,
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            //color: Colors.white
            ),
            title: TextStyle( 
                    fontFamily: 'RobotoCondensed',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
            ),
        ),
      ),
      //home:TabsScreen() ,
      routes: {
        '/': (ctx) =>TabsScreen(_favoriteMeals),
       // CategoriesScreen.headPage : (ctx) =>CategoriesScreen(),
      SelectedCategory.namedRoute : (ctx) =>SelectedCategory(),
      MealDetail.routePage : (ctx) => MealDetail(_toggleFavorite,_checkFavorite),
      FilterScreen.filterName :(ctx) => FilterScreen(),
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: 
        (ctx) => CategoriesScreen(),
        );
      },
    ); 
  }
}
