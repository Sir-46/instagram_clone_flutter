import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/utils/search_json.dart';

class SearchPage extends StatefulWidget {
  SearchPage({
    Key key,
  }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(body: SafeArea(child: getBody(size)));
  }

  Widget getBody(size) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.1,
                ),
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: 'ค้นหา',
                ),
              ),
            ),
          ),
          floating: true,
          elevation: 0.0,
        ),
        SliverGrid.count(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          children: List.generate(search.length, (index) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('${search[index]['imageUrl']}'))),
            );
          }),
        )
      ],
    );
  }
}
