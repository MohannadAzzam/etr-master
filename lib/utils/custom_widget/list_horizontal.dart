import 'package:flutter/material.dart';

class ListHorizontal extends StatelessWidget {
  final Function(dynamic item) buildItem ;
  final List list;
  const ListHorizontal({Key key, this.list, this.buildItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              list.length, (index) => buildItem(list[index])),
        ));
  }
}
