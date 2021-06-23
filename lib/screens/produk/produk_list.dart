import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inventory_management/constants.dart';
import 'package:inventory_management/helper/mysqlhelp.dart';
import 'package:inventory_management/screens/produk/component/produkList_header.dart';

import 'component/itemList.dart';

class ProdukList extends StatefulWidget {
  @override
  _ProdukListState createState() => _ProdukListState();
}

class _ProdukListState extends State<ProdukList> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  // bool _showAppbar = true;
  // bool _showHeader = true;
  // bool isScrollingDown = false;
  // AnimationController _ColorAnimationController;
  // AnimationController _TextAnimationController;
  // Animation _colorTween;
  // Animation<Offset> _transTween;

  // @override
  // void initState() {
  //   super.initState();
  //   _scrollViewController = new ScrollController();
  //   _scrollViewController.addListener(() {
  //     if (_scrollViewController.position.pixels > 50) {
  //       if (!isScrollingDown) {
  //         isScrollingDown = true;
  //         _showAppbar = false;
  //         _showHeader = false;
  //         setState(() {});
  //       }
  //     } else {
  //       isScrollingDown = false;
  //       _showAppbar = true;
  //       _showHeader = true;
  //       setState(() {});
  //     }
  //   });
  //   _ColorAnimationController =
  //       AnimationController(vsync: this, duration: Duration(seconds: 0));
  //   _colorTween = ColorTween(
  //           begin: Colors.transparent, end: Colors.black.withOpacity(0.10))
  //       .animate(_ColorAnimationController);
  // }

  // bool _scrollListener(ScrollNotification scrollInfo) {
  //   if (scrollInfo.metrics.axis == Axis.vertical) {
  //     _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 350);
  //     return true;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: NotificationListener<ScrollNotification>(
    //     onNotification: _scrollListener,
    //     child: ListView(
    //       children: [
    //         appBarAnimated(),
    //         headerAnimated(),
    //         Body(),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      body: Container(
        child: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, isScolled) {
            return [
              SliverAppBar(
                expandedHeight: 90.0,
                floating: true,
                pinned: true,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding:
                      EdgeInsets.symmetric(horizontal: 21, vertical: 15),
                  title: Text(
                    'Product',
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10.0, 20.0, 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.indigo,
                      ),
                      child: IconButton(
                          iconSize: 21,
                          icon: Icon(
                            FlevaIcons.plus,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/FormAddProduct');
                          }),
                    ),
                  ),
                ],
              ),
              SliverPersistentHeader(
                delegate: MyDynamicHeader(),
                floating: true,
                pinned: true,
              )
            ];
          },
          body: Container(
            child: FutureBuilder(
              future: MySqlHelper.getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? new ItemList(list: snapshot.data)
                    : new Center(
                        child: new CircularProgressIndicator(),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Container headerAnimated() {
  //   return Container(
  //     padding: EdgeInsets.only(left: kDefaultPadding),
  //     child: AnimatedBuilder(
  //       animation: _ColorAnimationController,
  //       builder: (context, child) => Container(
  //         decoration: BoxDecoration(
  //             border: Border(
  //                 bottom: BorderSide(color: _colorTween.value, width: 0.5))),
  //         child: AnimatedContainer(
  //           height: _showHeader ? 80.0 : 0.0,
  //           duration: Duration(milliseconds: 200),
  //           child: Stack(
  //             children: <Widget>[
  //               Padding(
  //                 padding: EdgeInsets.only(top: kDefaultPadding),
  //                 child: Row(
  //                   children: [
  //                     Text(
  //                       'Product',
  //                       style: TextStyle(
  //                           color: kTextColor,
  //                           fontSize: 24,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.all(20.0),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: <Widget>[
  // Container(
  //   decoration: BoxDecoration(
  //     shape: BoxShape.circle,
  //     color: Colors.indigo,
  //   ),
  //   child: IconButton(
  //       iconSize: 24,
  //       icon: Icon(
  //         FlevaIcons.plus,
  //         color: Colors.white,
  //       ),
  //       onPressed: () {
  //         Navigator.pushNamed(context, '/FormAddProduct');
  //       }),
  // ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  // child: Row(
  //   children: [
  //     Container(
  //       child: Text(
  //         'Product',
  //         style: TextStyle(
  //             color: kTextColor,
  //             fontSize: 24,
  //             fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //     Row(
  //      children: [
  //        Container(
  //          decoration: BoxDecoration(
  //            shape: BoxShape.circle,
  //            color: Colors.indigo
  //          ),
  //         child: IconButton(icon: Icon(FlevaIcons.plus), onPressed: null),
  //        ),
  //      ],
  //    ),
  //   ],
  // ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

//   AnimatedContainer appBarAnimated() {
//     return AnimatedContainer(
//       height: _showAppbar ? 0.0 : 60.0,
//       duration: Duration(milliseconds: 200),
//       child: AppBar(
//         title: Text(
//           'Product',
//           style: TextStyle(color: kTextColor, fontSize: 20),
//         ),
//       ),
//     );
//   }
}

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.only(top: 20, right: 10, left: 10),
            padding: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: ksecondaryColor.withOpacity(0.32),
                )),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: SvgPicture.asset("assets/icons/search.svg"),
                hintText: "Search Here",
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => false;

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;
}
