class StateModal {
  String? pregnancy;
  String? glucose;
  String? bloodpressure;
  String? skinthickness;
  String? insulin;
  String? bmi;
  String? diabetespedigreefunc;
  String? age;
  String? output;
  String? cout;
  String? date;

  StateModal(
      {this.pregnancy,
      this.glucose,
      this.bloodpressure,
      this.skinthickness,
      this.insulin,
      this.bmi,
      this.diabetespedigreefunc,
      this.age,
      this.output,
      this.cout,
      this.date});

  //data from server
  factory StateModal.frommap(map) {
    return StateModal(
        pregnancy: map['pregnancy'],
        glucose: map['glucose'],
        bloodpressure: map['bloodpressure'],
        skinthickness: map['skinthickness'],
        insulin: map['insulin'],
        bmi: map['bmi'],
        diabetespedigreefunc: map['diabetespedigreefunc'],
        age: map['age'],
        output: map['output'],
        cout: map['cout'],
        date: map['date']);
  }

  //send data to server
  Map<String, dynamic> tomap() {
    return {
      'pregnancy': pregnancy,
      'glucose': glucose,
      'bloodpressure': bloodpressure,
      'skinthickness': skinthickness,
      'insulin': insulin,
      'bmi': bmi,
      'diabetespedigreefunc': diabetespedigreefunc,
      'age': age,
      'output': output,
      'cout': cout,
      'date': date
    };
  }
}
