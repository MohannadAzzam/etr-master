import 'package:etr/utils/components.dart';
import 'package:etr/utils/controllers/controler_update.dart';
import 'package:etr/utils/global_widget/component_status/error_respons_state.dart';
import 'package:etr/utils/global_widget/component_status/no_result_item.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/web_service/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ListPaginationGrid extends StatefulWidget {

 final String url ;
 final String keyName ='items';
 final dynamic Function(Map<String, dynamic> json) fun;
 final Function  buildItem;
 final Controller  controller;
 final ScrollPhysics physics;
 final EdgeInsetsGeometry padding;
 // Corresponds to [ScrollView.shrinkWrap].
 final bool shrinkWrap ;
 final PagingController<int, dynamic> pagingController ;
 final SliverGridDelegate gridDelegate;
  const ListPaginationGrid({this.buildItem, this.url, this.fun, this.pagingController, this.controller, this.physics, this.shrinkWrap=false, this.gridDelegate, this.padding}) ;

  @override
  _ListPaginationGridState createState() => _ListPaginationGridState();
}

class _ListPaginationGridState extends State<ListPaginationGrid> with SingleTickerProviderStateMixin {

  static const _pageSize = 10;
   PagingController<int, dynamic> pagingController = PagingController(firstPageKey: 1);



  Future<void> _fetchPage(int pageKey) async {
    getListData(widget.url+'?page='+pageKey.toString(),
        fun:widget.fun,
        withLoader:pageKey>1?false:false ,

        onSuccess: (newItems) {
          final isLastPage = newItems.length < _pageSize;
          if (isLastPage) {
            pagingController.appendLastPage(newItems);
          }else {
            final nextPageKey = pageKey + 1;
            pagingController.appendPage(newItems, nextPageKey);
          }
        },
        onError: (error) {
          pagingController.error = error;
          print(error) ;
        });

  }

  update(){
    pagingController.refresh() ;
  }
  remove(dynamic obj){
    pagingController.itemList.remove(obj);
    setState(() {

    });
  }
  updateItem(dynamic obj){
    pagingController.itemList[pagingController.itemList.indexWhere((element) => element.id == obj.id)] = obj ;
    setState(() {

    });
  }
  addItem(dynamic obj){
    pagingController.itemList.add(obj)  ;
    setState(() {});
  }
  @override
  void initState() {
     if(widget.controller!=null){
       widget.controller.update = update ;
       widget.controller.remove = remove ;
       widget.controller.updateItem = updateItem ;
       widget.controller.addItem = addItem ;

     }
    // TODO: implement initState

     if(!isAppTestMode){
       pagingController.addPageRequestListener((pageKey) {
         _fetchPage(pageKey);
       });
     }else{
       pagingController.appendLastPage([1,2,3,4,5,6,7,8,9,10]);
     }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
      onRefresh:() => Future.sync(() => pagingController.refresh(),),
      child: PagedGridView<int, dynamic>(
        padding: widget.padding??EdgeInsets.all(5.w),
        gridDelegate:widget.gridDelegate ,
        physics: widget.physics,
        shrinkWrap: widget.shrinkWrap,
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<dynamic>(
          itemBuilder: (context, item, index) => widget.buildItem(
            item,
          ),

          newPageProgressIndicatorBuilder: (context) => SpinKitThreeBounce(
            color: fPrimaryColor,
            size: 30.0,
          ),
          animateTransitions: true,
          transitionDuration: Duration(milliseconds: 100),

           firstPageErrorIndicatorBuilder: (context) {

              return ErrorResponseState(errorType:  pagingController.error,onTryAgain: (){
                update();
              },);


           },
          noItemsFoundIndicatorBuilder: (context) => NoDataState(onTryAgain: (){
            update();
          }),
          firstPageProgressIndicatorBuilder: (context) => SpinKitThreeBounce(
          color: fPrimaryColor,
          size: 30.0,
        ),
        //  firstPageProgressIndicatorBuilder: (context) => Container(height: 10,width: 10,),
        ),
      ),
    );
  }
}
