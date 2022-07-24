// ignore_for_file: unused_import, unnecessary_new, prefer_const_constructors, unnecessary_this, prefer_interpolation_to_compose_strings, unused_field, camel_case_types, depend_on_referenced_packages, prefer_final_fields, unnecessary_null_comparison
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabe/model/previous_state.dart';
import 'package:diabe/model/user_model.dart';
import 'package:diabe/provider/home_provider.dart';
import 'package:diabe/screens/dashboard/dashboard.dart';
import 'package:diabe/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import '../report/report.dart';

class signupDetails extends StatefulWidget {
  static const routeName = '/signupdetails';

  const signupDetails({Key? key}) : super(key: key);

  @override
  State<signupDetails> createState() => _signupDetailsState();
}

// ignore: constant_identifier_names
enum SingingCharacter { Male, Female }

class _signupDetailsState extends State<signupDetails> {
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

  //form key
  final _formkey = GlobalKey<FormState>();
  //controller
  final TextEditingController heightcontroller = new TextEditingController();
  final TextEditingController weightcontroller = new TextEditingController();
  final TextEditingController bloodgroupcontroller =
      new TextEditingController();
  final TextEditingController dobcontroller = new TextEditingController();
  DateTime? pickedDate;
  SingingCharacter? gendercontroller = SingingCharacter.Male;

  //firebase

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // heightfield
    final heightfield = TextFormField(
      autofocus: false,
      controller: heightcontroller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Height");
        }
        return null;
      },
      onSaved: (value) {
        heightcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Height",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        helperText: "Enter height in cm.",
      ),
    );

    //weightfield
    final weightfield = TextFormField(
      autofocus: false,
      controller: weightcontroller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Weight");
        }
        return null;
      },
      onSaved: (value) {
        weightcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "weight",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        helperText: "Enter weight in kg.",
      ),
    );

    //Bloodgroupfield
    final bloodgroupfield = TextFormField(
      autofocus: false,
      controller: bloodgroupcontroller,
      keyboardType: TextInputType.text,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9+_.-]*'))
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Blood Group");
        }
        return null;
      },
      onSaved: (value) {
        weightcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: "Bloodgroup",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        helperText: "Format: AB+, if your blood group is AB positive.",
      ),
    );

    //dobfield
    final dobfield = TextField(
      controller: dobcontroller, //editing controller of this TextField
      decoration: InputDecoration(
          icon: Icon(Icons.calendar_today), //icon of text field
          labelText: "Enter Date of Birth" //label text of field
          ),
      readOnly: true, //set it true, so that user will not able to edit text
      onTap: () async {
        pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime(2000 - 01 - 01),
            firstDate: DateTime(
                1940), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime.now());

        if (pickedDate != null) {
          // print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate!);
          // print(formattedDate); //formatted date output using intl package =>  2021-03-16
          //you can implement different kind of Date Format here according to your requirement
          setState(() {
            dobcontroller.text =
                formattedDate; //set output date to TextField value.
          });
        }
      },
    );
    //gender
    final gender = Column(
      children: [
        Text(
          "Sex:",
          textAlign: TextAlign.left,
        ),
        ListTile(
          title: const Text('Male'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Male,
            groupValue: gendercontroller,
            onChanged: (SingingCharacter? value) {
              setState(() {
                gendercontroller = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Female'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Female,
            groupValue: gendercontroller,
            onChanged: (SingingCharacter? value) {
              setState(() {
                gendercontroller = value;
              });
            },
          ),
        ),
      ],
    );

    //saveifo
    final saveButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (pickedDate == null) {
            Fluttertoast.showToast(msg: "Enter valid Date");
          } else if (gendercontroller == null) {
            Fluttertoast.showToast(msg: "Input Sex");
          } else {
            save(
                heightcontroller.text,
                weightcontroller.text,
                bloodgroupcontroller.text,
                dobcontroller.text,
                gendercontroller!);
          }
        },
        child: Text(
          "Save",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blueAccent),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 45),
                    heightfield,
                    SizedBox(height: 20),
                    weightfield,
                    SizedBox(height: 20),
                    bloodgroupfield,
                    SizedBox(height: 20),
                    dobfield,
                    SizedBox(height: 20),
                    gender,
                    SizedBox(
                      height: 20,
                    ),
                    saveButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void save(String height, String weight, String bloodgroup, String dob,
      SingingCharacter gender) async {
    if (_formkey.currentState!.validate()) {
      try {
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        loggedInUser.height = heightcontroller.text;
        loggedInUser.weight = weightcontroller.text;
        loggedInUser.bloodgroup = bloodgroupcontroller.text;
        loggedInUser.dob = dobcontroller.text;
        loggedInUser.gender = gender.name;

        await firebaseFirestore
            .collection("users")
            .doc(loggedInUser.uid)
            .set(loggedInUser.tomap());
        Fluttertoast.showToast(msg: "Data Added Sucessfully");

        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Home()), (route) => false);
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}
