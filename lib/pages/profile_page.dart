import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_flutter/utils/account_image_json.dart';
import 'package:instagram_clone_flutter/utils/new_feeds_json.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String title = 'ManDo App';
  int selectedIndex = 1;

  void _openEndDrawer() {
    if (_scaffoldKey.currentState != null) {
      _scaffoldKey.currentState.openEndDrawer();
    }
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: getAppBar(),
      body: SafeArea(child: getBody(size)),
      endDrawer: getEndDrawer(size),
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: (size.width - 60) * .3,
                    child: Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.grey),
                              image: DecorationImage(
                                image: NetworkImage(newFeeds[0]['imageUrl']),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 20,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: (size.width - 20) * 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '8',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'โพสต์',
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '53',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text('ผู้ติดตาม')
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '113',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text('กำลังติดตาม')
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Fad Lan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('THIS IS THEWAY.'),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 35,
                width: size.width - 20,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[400]),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(child: Text('แก้ใขโปรไฟล์')),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: Row(
            children: [
              Container(
                width: (size.width * 0.5),
                child: IconButton(
                    splashRadius: 15,
                    icon: Icon(Icons.grid_on_sharp,
                        color: selectedIndex == 0 ? Colors.black : Colors.grey),
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    }),
              ),
              Container(
                width: size.width * 0.5,
                child: IconButton(
                    splashRadius: 15,
                    icon: Icon(
                      Icons.account_box_outlined,
                      color: selectedIndex == 1 ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    }),
              )
            ],
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  height: 1,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                      color: selectedIndex == 0
                          ? Colors.black
                          : Colors.transparent),
                ),
                Container(
                  height: 1,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                      color: selectedIndex == 1
                          ? Colors.black
                          : Colors.transparent),
                )
              ],
            ),
            Container(
              height: 0.5,
              width: size.width,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.8)),
            )
          ],
        ),
        SizedBox(
          height: 3,
        ),
        IndexedStack(
          index: selectedIndex,
          children: [
            getImage(size, images),
            getImage(size, imageWithTags),
          ],
        )
      ],
    );
  }

  Widget getImage(size, images) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 3,
      runSpacing: 3,
      children: List.generate(images.length, (index) {
        return Container(
          height: (size.width - 6) / 3,
          width: (size.width - 6) / 3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(images[index]), fit: BoxFit.cover)),
        );
      }),
    );
  }

  Widget getAppBar() {
    return AppBar(
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
        ]);
  }

  Widget getEndDrawer(size) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Drawer(
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
                    bottom: 0,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    width: 1, color: Colors.grey[400]))),
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
                            Padding(
                                padding: EdgeInsets.only(bottom: 3),
                                child: Text('การตั้งค่า',
                                    style: TextStyle(fontSize: 16)))
                          ],
                        ),
                      ),
                    ))
              ]),
        ),
      ),
    );
  }

  Widget getActionSheets() {
    return CupertinoPageScaffold(
      child: CupertinoButton(
        onPressed: () {
          showCupertinoModalPopup<void>(
            context: context,
            builder: (BuildContext context) => CupertinoActionSheet(
              title: const Text(
                '____',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              // message: const Text('Message'),
              actions: <CupertinoActionSheetAction>[
                CupertinoActionSheetAction(
                  child: const Text('Action One'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
        child: const Text('CupertinoActionSheet'),
      ),
    );
  }
}
