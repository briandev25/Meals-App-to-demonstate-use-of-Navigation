import 'package:flutter/material.dart';
import '../Data/dummyData.dart';
import '../Widgets/categoryItem.dart';
class CategoriesScreen extends StatelessWidget {
  //static const headPage ='/Category-meals';

  @override
  Widget build(BuildContext context) {
    return  GridView(
            padding: const EdgeInsets.all(20),
           children: DummyData.map(
             (data) =>  CategoryItem(data.colour, data.title,data.id),
           
           ).toList(),
              
           
           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
             maxCrossAxisExtent: 200,
             childAspectRatio: 3/2,
             crossAxisSpacing: 20,
             mainAxisSpacing: 20,
             ),
      
    );
  }
}