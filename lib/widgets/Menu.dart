import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              'ManDo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            hoverColor: Colors.red,
            title: Text('Home'),
            selected: ModalRoute.of(context).settings.name == 'homestack/home'
                ? true
                : false,
            // onTap: () {
            //   Navigator.of(context, rootNavigator: true)
            //       .pushNamedAndRemoveUntil(
            //           '/', (Route<dynamic> route) => false);
            // },
          ),
        ],
      ),
    );
  }
}
