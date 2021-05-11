import 'package:flutter/material.dart';
import 'package:quick_doctor/doc_Profile_Main.dart';
import 'package:quick_doctor/utils/colorScheme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/userModel.dart';

class UserItem extends StatelessWidget {
  UserModel user;
  String imgName;
  UserItem({Key key, this.user, this.imgName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: docContentBgColor,
          ),
          child: Container(
            padding: EdgeInsets.all(7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/docprofile/$imgName'), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Dr. ${user.name}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      // width: 250,
                      // height: 50,
                      child: Text(
                        "${user.email}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: ()  {
                     launch("tel://${user.telnum}");
                    }, icon: Icon(Icons.phone), label: Text("${user.telnum}"))
                  ],
                ),
                SizedBox(width: 40,),
                IconButton(icon: Icon(Icons.add_box_rounded,size: 40,), onPressed: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DocProfileMain(user: user, type: "patient")));
                })
              ],
            ),
          ),
        ),
        // onTap: openDocInfo,
      ),
    );
  }
}
