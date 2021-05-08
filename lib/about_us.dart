import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_doctor/models/userModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quick_doctor/pharmacy_list.dart';
import 'viewmodels/pharmacy_search_viewmodel.dart';
import 'viewmodels/doc_list_view_model.dart';


_buildTextView(String text) {
  return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Icon(Icons.local_hospital),
          SizedBox(
            width: 10,
          ),
          Text(text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ],
      ));
}

final List<String> imgList = [
  'assets/1_med.jpg',
  'assets/2_med.jpg',
  'assets/3_med.jpg',
  'assets/4_med.jpg',
  'assets/1_med.jpg',
];

class AboutUs extends StatelessWidget {
  final UserModel user;

  const AboutUs({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Container(
        alignment: Alignment.centerLeft,
        child: ChangeNotifierProvider(
          create: (context) => DocListViewModel(),
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Quick Doctor',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                'about us',
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(165.0, 12.0, 0.0, 0.0),
                              child: Text(
                                '.',
                                style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: CarouselSlider(
                        options: CarouselOptions(),
                        items: imgList
                            .map((item) => Container(
                                  padding: EdgeInsets.only(right: 3, left: 3),
                                  child: Center(
                                      child: Image.asset(item,
                                          height: 200,
                                          fit: BoxFit.cover,
                                          width: 800)),
                                ))
                            .toList(),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          'With Quick Doctor you can access your medical records, email your care team, schedule appointments, check in to your appointment, request prescription refills and more. Trouble with your account? Call 206.520.8963.',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          'Doctors Available',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Container(
                          child: Consumer<DocListViewModel>(
                              builder: (context, model, child) {
                            return model.users != null && model.users.length > 0
                                ? ListView(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        left: 20,
                                        right: 40,
                                        bottom: 0),
                                    children: model.users.map((e) {
                                      return GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1)),
                                                child: _buildTextView(
                                                    "Dr. " + e.name),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  )
                                : Container();
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          'Registered Pharmacies',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: ChangeNotifierProvider(
                        create: (context) => PharmacySearchViewModel(),
                        child: Consumer<PharmacySearchViewModel>(
                            builder: (context, model, child) {
                          return model.users != null && model.users.length > 0
                              ? ListView(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 40, bottom: 20),
                                  children: model.users.map((e) {
                                    return GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 50,
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(1)),
                                              child: Column(children: [
                                                _buildTextView(e.name),
                                                Text(e.address),
                                              ]),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                )
                              : Container();
                        }),
                      )),
                      Container(
                        height: 20,
                      )
                    ]),
              )),
        ));
  }
}
