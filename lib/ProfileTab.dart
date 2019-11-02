import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Colors.dart';
import 'User.dart';


Widget profileTab(Future<User >user) {

  return FutureBuilder<User>(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(

                  minRadius: 40,
                  child: Text(
                    snapshot.data.name
                        .split(' ')
                        .map(
                          (word) => word[0].toUpperCase(),
                    )
                        .join(),
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
              UserTile(
                description: "Name",
                info: snapshot.data.name,
                icon: Icons.person,
              ),
              UserTile(
                description: "Username",
                info: snapshot.data.username,
                icon: Icons.person_outline,
              ),
              UserTile(
                description: "Phone number",
                info: snapshot.data.phone,
                icon: Icons.phone,
              ),
              UserTile(
                description: "WebSite",
                info: snapshot.data.website,
                icon: Icons.web,
              ),
              UserTile(
                description: "Email",
                info: snapshot.data.email ?? '',
                icon: Icons.email,
              ),
            ],
          ),
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }

      // By default, show a loading spinner.
      return CircularProgressIndicator();
    },
    future: user,
  );
}


class UserTile extends StatelessWidget {
  final String description;
  final String info;
  final IconData icon;

  UserTile({
    this.description,
    this.info,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        description,
        style: TextStyle(color: CustomColors.blueTiffany),
      ),
      subtitle: Text(info),
      trailing: Icon(icon),
    );
  }
}


