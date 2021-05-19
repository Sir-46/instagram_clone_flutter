import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
  String title = 'ManDo App';
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(),
      body: SafeArea(child: getBody(size)),
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
              splashRadius: 14, icon: Icon(Icons.menu), onPressed: () {}),
          SizedBox(
            width: 10,
          ),
        ]);
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
