import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone_flutter/utils/search_json.dart';

class SearchPage extends StatefulWidget {
  SearchPage({
    Key key,
  }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController _scrollcontroller;
  String title = 'ManDo App';
  List feeds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  void initState() {
    super.initState();
    _scrollcontroller = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print('size $size');
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
