import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone_flutter/theme/colors.dart';
import 'package:instagram_clone_flutter/utils/new_feeds_json.dart';
import 'package:instagram_clone_flutter/utils/story_json.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = 'ManDo App';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(size),
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(stories.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(0.8),
                child: Container(
                  width: 80.0,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          stories[index]['isStory']
                              ? Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          colors: bgStoryColors)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 2, color: bgWhite),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  stories[index]['imageUrl']),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    width: 70.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                stories[index]['imageUrl']),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                          stories[index]['isAdd']
                              ? Positioned(
                                  right: 5,
                                  bottom: 0,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: primary),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ))
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${stories[index]['username']}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        Divider(),
        Column(
          children: List.generate(newFeeds.length, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14, right: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient:
                                      LinearGradient(colors: bgStoryColors)),
                              child: Padding(
                                  padding: EdgeInsets.all(1.3),
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                newFeeds[index]['profile']),
                                            fit: BoxFit.cover)),
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${newFeeds[index]['username']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Icon(
                          FontAwesome.ellipsis_v,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(newFeeds[index]['imageUrl']))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                splashRadius: 15,
                                icon: newFeeds[index]['isLike']
                                    ? SvgPicture.asset(
                                        'assets/images/heart_red.svg')
                                    : SvgPicture.asset(
                                        'assets/images/heart.svg',
                                        width: 24,
                                        height: 24,
                                      ),
                                onPressed: () {}),
                            IconButton(
                                splashRadius: 15,
                                icon: SvgPicture.asset(
                                  'assets/images/comment.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                onPressed: () {}),
                            IconButton(
                                splashRadius: 15,
                                icon: SvgPicture.asset(
                                  'assets/images/heart.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                        IconButton(
                            icon: Icon(Icons.bookmark_border_sharp),
                            onPressed: () {})
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ถูกใจ ${newFeeds[index]['likes']} คน',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: newFeeds[index]['username'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: ' ${newFeeds[index]['caption']}',
                          )
                        ])),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          newFeeds[index]['comments'],
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: (size.width - 30) * 0.7,
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                newFeeds[index]['imageUrl']),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    height: 25,
                                    width: (size.width - 100) * 0.7,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 10, right: 10),
                                      child: TextField(
                                        cursorColor: textBlack.withOpacity(0.5),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Add a comment',
                                            hintStyle: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black
                                                    .withOpacity(0.5))),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: (size.width - 30) * 0.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('😜'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('😜'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.grey,
                                    size: 12,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          newFeeds[index]['dateTime'],
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        )
      ],
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: SvgPicture.asset(
        'assets/images/logo.svg',
        width: 28,
        height: 28,
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/add.svg',
            width: 24,
            height: 24,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/heart.svg',
            width: 24,
            height: 24,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/message.svg',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/chat');
          },
        ),
      ],
    );
  }
}
