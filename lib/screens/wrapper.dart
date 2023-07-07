import 'package:brew_crew1/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew1/screens/home/home.dart';
import 'package:brew_crew1/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);

    //return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
