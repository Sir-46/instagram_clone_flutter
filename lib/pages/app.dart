import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_flutter/pages/HomPage.dart';
import 'package:instagram_clone_flutter/pages/ProfilePage.dart';
import 'package:instagram_clone_flutter/pages/ReelsPage.dart';
import 'package:instagram_clone_flutter/pages/SearchPage.dart';
import 'package:instagram_clone_flutter/pages/StorePage.dart';

import 'package:instagram_clone_flutter/utils/bottom_navigation_bar_json.dart';

class App extends StatefulWidget {
  App({
    Key key,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String title = 'ManDo App';
  int _selectedIndex = 0;

  List<Widget> _pageWidget = <Widget>[
    HomePage(),
    SearchPage(),
    ReelsPage(),
    StorePage(),
    ProfilePage()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: getBottomNavigationBar(),
        body: _pageWidget.elementAt(_selectedIndex));
  }

  Widget getBottomNavigationBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border(
            top: BorderSide(width: 1, color: Colors.black.withOpacity(0.3))),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(icons.length, (index) {
              return IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                icon: SvgPicture.asset(
                  _selectedIndex == index
                      ? icons[index]['active']
                      : icons[index]['inactive'],
                  width: 25,
                  height: 25,
                ),
              );
            })),
      ),
    );
  }
}
