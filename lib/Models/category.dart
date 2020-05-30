import 'package:flutter/material.dart';

class Category{
 final String id;
 final String title;
 final Color colour;
const Category({
   this.colour =Colors.orange,
  @required this.id,
  @required this.title });
}