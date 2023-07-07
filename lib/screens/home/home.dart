import 'package:brew_crew1/screens/authenticate/authenticate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew1/services/auth.dart';
import 'package:brew_crew1/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew1/screens/home/brew_list.dart';
import 'package:brew_crew1/screens/home/settings_form.dart';

import '../../models/brew.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService(uid: '').brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Fikri Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text('Logout',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.settings,
                  color: Colors.white), // Set the color of the icon
              label: Text(
                'Settings',
                style:
                    TextStyle(color: Colors.white), // Set the color of the text
              ),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/wallpaper.jpg'),
                    fit: BoxFit.cover)),
            child: BrewList()),
      ),
    );
  }
}
