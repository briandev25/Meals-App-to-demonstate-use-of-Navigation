import 'package:flutter/material.dart';
import '../Data/dummyData.dart';
import '../Widgets/mealItem.dart';
class SelectedCategory extends StatelessWidget {
  static const namedRoute =   '/selectedCategoryDetail';
  // final String title;
  // final String id;
  // SelectedCategory(this.id,this.title);
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'] ;
    final finid = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((chosen){
      return chosen.categories.contains(finid);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
          body: ListView.builder(
            itemBuilder: (context,index) {
                  return MealItem(
                    id: categoryMeals[index].id,
                    title: categoryMeals[index].title,
                    imageUrl: categoryMeals[index].imageUrl,
                    affordability: categoryMeals[index].affordability,
                    complexity: categoryMeals[index].complexity,
                    duration: categoryMeals[index].duration,
                  );
            },
            itemCount: categoryMeals.length,
            ),
    );
  }
}