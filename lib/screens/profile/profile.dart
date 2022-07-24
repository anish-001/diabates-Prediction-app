// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, duplicate_ignore, unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabe/model/user_model.dart';
import 'package:diabe/provider/authentication_provider.dart';
import 'package:diabe/screens/login/login.dart';
import 'package:diabe/screens/signupdetails/signupdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/color_constant.dart';
import '../../utils/math_utils.dart';

class Profile extends StatefulWidget {
  static const routeName = '/profile';

  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  @override
  Widget build(BuildContext context) {
    final logoutButton = TextButton(
      onPressed: () {
        context.read<AuthenticationProvider>().logOut();
        Navigator.popAndPushNamed(context, Login.routeName);
      },
      child: Text(
        "Logout",
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Personal Information',
            style: TextStyle(
              color: ColorConstant.black900,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w600,
            ),
          )),
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Container(
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    left: getHorizontalSize(
                      35.00,
                    ),
                    top: getVerticalSize(
                      35.00,
                    ),
                    right: getHorizontalSize(
                      30.00,
                    ),
                    bottom: getVerticalSize(
                      20.00,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                75.00,
                              ),
                            ),
                            child: Image.asset(
                              'assets/images/profileImage.png',
                              height: getSize(
                                150.00,
                              ),
                              width: getSize(
                                150.00,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: logoutButton,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            43.00,
                          ),
                          right: getHorizontalSize(
                            10.00,
                          ),
                        ),
                        child: Text(
                          "Name",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              12,
                            ),
                            fontFamily: 'Catamaran',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.12,
                            height: 1.33,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            4.00,
                          ),
                          right: getHorizontalSize(
                            10.00,
                          ),
                        ),
                        child: Text(
                          "${loggedInUser.displayname}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              17,
                            ),
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.17,
                            height: 0.94,
                          ),
                        ),
                      ),
                      Container(
                        height: getVerticalSize(
                          0.50,
                        ),
                        width: getHorizontalSize(
                          354.00,
                        ),
                        margin: EdgeInsets.only(
                          top: getVerticalSize(
                            11.00,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            29.00,
                          ),
                          right: getHorizontalSize(
                            10.00,
                          ),
                        ),
                        child: Text(
                          "Birthdate",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              12,
                            ),
                            fontFamily: 'Catamaran',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.12,
                            height: 1.33,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            4.08,
                          ),
                        ),
                        child: Container(
                          height: getVerticalSize(
                            27.07,
                          ),
                          width: getHorizontalSize(
                            354.00,
                          ),
                          child: Text(
                            "${loggedInUser.dob}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                17,
                              ),
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.17,
                              height: 0.94,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            29.00,
                          ),
                          right: getHorizontalSize(
                            10.00,
                          ),
                        ),
                        child: Text(
                          "Gender",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              12,
                            ),
                            fontFamily: 'Catamaran',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.12,
                            height: 1.33,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            3.83,
                          ),
                        ),
                        child: Container(
                          height: getVerticalSize(
                            28.32,
                          ),
                          width: getHorizontalSize(
                            354.00,
                          ),
                          child: Text(
                            "${loggedInUser.gender}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                17,
                              ),
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.17,
                              height: 0.94,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            29.00,
                          ),
                          right: getHorizontalSize(
                            10.00,
                          ),
                        ),
                        child: Text(
                          "Email",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              12,
                            ),
                            fontFamily: 'Catamaran',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.12,
                            height: 1.33,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            4.18,
                          ),
                        ),
                        child: Container(
                          height: getVerticalSize(
                            26.61,
                          ),
                          width: getHorizontalSize(
                            354.00,
                          ),
                          child: Text(
                            "${loggedInUser.email}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                17,
                              ),
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.17,
                              height: 0.94,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            29.00,
                          ),
                          right: getHorizontalSize(
                            10.00,
                          ),
                        ),
                        child: Text(
                          "Height",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              12,
                            ),
                            fontFamily: 'Catamaran',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.12,
                            height: 1.33,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            4.48,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: getVerticalSize(
                                  1.12,
                                ),
                              ),
                              child: Text(
                                "${loggedInUser.height}",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    17,
                                  ),
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.17,
                                  height: 0.94,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  3.00,
                                ),
                                top: getVerticalSize(
                                  1.12,
                                ),
                                right: getHorizontalSize(
                                  302.00,
                                ),
                              ),
                              child: Text(
                                "cm",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    17,
                                  ),
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.17,
                                  height: 0.94,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            29.00,
                          ),
                          right: getHorizontalSize(
                            10.00,
                          ),
                        ),
                        child: Text(
                          "Weight",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(
                              12,
                            ),
                            fontFamily: 'Catamaran',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.12,
                            height: 1.33,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            5.22,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "${loggedInUser.weight}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(
                                  17,
                                ),
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.17,
                                height: 0.94,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  4.96,
                                ),
                                right: getHorizontalSize(
                                  309.37,
                                ),
                              ),
                              child: Text(
                                "Kg",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    17,
                                  ),
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.17,
                                  height: 0.94,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            29.00,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: getHorizontalSize(
                                  10.00,
                                ),
                              ),
                              child: Text(
                                "Blood Group",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Catamaran',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.12,
                                  height: 1.33,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(
                                  4.48,
                                ),
                              ),
                              // ignore: avoid_unnecessary_containers
                              child: Container(
                                child: Text(
                                  "${loggedInUser.bloodgroup}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      17,
                                    ),
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.17,
                                    height: 0.94,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getVerticalSize(50)),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blueAccent,
                          child: MaterialButton(
                            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            minWidth: MediaQuery.of(context).size.width,
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signupDetails()),
                                  (route) => false);
                            },
                            child: Text(
                              "Edit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
