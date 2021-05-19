import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String title = 'ManDo App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ProfilePage')),
    );
  }
}
