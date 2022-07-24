// ignore_for_file: prefer_const_constructors, unnecessary_this, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabe/model/user_model.dart';
import 'package:diabe/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:diabe/model/previous_state.dart';

class HistoryScreen extends StatefulWidget {
  static const routeName = '/history';
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

int total = 0;
int i = 0;

var previousReportsList = [];

class _HistoryScreenState extends State<HistoryScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  StateModal loggedInUser1 = StateModal();
  StateModal loggedUser = StateModal();

  final TextStyle historySubtiles = TextStyle(
      color: unSelectedIconColor, fontFamily: "SF Pro Display", fontSize: 14);

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then(
        (value) => {
              this.loggedInUser = UserModel.fromMap(value.data()),
              setState(() {})
            });
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("history")
        .doc("record")
        .get()
        .then((value) => {
              this.loggedInUser1 = StateModal.frommap(value.data()),
              setState(() {
                int cout = int.parse(loggedInUser1.cout.toString());
                while (i <= cout) {
                  FirebaseFirestore.instance
                      .collection("users")
                      .doc(user!.uid)
                      .collection("history")
                      .doc(total.toString())
                      .get()
                      .then((value) => {
                            this.loggedUser = StateModal.frommap(value.data()),
                            setState(() {
                              (previousReportsList.add({
                                "date": "${loggedUser.date}",
                                "bp": "${loggedUser.bloodpressure}",
                                "glucose": "${loggedUser.glucose}",
                                "insulin": "${loggedUser.insulin}",
                                "bmi": "${loggedUser.bmi}",
                                "output": "${loggedUser.output}"
                              }));

                              // ignore: avoid_print
                              print(previousReportsList);
                            })
                          });
                  total = total + 1;
                  i = i + 1;
                }
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: previousReportsList.isEmpty
          ? const Center(
              child: Text(
                "No History!",
                style: TextStyle(
                    fontSize: 24,
                    color: unSelectedIconColor,
                    fontFamily: "SF Pro Display"),
              ),
            )
          : ListView.builder(
              itemCount: previousReportsList.length,
              itemBuilder: (context, index) => Container(
                  key: ValueKey(previousReportsList[index]['date']),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: appBarColor),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        previousReportsList[index]["output"] == 1
                            ? CircleAvatar(
                                backgroundColor:
                                    Color.fromRGBO(245, 225, 233, 1),
                                child: Icon(Icons.add, color: Colors.black),
                              )
                            : CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 225, 245, 242),
                                child: Icon(
                                  Icons.horizontal_rule,
                                  color: Colors.black,
                                ),
                              ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(previousReportsList[index]["date"],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "SF Pro Display",
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "Blood Pressure : " +
                                          previousReportsList[index]["bp"],
                                      style: historySubtiles,
                                    ),
                                    Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "Insulin : " +
                                          previousReportsList[index]["insulin"],
                                      style: historySubtiles,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "Glucose : " +
                                          previousReportsList[index]["glucose"],
                                      style: historySubtiles,
                                    ),
                                    Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "BMI : " +
                                          previousReportsList[index]["bmi"],
                                      style: historySubtiles,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ),
    );
  }
}
