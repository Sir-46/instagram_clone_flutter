import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone_flutter/utils/search_json.dart';

class SearchPage extends StatefulWidget {
  SearchPage({
    Key key,
  }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String title = 'ManDo App';
  List feeds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print('size $size');
    return Scaffold(body: SafeArea(child: getBody(size)));
  }

  Widget getBody(size) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
      Container(
        height: size.height - 182.0,
        child: StaggeredGridView.countBuilder(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            itemCount: search.length,
            itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      image: DecorationImage(
                          image: NetworkImage(search[index]['imageUrl']),
                          fit: BoxFit.cover)),
                ),
            staggeredTileBuilder: (index) => StaggeredTile.count(
                (index % 7 == 0 ? 2 : 1), (index % 7 == 0 ? 2 : 1))),
      ),
    ]);
  }
}
