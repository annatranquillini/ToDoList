import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_list/DataModels/Colors.dart';
import 'package:to_do_list/DataModels/User.dart';

Widget profileTab(Future<User> user) {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  return FutureBuilder<User>(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        User.u = snapshot.data;
        var adr = snapshot.data.address;
        var cmp = snapshot.data.company;
        return Container(
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 42,
                    backgroundColor: CustomColors.blueTiffanyPallido,
                    child: CircleAvatar(
                      radius: 40,
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
                ),
                UserTile(
                  description: "Name",
                  info: snapshot.data.name,
                  icon: Icons.person,
                  onSaved: (value) {
                    User.u.name = value;
                  },
                ),
                UserTile(
                  description: "Username",
                  info: snapshot.data.username,
                  icon: Icons.person_outline,
                  onSaved: (value) {
                    User.u.username = value;
                  },
                ),
                UserTile(
                  description: "Phone number",
                  info: snapshot.data.phone,
                  icon: Icons.phone,
                  onSaved: (value) {
                    User.u.phone = value;
                  },
                ),
                UserTile(
                  description: "Website",
                  info: snapshot.data.website,
                  icon: Icons.web,
                  onSaved: (value) {
                    User.u.website = value;
                  },
                ),
                UserTile(
                  description: "Email",
                  info: snapshot.data.email,
                  icon: Icons.email,
                  onSaved: (value) {
                    User.u.email = value;
                  },
                ),
                UserTile(
                  description: "Address",
                  info: adr.suite,
                  icon: Icons.location_city,
                  onSaved: (value) {
                    User.u.address.street = value;
                  },
                ),
                UserTile(
                  info: adr.street,
                  onSaved: (value) {
                    User.u.address.street = value;
                  },
                ),
                UserTile(
                  info: adr.city,
                  onSaved: (value) {
                    User.u.address.city = value;
                  },
                ),
                UserTile(
                  info: adr.zipCode,
                  onSaved: (value) {
                    User.u.address.zipCode = value;
                  },
                ),
                UserTile(
                  description: "Company",
                  info: cmp.name,
                  icon: Icons.work,
                  onSaved: (value) {
                    User.u.company.name = value;
                  },
                ),
                UserTile(
                  info: "\"" + cmp.catchPhrase + "\"",
                  onSaved: (value) {
                    User.u.company.catchPhrase = value;
                  },
                ),
                UserTile(
                  info: cmp.bs,
                  onSaved: (value) {
                    User.u.company.bs = value;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FlatButton(
                    color: CustomColors.blueTiffany,
                    child: const Text(
                      'Submit changes',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        User.u.patch();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }

      // By default, show a loading spinner.
      return Center(child: CircularProgressIndicator());
    },
    future: user,
  );
}

class UserTile extends StatelessWidget {
  final String description;
  final String info;
  final IconData icon;
  final Function onSaved;

  UserTile({
    this.description = '',
    this.info,
    this.icon,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: TextFormField(
        onSaved: (value) {
          onSaved(value);
        },
        validator: (value) {
          if (value == '') {
            return "field must not be empty";
          } else
            return null;
        },
        initialValue: info,
      ),
      title: description == ''
          ? null
          : Text(
              description,
              style: TextStyle(color: CustomColors.blueTiffany, fontSize: 18),
            ),
      leading: Icon(icon),
    );
  }
}

