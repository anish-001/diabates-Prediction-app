class UserModel {
  String? uid;
  String? email;
  String? displayname;
  String? height;
  String? weight;
  String? bloodgroup;
  String? dob;
  String? gender;

  UserModel({
    this.uid,
    this.email,
    this.displayname,
    this.height,
    this.weight,
    this.bloodgroup,
    this.dob,
    this.gender,
  });

  //data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      displayname: map['displayname'],
      height: map['height'],
      weight: map['weight'],
      bloodgroup: map['bloodgroup'],
      dob: map['dob'],
      gender: map['gender'],
    );
  }

  //send data to server
  Map<String, dynamic> tomap() {
    return {
      'uid': uid,
      'email': email,
      'displayname': displayname,
      'height': height,
      'weight': weight,
      'bloodgroup': bloodgroup,
      'dob': dob,
      'gender': gender
    };
  }
}
