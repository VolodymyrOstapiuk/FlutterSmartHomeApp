import 'package:flutter/material.dart';
import 'package:smart_home_app/show_user.dart';
import 'package:smart_home_app/models/user_data.dart';

class GoToUserProfile {
  final User user;
  final Function callbackThis;
  final bool isIOS;
  final BuildContext context;
  GoToUserProfile({this.context, this.isIOS, this.user, this.callbackThis});
  Widget showUser() {
    return this.isIOS
        ? FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowUser(
                        user: this.user,
                        callbackUser: this.callbackThis,
                      ),
                ),
              );
            },
            child: Text("Profile"),
          )
        : IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowUser(
                        user: this.user,
                        callbackUser: this.callbackThis,
                      ),
                ),
              );
            },
            icon: Icon(Icons.person),
          );
  }
}
