import 'package:flutter/material.dart';
import 'package:inventory_management/constants.dart';

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
          padding:
              EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
          height: size.height / 5,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            // onTap: ,
            child: Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                        'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg?resize=750px:*'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          list[i]['name'],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(list[i]['type'])
                            ],
                          ),
                        ),
                        Text(
                          list[i]['quantity'],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
