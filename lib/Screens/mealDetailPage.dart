import 'package:flutter/material.dart';
import '../Data/dummyData.dart';

class MealDetail extends StatelessWidget {
  final Function toggleFavorite;
  final Function checkFavorite;
  MealDetail(this.toggleFavorite,this.checkFavorite);
  static const routePage ='/Meal-detail';
  
  Widget mealTitle (String text,BuildContext context){
      return Container(
                   margin: EdgeInsets.symmetric(
                     vertical: 10,
                   ),
                  child: Text(
                             text,
                          style: Theme.of(context).textTheme.title,
                  ),
              );
  }
  Widget buildContainer(Widget seta){
        return  Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 150,
                  width: 300,
                  child: seta,
        );
  }
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) =>meal.id == mealId );
    return Scaffold(
           appBar: AppBar(
              title: Text('${selectedMeal.title}'),
           ),
            body: SingleChildScrollView(
                          child: Column(
                children: <Widget>[
                  Container(
                    child: Image.network(selectedMeal.imageUrl,
                     fit: BoxFit.cover,
                     ),
                    height: 300,
                    width: double.infinity,
                   
                  ),
                  mealTitle('ingredients', context),
                  buildContainer(
                            ListView.builder(itemBuilder: (ctx, index){
                           return Card(
                           child: Padding(
                             padding: const EdgeInsets.symmetric(
                               horizontal: 10,
                               vertical: 5,
                             ),
                             child: Text(selectedMeal.ingredients[index]),
                           ),
                           color: Theme.of(context).accentColor,

                      );
                    },
                    itemCount:selectedMeal.ingredients.length ,
                    ),
                  ),
                    
                  
                  mealTitle('Steps', context),
                  buildContainer(
                    ListView.builder(itemBuilder: (ctx,index){
                         return Column(
                           children: <Widget>[
                             ListTile(
                                leading: CircleAvatar(
                                  child: Text('#${(index + 1)}'),
                                ),
                                title: Text(selectedMeal.steps[index]),
                             ),
                             Divider(),
                           ],
                         );
                    },
                    itemCount: selectedMeal.steps.length,
                    )
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
         checkFavorite(mealId) ? Icons.star :Icons.star_border
          ),
        onPressed:() =>toggleFavorite(mealId),
        ),
    );
  }
}