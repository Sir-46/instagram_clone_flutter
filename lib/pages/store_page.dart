import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
  String title = 'ManDo App';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(),
      body: SafeArea(child: getBody(size)),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0.0,
      centerTitle: false,
      title: Text(
        'ร้านค้า',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
        IconButton(onPressed: () {}, splashRadius: 15, icon: Icon(Icons.menu))
      ],
      bottom: PreferredSize(
          child: Column(
            children: [
              Container(
                // color: Colors.red,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: TextField(
                        cursorColor: Colors.black.withOpacity(0.5),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'ส่งข้อความ...',
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                            icon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            )),
                      ),
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
          preferredSize: Size.fromHeight(110.0)),
    );
  }

  Widget getBody(size) {
    return Column(children: [
      Container(
          width: size.width,
          height: size.height - 283.0,
          child: StaggeredGridView.countBuilder(
            // controller: scrollcontroller,
            crossAxisCount: 2,
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
                (index % 4 == 0 ? 2 : 1), (index % 4 == 0 ? 2 : 1)),
          )),
    ]);
  }
}
