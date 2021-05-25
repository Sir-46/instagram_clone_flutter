import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
  List<Widget> _randomChildren;
  List<Widget> _randomHeightWidgets(BuildContext context) {
    _randomChildren ??= List.generate(1, (index) {
      var size = MediaQuery.of(context).size;
      return Padding(
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
          ],
        ),
      );
    });

    return _randomChildren;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(child: getBody(size)),
      ),
    );
  }

  Widget getBody(size) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [
            SliverList(
              delegate: SliverChildListDelegate(
                _randomHeightWidgets(context),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.black54,
              labelPadding: EdgeInsets.all(10),
              tabs: [
                Icon(Icons.grid_on_sharp),
                Icon(Feather.video),
              ],
            ),
            Expanded(
                child: TabBarView(
              children: [
                getImage(size, images),
                getImage(size, imageWithTags),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget getImage(size, images) {
    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 3,
      mainAxisSpacing: 1,
      crossAxisSpacing: 2,
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
}
