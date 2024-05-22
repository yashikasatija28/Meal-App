import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  static const routename = '/category-meals';

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  //final String Categoryid;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    final routeargs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final Categorytitle = routeargs['title'];
    final Categoryid = routeargs['id'];
    final CategoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(Categoryid);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(Categorytitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: CategoryMeals[index].id,
            title: CategoryMeals[index].title,
            imageurl: CategoryMeals[index].imageUrl,
            duration: CategoryMeals[index].duration,
            complexity: CategoryMeals[index].complexity,
            affordability: CategoryMeals[index].affordability,
          );
        },
        itemCount: CategoryMeals.length,
      ),
    );
  }
}
