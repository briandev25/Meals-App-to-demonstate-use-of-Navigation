import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../Widgets/mealItem.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
   if(favoriteMeals.isEmpty) {
    return Center(
        child: Text('No Favorites Added'),
    );
   }
  else{
    return ListView.builder(
            itemBuilder: (context,index) {
                  return MealItem(
                    id: favoriteMeals[index].id,
                    title: favoriteMeals[index].title,
                    imageUrl: favoriteMeals[index].imageUrl,
                    affordability: favoriteMeals[index].affordability,
                    complexity: favoriteMeals[index].complexity,
                    duration: favoriteMeals[index].duration,
                  );
            },
            itemCount: favoriteMeals.length,
            );
   }
  }
}