import 'package:flutter/material.dart';
import '../Screens/selectedCategoryScreen.dart';
class CategoryItem extends StatelessWidget {
  final String title;
  final Color colour;
  final String id;

  CategoryItem(this.colour,this.title, this.id);

   void selectedCategory (BuildContext ctx){
     Navigator.of(ctx).pushNamed(
       SelectedCategory.namedRoute,
       arguments: {
         'id' : id,
         'title' : title,
       },
       );
   }
  @override
  Widget build(BuildContext context) {
    return InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () => selectedCategory(context) ,
          splashColor: Colors.deepOrange,
          child: Container(
        child: Text(title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.title,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ colour.withOpacity(0.6), colour,],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}