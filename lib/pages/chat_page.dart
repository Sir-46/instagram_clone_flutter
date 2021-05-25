import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_clone_flutter/utils/chat_json.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: getAppBar(),
        body: getBody(size),
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
        bottom: TabBar(indicatorColor: Colors.black54, tabs: [
          Tab(text: 'แชท'),
          Tab(
            text: 'ห้อง',
          )
        ]),
        centerTitle: false,
        elevation: 0.0,
        title: Row(children: [
          Text(
            'mando_8291',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 20,
          )
        ]),
        actions: [
          IconButton(
              splashRadius: 15,
              icon: Icon(Feather.video, size: 22),
              onPressed: () {}),
          IconButton(
              splashRadius: 15,
              icon: Icon(
                Feather.edit,
                size: 22,
              ),
              onPressed: () {}),
        ]);
  }

  Widget getBody(size) {
    return SafeArea(
      child: TabBarView(children: [
        ListView(
          children: [
            getChat(size),
          ],
        ),
        getRoom(size),
      ]),
    );
  }

  Widget getChat(size) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Container(
            height: 41,
            width: size.width - 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.withOpacity(0.3)),
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: TextField(
                cursorColor: Colors.black.withOpacity(0.5),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    hintText: 'ค้นหา',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.5))),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
            children: List.generate(chats.length, (index) {
          return InkWell(
            onTap: () async {
              Navigator.pushNamed(
                context,
                '/chatdetail',
                arguments: {
                  'id': chats[index]['id'],
                  'title': chats[index]['username'],
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    height: (size.width - 20) * 0.15,
                    width: (size.width - 20) * 0.15,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(chats[index]['profile']),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  shape: BoxShape.circle,
                                  color: Colors.green),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: (size.width - 20) * 0.7,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chats[index]['username'],
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            chats[index]['dateTime'],
                            style: TextStyle(color: Colors.grey[500]),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: (size.width - 20) * 0.15,
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Feather.camera,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          );
        }))
      ],
    );
  }

  Widget getRoom(size) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: Column(
          children: [
            Text(
              'วีดีโอแชทกับใครก็ได้',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                'เชิญผู้คนสูงสุด 50 คนเข้าร่วใวีดีโอแชท แม้จะเป็นคนที่ไม่มี Instagram หรือ Messanger ก็ตาม',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey)),
            SizedBox(
              height: 15,
            ),
            Text('สร้างห้อง', style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
