
import 'package:flutter/material.dart';
import '../../domain/entities/entities.dart';

class CategoryState {
  List<Categories> categories;
  int categoryIndex;


  final categoryScaffoldKey = GlobalKey<ScaffoldState>();



  CategoryState({required this.categories, this.categoryIndex = 1});

  factory CategoryState.empty() => CategoryState(categories: []);
}
