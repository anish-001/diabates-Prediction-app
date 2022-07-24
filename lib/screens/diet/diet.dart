// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabe/model/previous_state.dart';
import 'package:diabe/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/color_constant.dart';

// class Diet extends StatefulWidget {
//   static const routeName = "/diet";

//   const Diet({Key? key}) : super(key: key);

//   @override
//   State<Diet> createState() => _DietState();
// }

// class _DietState extends State<Diet> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.blueAccent),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           )),
//       body: SizedBox(
//         child: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(0.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     "7 Days Diabetic plan",
//                     style: AppStyle.textstyleoutfitmedium24,
//                   ),
//                   SizedBox(height: 30),
//                   Image.asset('assets/images/diet_plan.png',),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class Diet extends StatefulWidget {
  static const routeName = '/diet';

  const Diet({Key? key}) : super(key: key);

  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet> {
  User? user = FirebaseAuth.instance.currentUser;

  StateModal stateModal = StateModal();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("history")
        .doc("record")
        .get()
        .then((value) => {
              stateModal = StateModal.frommap(value.data()),
              setState(() {})
            });
  }

  final List<Map<String, dynamic>> dietPlanList = [
    {
      'day': 'Monday',
      'meal1': 'Breakfast',
      'breakfast_carbs': '30 grams carb',
      'breakfast':
          '1 cup oatmeal\n\n1 tbsp sliced almonds\n\n1 tbsp ground flaxseed',
      'meal2': 'Lunch',
      'lunch_carbs': '30-40 grams carb',
      'lunch':
          'Turkey sandwich on 2 slices whole wheat bread\n\nRaw vegies\n\nHummus dip',
      'meal3': 'Dinner',
      'dinner_carbs': '30-40 grams carb',
      'dinner': 'Half cup baked potato\n\nSpinach salad\n\n1 cup skin milk',
    },
    {
      'day': 'Tuesday',
      'meal1': 'Breakfast',
      'breakfast_carbs': '30 grams carb',
      'breakfast': 'Scrambled egg beaters on whole wheat english muffin',
      'meal2': 'Lunch',
      'lunch_carbs': '30-40 grams carb',
      'lunch': '1 cup bean soup\n\nGreen salad',
      'meal3': 'Dinner',
      'dinner_carbs': '30-40 grams carb',
      'dinner':
          'Chicken or steak stir fry with plenty of vegetables\n\nHalf cup brown rice',
    },
    {
      'day': 'Wednesday',
      'meal1': 'Breakfast',
      'breakfast_carbs': '30 grams carb',
      'breakfast':
          '1 cup oatmealn\n\n1 tbsp sliced almonds\n\n1 tbsp ground flaxseed',
      'meal2': 'Lunch',
      'lunch_carbs': '30-40 grams carb',
      'lunch': '1 whole tomato\n\n6 oz light yoghurt\n\n1 fruit',
      'meal3': 'Dinner',
      'dinner_carbs': '30-40 grams carb',
      'dinner':
          '3 oz grilled chicken breast\n\n1 cup baked acorn squash\n\n1 cup steamed broccoli\n\n1 cup skim milk',
    },
    {
      'day': 'Thursday',
      'meal1': 'Breakfast',
      'breakfast_carbs': '30 grams carb',
      'breakfast': '3/4 cup whole grain cereal\n\n1 cup skim milk',
      'meal2': 'Lunch',
      'lunch_carbs': '30-40 grams carb',
      'lunch':
          '1 cup vegetable soup\n\n1/2 turkey sandwich on 1 whole wheat bread\n\nRaw veggies',
      'meal3': 'Dinner',
      'dinner_carbs': '30-40 grams carb',
      'dinner':
          'Spaghetti dinner\n\n1 cup spaghetti squash\n\n1/2 cup spaghetti sauce\n\nTossed green salad',
    },
    {
      'day': 'Friday',
      'meal1': 'Breakfast',
      'breakfast_carbs': '30 grams carb',
      'breakfast':
          '1 cup oatmeal\n\n1 tbsp sliced almonds\n\n1 tbsp ground flaxseed',
      'meal2': 'Lunch',
      'lunch_carbs': '30-40 grams carb',
      'lunch':
          'Low fat cottage chese on 1 whole tomato\n\n4 Ak-Max crackers\n\n1 fruit',
      'meal3': 'Dinner',
      'dinner_carbs': '30-40 grams carb',
      'dinner': '2 slices thin crust veg pizza\n\nRomain lettuce salad'
    },
    {
      'day': 'Saturday',
      'meal1': 'Breakfast',
      'breakfast_carbs': '30 grams carb',
      'breakfast':
          '2 slices french toast made from whole wheat bread\n\nSugar free maple syrup',
      'meal2': 'Lunch',
      'lunch_carbs': '30-40 grams carb',
      'lunch':
          'Large green salad with grilled chicken breast\n\n1 cup skim milk\n\n1 fruit',
      'meal3': 'Dinner',
      'dinner_carbs': '30-40 grams carb',
      'dinner':
          '3 oz pan served trout\n\n1 cup stir fried vegetables\n\n1/2 cup brown rice'
    },
    {
      'day': 'Sunday',
      'meal1': 'Breakfast',
      'breakfast_carbs': '30 grams carb',
      'breakfast':
          'Scrambled Egg beaters omelet with vegetables\n\n2 slices whole wheat toast\n\nSliced tomatos',
      'meal2': 'Lunch',
      'lunch_carbs': '30-40 grams carb',
      'lunch':
          'Turkey sandwich on 2 slices whole wheat bread\n\nRaw vegies\n\nHummus dip',
      'meal3': 'Dinner',
      'dinner_carbs': '30-40 grams carb',
      'dinner':
          'Chicken and bean burrito with whole wheat low-carb tortilla \n\nSalsa or pico de gallo\n\nGreen salad'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '7 Days Diabetic Diet Plan',
          style: TextStyle(
            color: ColorConstant.black900,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: stateModal.output == 0 || stateModal.output == null
          ? const Center(
              child: Text(
                'Enjoy your food when you are not diabetic!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: unSelectedIconColor),
              ),
            )
          : ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: ExpansionTile(
                      collapsedBackgroundColor: index.isEven
                          ? Color.fromRGBO(245, 225, 233, 1)
                          : Color.fromRGBO(250, 240, 219, 1),
                      backgroundColor: index.isEven
                          ? Color.fromRGBO(245, 225, 233, 1)
                          : Color.fromRGBO(250, 240, 219, 1),
                      tilePadding:
                          EdgeInsets.only(top: 15, bottom: 15, right: 15),
                      title: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            dietPlanList[index]['day'],
                            style: TextStyle(
                                fontSize: 24,
                                color: iconColor,
                                fontFamily: 'SF Pro Display'),
                          )),
                      children: [
                        ExpansionTile(
                          title: Text(
                            dietPlanList[index]['meal1'],
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'SF Pro Display'),
                          ),
                          subtitle: Text(
                            dietPlanList[index]['breakfast_carbs'],
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'SF Pro Display'),
                          ),
                          children: [
                            ListTile(
                              title: Text(
                                dietPlanList[index]['breakfast'],
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'SF Pro Display'),
                              ),
                            )
                          ],
                        ),
                        ExpansionTile(
                          title: Text(
                            dietPlanList[index]['meal2'],
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'SF Pro Display'),
                          ),
                          subtitle: Text(
                            dietPlanList[index]['lunch_carbs'],
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'SF Pro Display'),
                          ),
                          children: [
                            ListTile(
                              title: Text(
                                dietPlanList[index]['lunch'],
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'SF Pro Display'),
                              ),
                            )
                          ],
                        ),
                        ExpansionTile(
                          title: Text(
                            dietPlanList[index]['meal3'],
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'SF Pro Display'),
                          ),
                          subtitle: Text(
                            dietPlanList[index]['dinner_carbs'],
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'SF Pro Display'),
                          ),
                          children: [
                            ListTile(
                              title: Text(
                                dietPlanList[index]['dinner'],
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'SF Pro Display'),
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ),
            ),
    );
  }
}
