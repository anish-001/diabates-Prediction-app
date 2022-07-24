// ignore_for_file: sized_box_for_whitespace, unnecessary_this, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabe/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../theme/app_style.dart';
import '../../utils/color_constant.dart';
import '../../utils/math_utils.dart';
import '../diet/diet.dart';
import '../predict/predict.dart';
import '../profile/profile.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/homePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then(
        (value) => {
              this.loggedInUser = UserModel.fromMap(value.data()),
              setState(() {})
            });
  }

  final List<Map<String, dynamic>> homePageList = [
    {
      'title': "Predict Diabetes",
      'image': "assets/images/predict.png",
      'description':
          "Predicting diabetes using advanced machine learning alogorithms. ",
      'buttonText': "Predict",
      'routeName': Predictform.routeName
    },
    {
      'title': "Diet Plans",
      'image': "assets/images/diet.png",
      'description':
          "Our food should be our medicine, our medicine should not be our food. ",
      'buttonText': "View",
      'routeName': Diet.routeName
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          30.00,
                                        ),
                                        bottom: getVerticalSize(
                                          20.00,
                                        ),
                                      ),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  width: size.width,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                          25.00,
                                                        ),
                                                        right:
                                                            getHorizontalSize(
                                                          23.00,
                                                        ),
                                                      ),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child: Padding(
                                                                          padding: EdgeInsets.only(
                                                                              right: getHorizontalSize(
                                                                                  10.00)),
                                                                          child: Text(
                                                                              "Hello!!",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.textstylenunitosansregular32.copyWith(fontSize: getFontSize(32), letterSpacing: 0.32)))),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerRight,
                                                                      child: Padding(
                                                                          padding: EdgeInsets.only(
                                                                              left: getHorizontalSize(
                                                                                  10.00)),
                                                                          child: Text(
                                                                              "${loggedInUser.displayname?.toUpperCase()}",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.textstylenunitosansregular32.copyWith(fontSize: getFontSize(32), letterSpacing: 0.32))))
                                                                ]),
                                                            ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        getHorizontalSize(
                                                                            360.00)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () => Navigator
                                                                      .pushNamed(
                                                                          context,
                                                                          Profile
                                                                              .routeName),
                                                                  child: Image.asset(
                                                                      'assets/images/profileImage.png',
                                                                      height: getSize(
                                                                          75.00),
                                                                      width: getSize(
                                                                          75.00),
                                                                      fit: BoxFit
                                                                          .fill),
                                                                ))
                                                          ]))),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  25.00,
                                                ),
                                                top: getVerticalSize(
                                                  36.00,
                                                ),
                                                right: getHorizontalSize(
                                                  23.00,
                                                ),
                                              ),
                                              child: ListView.builder(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: homePageList.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    margin: EdgeInsets.only(
                                                      top: getVerticalSize(
                                                        13.50,
                                                      ),
                                                      bottom: getVerticalSize(
                                                        13.50,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .whiteA700,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        getHorizontalSize(
                                                          20.00,
                                                        ),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: ColorConstant
                                                              .black900,
                                                          spreadRadius:
                                                              getHorizontalSize(
                                                            2.00,
                                                          ),
                                                          blurRadius:
                                                              getHorizontalSize(
                                                            2.00,
                                                          ),
                                                          offset: const Offset(
                                                            0,
                                                            4,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            left:
                                                                getHorizontalSize(
                                                              30.00,
                                                            ),
                                                            top:
                                                                getVerticalSize(
                                                              31.00,
                                                            ),
                                                            right:
                                                                getHorizontalSize(
                                                              30.00,
                                                            ),
                                                          ),
                                                          child: Text(
                                                            homePageList[index]
                                                                ["title"],
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              color:
                                                                  ColorConstant
                                                                      .black900,
                                                              fontSize:
                                                                  getFontSize(
                                                                16,
                                                              ),
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              letterSpacing:
                                                                  0.16,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top:
                                                                getVerticalSize(
                                                              31.00,
                                                            ),
                                                          ),
                                                          child: Image.asset(
                                                            homePageList[index]
                                                                ["image"],
                                                            height:
                                                                getVerticalSize(
                                                              187.36,
                                                            ),
                                                            width:
                                                                getHorizontalSize(
                                                              380.00,
                                                            ),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              getHorizontalSize(
                                                            311.00,
                                                          ),
                                                          margin:
                                                              EdgeInsets.only(
                                                            left:
                                                                getHorizontalSize(
                                                              35.00,
                                                            ),
                                                            top:
                                                                getVerticalSize(
                                                              16.64,
                                                            ),
                                                            right:
                                                                getHorizontalSize(
                                                              34.00,
                                                            ),
                                                          ),
                                                          child: Text(
                                                            homePageList[index]
                                                                ["description"],
                                                            softWrap: true,
                                                            maxLines: null,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              color:
                                                                  ColorConstant
                                                                      .black900,
                                                              fontSize:
                                                                  getFontSize(
                                                                14,
                                                              ),
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              letterSpacing:
                                                                  0.14,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                              left:
                                                                  getHorizontalSize(
                                                                287.00,
                                                              ),
                                                              right:
                                                                  getHorizontalSize(
                                                                34.00,
                                                              ),
                                                              bottom:
                                                                  getVerticalSize(
                                                                10.00,
                                                              ),
                                                            ),
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height:
                                                                  getVerticalSize(
                                                                23.00,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                59.00,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: ColorConstant
                                                                    .whiteA700,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  getHorizontalSize(
                                                                    20.00,
                                                                  ),
                                                                ),
                                                                border:
                                                                    Border.all(
                                                                  color: ColorConstant
                                                                      .blueA400,
                                                                  width:
                                                                      getHorizontalSize(
                                                                    0.50,
                                                                  ),
                                                                ),
                                                              ),
                                                              child: TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          2,
                                                                          2,
                                                                          2,
                                                                          2),
                                                                  primary:
                                                                      ColorConstant
                                                                          .blueA400,
                                                                ),
                                                                onPressed: () =>
                                                                    Navigator.pushNamed(
                                                                        context,
                                                                        homePageList[index]
                                                                            [
                                                                            'routeName']),
                                                                child: Text(
                                                                  homePageList[
                                                                          index]
                                                                      [
                                                                      "buttonText"],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    color: ColorConstant
                                                                        .blueA400,
                                                                    fontSize:
                                                                        getFontSize(
                                                                      14,
                                                                    ),
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    letterSpacing:
                                                                        0.14,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ])))
                            ]))))));
  }
}
