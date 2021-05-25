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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  void _openEndDrawer() {
    if (_scaffoldKey.currentState != null) {
      _scaffoldKey.currentState.openEndDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: _selectedIndex == 4
          ? AppBar(
              centerTitle: false,
              elevation: 0.0,
              title: Row(children: [
                Icon(
                  Icons.lock_outline_rounded,
                  size: 20,
                ),
                FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Text(
                    'mando_8291',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    print('open action sheets');
                  },
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                )
              ]),
              actions: [
                  IconButton(
                      splashRadius: 10,
                      icon: SvgPicture.asset(
                        'assets/images/add.svg',
                        width: 20,
                        height: 20,
                      ),
                      onPressed: () {}),
                  IconButton(
                      splashRadius: 14,
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        _openEndDrawer();
                      }),
                  SizedBox(
                    width: 10,
                  ),
                ])
          : null,
      bottomNavigationBar: getBottomNavigationBar(platform),
      body: _pageWidget.elementAt(_selectedIndex),
      endDrawer: getEndDrawer(size),
    );
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

  Widget getEndDrawer(size) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Drawer(
          elevation: 0.0,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 55,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]))),
                      child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'mando_8291',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Container(
                        height: 50,
                        // color: Colors.red,
                        child: InkWell(
                            onTap: () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 10),
                                Icon(Icons.history),
                                SizedBox(width: 10),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 3),
                                    child: Text('คลัง',
                                        style: TextStyle(fontSize: 16)))
                              ],
                            ))),
                    Container(
                        height: 50,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.history_toggle_off_outlined),
                              SizedBox(width: 10),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 3),
                                  child: Text('กิจกรรมของคุณ',
                                      style: TextStyle(fontSize: 16)))
                            ],
                          ),
                        )),
                    Container(
                        height: 50,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.qr_code_scanner_outlined),
                              SizedBox(width: 10),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 3),
                                  child: Text('คิวอาร์โคด้',
                                      style: TextStyle(fontSize: 16)))
                            ],
                          ),
                        )),
                    Container(
                        height: 50,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.bookmark_border_sharp),
                              SizedBox(width: 10),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 3),
                                  child: Text('บันทึกใว้',
                                      style: TextStyle(fontSize: 16)))
                            ],
                          ),
                        )),
                    Container(
                        height: 50,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.list_rounded),
                              SizedBox(width: 10),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 3),
                                  child: Text('เพื่อนสนิท',
                                      style: TextStyle(fontSize: 16)))
                            ],
                          ),
                        )),
                    Container(
                        height: 50,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.person_add_outlined),
                              SizedBox(width: 10),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 3),
                                  child: Text('ค้นพบผู้คน',
                                      style: TextStyle(fontSize: 16)))
                            ],
                          ),
                        )),
                  ],
                ),
                Positioned(
                    child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border(
                            top:
                                BorderSide(width: 1, color: Colors.grey[400]))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.settings),
                        SizedBox(
                          width: 5,
                        ),
                        Text('การตั้งค่า', style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ),
                ))
              ]),
        ),
      ),
    );
  }
}
