// ignore_for_file: prefer_const_constructors, unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabe/model/user_model.dart';
import 'package:diabe/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:diabe/model/previous_state.dart';

class ReportScreen extends StatefulWidget {
  static const routeName = '/report';
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  StateModal loggedInUser1 = StateModal();
  final List<Map<String, dynamic>> currentRecord = [];

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
              setState(() {})
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Report"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        // ignore: sort_child_properties_last, avoid_unnecessary_containers
        body: loggedInUser1.output != null
            ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView(
                // ignore: sort_child_properties_last
                children: [
                  // heartrate
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(245, 225, 233, 1),
                    ),
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // Icon(
                        //   Icons.monitor_heart_outlined,
                        //   size: 100,
                        //   color: Color.fromRGBO(28, 107, 164, 1),
                        // ),
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              "assets/images/heartRate.png",
                            )),

                        Text(
                          "Heart Rate",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(55, 0, 0, 0)),
                        Text(
                          "${loggedInUser1.bloodpressure}",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          "bpm",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                  // bloodsugar
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(250, 240, 219, 1),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset(
                                "assets/images/bloodSugar.png",
                              )),
                          Text(
                            "Blood Sugar",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(40, 0, 0, 0)),
                          Text(
                            "${loggedInUser1.glucose}",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "mg/dL",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          )
                        ],
                      )),
                  // bloodgroup
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(245, 225, 233, 1),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset(
                                "assets/images/blood.png",
                                scale: 0.6,
                              )),
                          Text(
                            "Blood Group",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(40, 0, 0, 0)),
                          Text(
                            "${loggedInUser.bloodgroup}",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )),
                  // weight
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(250, 240, 219, 1),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset(
                                "assets/images/weight.png",
                                scale: 0.6,
                              )),
                          Text(
                            "Weight",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(90, 0, 0, 0)),
                          Text(
                            "${loggedInUser.weight}",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "kg",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )),

                  // if diabetic
                  if (loggedInUser1.output == '1')
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(245, 225, 233, 1),
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                  "assets/images/db.png",
                                  scale: 16,
                                )),
                            Text(
                              "Diabetic",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(80, 0, 0, 0)),
                            Text(
                              "YES",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                              ),
                            ),
                          ],
                        )),

                  // if diabetic
                  if (loggedInUser1.output == '0')
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(245, 225, 233, 1),
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                  "assets/images/db.png",
                                  scale: 16,
                                )),
                            Text(
                              "Diabetic",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(80, 0, 0, 0)),
                            Text(
                              "NO",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                              ),
                            ),
                          ],
                        )),
                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 120),
              ),
            )
            : const Center(
                child: Text(
                  'No Reports Yet!',
                  style: TextStyle(fontSize: 24, color: unSelectedIconColor),
                ),
              ));
  }
}
