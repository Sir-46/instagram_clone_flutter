import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReelsPage extends StatefulWidget {
  ReelsPage({
    Key key,
  }) : super(key: key);

  @override
  _ReelsPageState createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  String title = 'ManDo App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ReelsPage')),
    );
  }
}
