import 'package:diet_driven/data/food_record.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String randomFood() {
  var foods = ["Grilled Pork Chops","Penne, Beef and Vegetable Casserole","Bang-Bang Shrimp","Slow Cooker Coq au Vin","Steak Sandwiches with Caramelized Peppers, Onions and Garlic","Slow-Cooker Cincinnati Chili","Instant Pot Turkey Chili","Skinnified Pork and Bean Burrito","Kale Pesto Avocado Grilled Cheese","Thai Peanut Chicken","Low Carb Peanut Butter Swirl Frozen Yogurt {No Sugar Added}","Chicken Salad with Grapes and Walnuts","Chef Race: Cornmeal-Crusted Catfish with Tomato-Zucchini Rice and Radish Slaw","Creamy Baked Risotto with Italian Sausage and Sun-Dried Tomatoes","Cook the Book: Shepherd's Pie","Grilled Chicken, Zucchini, and Quinoa Salad","Fruit Salad with Grilled Chicken and Citrus Poppy Seed Dressing","Chicken Fajita Casserole: One Pot, Many Flavors","Spinach Burrata Omelet with Avocado Salad","Roasted Garlic Macaroni and Cheese","Salmon Sandwiches with Fries","Grilled chicken with chilli & sesame seeds","Smoked Salmon Carbonara with Lemon and Dill","Calamari","Sweet Thai Shrimp Curry with Peanut Noodles","Beef Curry ??????","Pork Chops Romano in Lemon-Butter Sauce","Pork Tacos with Cilantro-Avocado Cream Sauce","Almond-Thyme-Crusted Mahi Mahi with Lemon Chardonnay Sauce","Stir-Fried Udon Noodles with Bok Choy","Creamy chicken & mango curry","Slow Cooker Chicken and Wild Rice Soup","Mexican Chicken Taco Skillet","Caprese Mac and Cheese","Homemade Creamy Chicken Noodle Soup","Seared Short Rib Wraps from 'Family Table","Chipotle Chicken Grilled Cheese Sandwich + Emmi USA’s “Gourmelt” Grilled Cheese Contest","Skirt Steak With Arugula Salad","Chicken Fajita Burgers","Contest-Winning Eggplant Parmesan","Roasted Summer Vegetable Mac + Cheese","Spinach and Artichoke Chicken","Caprese Zucchini Noodle Salad","Healthy Chicken Burgers with Spinach Basil Pesto & Mozzarella","Super Mom Stir Fry","Coconut & tamarind chicken curry","Guinea fowl tagine","Slow Cooker Chicken Tortellini Soup","Oven Baked Chicken Tacos – Our Newest Family Favorite","Coconut Pound Cake","Creamy Green Chile Chicken Enchiladas","Chicken Cacciatore","Bird's Nest Egg Salad","POTATOES WITH CHEESE SAUCE (PAPAS CHORREADAS)","Greek pasta salad","Mediterranean Crab and Couscous Stuffed Mushrooms","Snapper","Pan-Seared Cod in White Wine Tomato Basil Sauce","Cheesy Chicken and Broccoli Whole Wheat Pasta","Tofu Kabobs with Cherry Barbecue Sauce","Pan-seared Salmon with Asparagus for #WeekdaySupper","Grilled Watermelon Salad","Faggots with onion gravy","The TJ Hooker Pizza (Chipotle BBQ and Sweet Chili Pineapple + Jalapeño Pizza with Bacon)","Chicken and Corn Chowder","Dinner Tonight: Flattened Chicken with Tomato-Saffron Vinaigrette on Arugula","Slow Cooker Meatball Subs","Minty carrot, pistachio & feta salad","One Pot Garlic Butter Chicken, Green Beans & Potatoes","Avocado BLT","Seared Scallops with a Pomegranate Drizzle","Golden Beet & Beet Greens Pasta W/ Ricotta and Feta Cheese"];
  foods.shuffle();
  return foods[0];
}

class FoodRecordListTile extends StatelessWidget {
  final FoodRecord foodRecord;
  final Function update;
  final Function delete;

  FoodRecordListTile(this.foodRecord, this.update, this.delete);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(foodRecord.foodName),
      subtitle: Text(DateFormat.yMMMd().format(foodRecord.timestamp.toLocal())),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_upward),
            onPressed: () => update(foodRecord.rebuild((b) => b..mealIndex -= 1))
          ),
          IconButton(
            icon: Icon(Icons.arrow_downward),
            onPressed: () => update(foodRecord.rebuild((b) => b..mealIndex += 1))
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => delete(foodRecord) // FIXME: broken for some reason
      ),
      onTap: () => update(foodRecord.rebuild((b) => b..foodName = randomFood())),
    );
  }
}