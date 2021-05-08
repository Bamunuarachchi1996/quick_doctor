class Medicine {
  String medicines,
      comments,
      illness,
      id,
      daysSince,
      duration,
      date,
      testsTo,
      allergies;

  Medicine();

  Map toMap() {
    Map<String, dynamic> map = Map();
    //map['date'] = DatePickerDateOrder;
    map['illness'] = illness;
    map['daysSince'] = daysSince;
    map['medicines'] = medicines;
    map['duration'] = duration;
    map['allergies'] = allergies;
    map['testsTo'] = testsTo;
    map['comments'] = comments;
    return map;
  }

  Medicine.fromMap(Map map) {
    date = map['date'];
    id = map['patient_id'];
    illness = map['illness'];
    daysSince = map['daysSince'];
    medicines = map['medicines'];
    duration = map['duration'];
    allergies = map['allergies'];
    testsTo = map['testsTo'];
    comments = map['comments'];
  }
}
