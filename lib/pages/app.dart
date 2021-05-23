import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_flutter/pages/home_page.dart';
import 'package:instagram_clone_flutter/pages/profile_page.dart';
import 'package:instagram_clone_flutter/pages/reels_page.dart';
import 'package:instagram_clone_flutter/pages/search_page.dart';
import 'package:instagram_clone_flutter/pages/store_page.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;

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
    var platform = Theme.of(context).platform;
    return Scaffold(
        bottomNavigationBar: getBottomNavigationBar(platform),
        body: _pageWidget.elementAt(_selectedIndex));
  }

  Widget getBottomNavigationBar(platform) {
    return Container(
      height: platform == TargetPlatform.iOS ? 70 : 55,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border(
            top: BorderSide(width: 0.5, color: Colors.black.withOpacity(0.2))),
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
