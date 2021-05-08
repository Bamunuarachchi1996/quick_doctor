enum Gender { Male, Femail }

class UserModel {
  String id,
      name,
      userName,
      docName,
      adminName,
      phamName,
      email,
      address,
      telnum,
      birthday,
      nic,
      userType,
      docReg,
      docCat,
      pharmReg;
  Gender gender;
  List slots = [];

  UserModel();

  Map toMap() {
    Map<String, dynamic> map = Map();
    map['id'] = id;
    map['name'] = name;
    map['userName'] = userName;
    map['docName'] = docName;
    map['adminName'] = adminName;
    map['phamName'] = phamName;
    map['email'] = email;
    map['address'] = address;
    map['telnum'] = telnum;
    map['birthday'] = birthday;
    map['nic'] = nic;
    map['gender'] = gender == Gender.Male ? 'Male' : 'Female';
    map['userType'] = userType;
    map['docReg'] = docReg;
    map['docCat'] = docCat;
    map['pharmReg'] = pharmReg;
    map['slots'] = slots;
    return map;
  }

  UserModel.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    userName = map['userName'];
    docName = map['docName'];
    phamName = map['phamName'];
    adminName = map['adminName'];
    email = map['email'];
    address = map['address'];
    telnum = map['telnum'];
    birthday = map['birthday'];
    nic = map['nic'];
    gender = map['gender'] == 'Male' ? Gender.Male : Gender.Femail;
    userType = map['userType'];
    docReg = map['docReg'];
    docCat = map['docCat'];
    pharmReg = map['pharmReg'];
    slots = map['slots'];
  }

  String getID() {
    return id;
  }
}
