import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_clone_flutter/utils/chat_detail_json.dart';

class ChatDetailPage extends StatefulWidget {
  ChatDetailPage({Key key}) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  String avatar =
      'https://i.pinimg.com/originals/cd/63/95/cd63958613ce86afc242b1bcc5812bba.jpg';

  void _onItemTapped(int index) {
    print('on tab');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: getAppBar(arguments),
      bottomNavigationBar: getBottomNavigationBar(size),
      body: getBody(size),
    );
  }

  Widget getAppBar(arguments) {
    return AppBar(
      elevation: 0,
      title: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      chatDetails[arguments['id']]['profile'] == true
                          ? chatDetails[arguments['id']]['profile']
                          : avatar),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '${arguments['title']}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              'Avtive',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )
          ]),
        ],
      ),
      actions: [
        IconButton(
            splashRadius: 15, icon: Icon(Feather.phone), onPressed: () {}),
        IconButton(
            splashRadius: 15, icon: Icon(Feather.video), onPressed: () {})
      ],
    );
  }

  Widget getBody(size) {
    return ListView.builder(
        itemCount: chatDetails.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Row(
              mainAxisAlignment: chatDetails[index]['isMe'] == true
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Row(children: [
                  chatDetails[index]['isMe'] == false
                      ? Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(avatar), fit: BoxFit.cover),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    width: chatDetails[index]['isMe'] == false ? 5 : 0,
                  ),
                  Container(
                      height: 38,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: chatDetails[index]['isMe'] == true
                            ? Colors.blue
                            : Colors.grey[300],
                      ),
                      child: Text(
                        chatDetails[index]['message'],
                        style: TextStyle(
                            color: chatDetails[index]['isMe'] == true
                                ? Colors.white
                                : Colors.black),
                      )),
                ]),
              ],
            ),
          );
        });
  }

  Widget getBottomNavigationBar(size) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Row(
            children: [
              SizedBox(width: 5),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: IconButton(
                    splashRadius: 15,
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 40,
                width: (size.width - 160),
                child: TextField(
                  cursorColor: Colors.black.withOpacity(0.5),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'ส่งข้อความ...',
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.5))),
                ),
              ),
              Icon(Feather.mic),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.image_outlined),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.sticky_note_2_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
