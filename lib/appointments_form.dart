import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:quick_doctor/models/userModel.dart';

class AddAppointment extends StatefulWidget {
  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

///******************************* */
final FirebaseAuth auth = FirebaseAuth.instance;

void createID(UserModel _user) async {
  final User user =  auth.currentUser;
  final uid = user.uid;
  _user.id = uid;
}

///************************************* */
class _AddAppointmentState extends State<AddAppointment> {
  final UserModel _user = UserModel();

  //List<Medicine> _mediList = new List();

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController illnessController = TextEditingController();

  Map<String, dynamic> regData;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Appointments");

  ///***************/
  addData() {
    regData = {
      //"patient_id": UserModel().id,

      "patient_id": _user.id,
      "patientName": nameController.text,
      "date": dateController.text,
      "time": timeController.text,
      "illness": illnessController.text,
    };

    collectionReference
        .add(regData)
        .whenComplete(() => print('Added to the database'));
  }

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      child: TextField(
        controller: controller,
        decoration:
            InputDecoration(labelText: labelText, hintText: 'Type here...'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Book An Appointment',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: FormBuilder(
                  child: Column(
                    children: [
                      _buildTextField(nameController, 'Name'),
                      _buildTextField(dateController, 'Appointment Date'),
                      _buildTextField(timeController, 'Time'),
                      _buildTextField(illnessController, 'Illness'),

                      // FormBuilderTextField(
                      //   attribute: 'TYPE',
                      //   decoration: InputDecoration(
                      //       labelText: 'Type: ', hintText: 'Type of Illness'),
                      // ),
                      // FormBuilderTextField(
                      //   attribute: 'DAYS',
                      //   decoration: InputDecoration(
                      //       labelText: 'Days: ', hintText: 'Days from now'),
                      // ),
                      // FormBuilderTextField(
                      //   attribute: 'COMMENTS',
                      //   decoration: InputDecoration(
                      //       labelText: 'Comments: ',
                      //       hintText: 'Overall Comments'),
                      // )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: _mediList.length,
              //     itemBuilder: (context, index) => Container(
              //       padding: EdgeInsets.only(bottom: 10),
              //       margin: EdgeInsets.only(bottom: 10),
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.black, width: 3),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       child: FormBuilder(
              //           child: Column(
              //         children: [
              //           FormBuilderTextField(
              //             attribute: 'MEDCINE',
              //             onChanged: (value) =>
              //                 _mediList[index].medicine = value,
              //             decoration: InputDecoration(
              //                 icon: Icon(Icons.medical_services),
              //                 labelText: 'Medicine: '),
              //           ),
              //           FormBuilderTextField(
              //             attribute: 'DOSE',
              //             decoration: InputDecoration(
              //                 suffixText: 'mg/ml',
              //                 icon: Icon(Icons.format_color_reset_sharp),
              //                 labelText: 'Dose: '),
              //           ),
              //           FormBuilderTextField(
              //             attribute: 'QUANTITY',
              //             decoration: InputDecoration(
              //                 suffixText: 'tablets/pills',
              //                 icon: Icon(Icons.local_pharmacy),
              //                 labelText: 'Quantity: '),
              //           ),
              //           FormBuilderTextField(
              //             attribute: 'FREQUENCY',
              //             decoration: InputDecoration(
              //                 suffixText: 'hourly',
              //                 icon: Icon(Icons.lock_clock),
              //                 labelText: 'Frequecy: '),
              //           ),
              //           FormBuilderTextField(
              //             attribute: 'COMMENTS1',
              //             decoration: InputDecoration(
              //                 icon: Icon(Icons.comment),
              //                 labelText: 'Comments: '),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: FlatButton(
              //                 onPressed: () => setState(() {
              //                       _mediList.removeAt(index);
              //                     }),
              //                 child: Text('Remove')),
              //           )
              //         ],
              //       )),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addData();
            // setState(() {
            //   _mediList.add(Medicine());
            // });
          },
          tooltip: 'Increment',
          child: Icon(Icons.add_box),
          elevation: 2.0,
          backgroundColor: Colors.green,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          selectedItemColor: Colors.green[900],
          backgroundColor: Colors.lightGreen[200],
          onTap: (value) {
            switch (value) {
              case 0:
                Navigator.of(context).pushNamed('/main');
                break;
              case 1:
                Navigator.of(context).pushNamed('/main');
                break;
              default:
            }
          },
        ));
  }
}
