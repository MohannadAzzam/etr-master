import 'package:flutter/material.dart';
import 'package:etr/utils/controllers/controler_button.dart';

class MyListView extends StatefulWidget {
final  MyListViewController controller ;
final List list ;
final Function(int,dynamic)  buildItem;

const MyListView({Key key, this.controller,this.list, this.buildItem}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();


  @override
  void initState() {

    super.initState();
    widget.controller.removeItem =_removeItem ;
    widget.controller.addItem =_addItem ;
    widget.controller.stateLastItem =stateLastItem ;
  }
  void stateLastItem(val){
    setState(() {
      widget.list.last = val ;
    });
  }
  void _addItem(dynamic obg) {
     setState(() {
       widget.list.add(obg);
     });
   // _listKey.currentState.insertItem(widget.list.length-1, duration: Duration(seconds: 500));
  }
  void _removeItem(int index) {
    _listKey.currentState.removeItem(
        index, (_, animation) => buildItem( 0, animation),
        duration: const Duration(milliseconds: 500));
    setState(() {
      widget.list.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listKey,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        initialItemCount:widget.list.length,
        itemBuilder: (context, index, animation) =>buildItem(index, animation) ,
    );
  }

 Widget buildItem(index, animation){
  return  SizeTransition(
      sizeFactor: animation,
      child: widget.buildItem(index,widget.list[index]),);
  }
}
