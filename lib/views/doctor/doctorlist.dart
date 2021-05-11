import 'package:flutter/material.dart';
import 'package:quick_doctor/doc_Profile_Main.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:quick_doctor/services/database.dart';
import 'package:quick_doctor/viewmodels/doc_list_view_model.dart';
import 'package:quick_doctor/views/doctor/widgets/useritem.dart';

class DoctorList extends StatefulWidget {
  final String cat;
  DoctorList({Key key, this.cat}) : super(key: key);

  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  DocListViewModel viewModel;
  Database database = new Database();
  List<UserModel> docList = [];
  bool isloading = true;

  @override
  void initState() {
    print(widget.cat);
    // viewModel = DocListViewModel(cat: widget.cat);
    getData();
    super.initState();
  }

  getData() async {
    database.getDocCat(widget.cat).then((value) {
      setState(() {
        docList = value;
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.cat} near you"),
      ),
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : docList.isNotEmpty? Container(
              height: size.height,
              padding: EdgeInsets.only(top: 20),
              child: ListView.builder(
                  itemCount: docList.length,
                  itemBuilder: (context, index) {
                    return UserItem(
                      user: docList[index],
                      imgName: docList[index].gender == Gender.Male ? "doc2.png" : "doc1.png",
                    );

                    // ListTile(
                    //   contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    //   onTap: () {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) => DocProfileMain(user: docList[index], type: "patient")));

                    //     // ExtendedNavigator.of(context).push(Routes.docProfileMain,
                    //     //     arguments: DocProfileMainArguments(user: model.users[index], type: "patient"));
                    //   },
                    //   leading: Icon(
                    //     Icons.person_rounded,
                    //     size: 60,
                    //   ),
                    //   title: Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       Column(
                    //         crossAxisAlignment: CrossAxisAlignment.end,
                    //         children: [
                    //           RichText(
                    //             text: TextSpan(
                    //                 text: "Dr. ",
                    //                 style: TextStyle(
                    //                   fontSize: 20,
                    //                   color: Colors.grey,
                    //                   fontWeight: FontWeight.bold,
                    //                 ),
                    //                 children: [TextSpan(text: docList[index].name, style: TextStyle(color: Colors.black))]),
                    //           ),
                    //           TextButton.icon(
                    //               onPressed: () {}, icon: Icon(Icons.phone), label: Text("${docList[index].telnum}"))
                    //         ],
                    //       ),
                    //       IconButton(onPressed: (){}, icon: Icon(Icons.add_box_outlined),)
                    //     ],
                    //   ),
                    // );
                    // Text(docList[index].name);
                  }),

              // ChangeNotifierProvider(
              //   create: (context) => viewModel,
              //   child: Consumer<DocListViewModel>(builder: (context, model, child) {
              //     return model.users == null
              //         ? Container(
              //             child: Center(child: CircularProgressIndicator()),
              //           )
              //         : ListView.builder(
              //             itemBuilder: (context, index) => ListTile(
              //               onTap: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) => DocProfileMain(user: model.users[index], type: "patient")));

              //                 // ExtendedNavigator.of(context).push(Routes.docProfileMain,
              //                 //     arguments: DocProfileMainArguments(user: model.users[index], type: "patient"));
              //               },
              //               leading: Icon(
              //                 Icons.person_rounded,
              //                 size: 50,
              //               ),
              //               title: RichText(
              //                 text: TextSpan(
              //                     text: model.users[index].name,
              //                     style: TextStyle(
              //                       color: Colors.black,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     children: [TextSpan(text: model.users[index].name, style: TextStyle(color: Colors.grey))]),
              //               ),
              //             ),
              //             itemCount: model.users.length,
              //           );
              //   }),
              // ),
            ): Center(child: Text("No doctors under this category")),
    );
  }
}
