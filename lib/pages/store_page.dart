import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/utils/search_json.dart';
import 'package:instagram_clone_flutter/utils/store_tag.json.dart';

class StorePage extends StatefulWidget {
  StorePage({
    Key key,
  }) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  ScrollController _controller;
  bool collapse = false;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset > 60) {
      setState(() {
        collapse = true;
      });
    } else {
      setState(() {
        collapse = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: getBody(size)),
    );
  }

  Widget getBody(size) {
    return CustomScrollView(
      controller: _controller,
      slivers: [
        SliverAppBar(
          title: !collapse
              ? Text(
                  'ร้านค้า',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )
              : Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: 'ค้นหาร้านค้า...',
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                ),
          pinned: true,
          expandedHeight: 0.0,
          actions: [
            IconButton(
                onPressed: () {}, splashRadius: 20, icon: Icon(Icons.bookmark)),
            IconButton(
                onPressed: () {}, splashRadius: 20, icon: Icon(Icons.menu))
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: TextField(
                    cursorColor: Colors.black.withOpacity(0.5),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      hintText: 'ค้นหาร้านค้า...',
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    children: List.generate(tags.length, (index) {
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.grey[300]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 20),
                              child: Text(
                                '${tags[index]['title']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            children: List.generate(search.length, (index) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('${search[index]['imageUrl']}'))),
              );
            }))
      ],
    );
  }
}
