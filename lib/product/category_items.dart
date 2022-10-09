import '../core/category_model.dart';
import 'package:flutter/material.dart';

class CategoryItems{
  late final List<CategoryModel> categories;

  CategoryItems(){
    categories = [
      CategoryModel(
        icon: Icons.all_inbox,
        title: 'All Items'
      ),
      CategoryModel(
          icon: Icons.layers,
          title: 'Weapons'
      ),
      CategoryModel(
          icon: Icons.watch,
          title: 'Armors'
      ),
      CategoryModel(
          icon: Icons.ac_unit,
          title: 'Materials'
      ),
      CategoryModel(
          icon: Icons.accessibility,
          title: 'Clothes'
      ),
      CategoryModel(
          icon: Icons.interests,
          title: 'Resources'
      ),
    ];
  }
}
