import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/global_widget/component_status/error_respons_state.dart';
import 'package:etr/utils/global_widget/component_status/no_result_item.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:etr/utils/controllers/controler_update.dart';
import 'package:etr/utils/enums.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/web_service/dio_helper.dart';

class ListPagination extends StatefulWidget {

  final String url ;
  final String keyName ='items';
  final dynamic Function(Map<String, dynamic> json) fun;
  final dynamic Function(String value) extraValue;
  final String extraValueKey;
  final Widget Function(dynamic item)  buildItem;
  final Controller  controller;
  final ScrollPhysics physics;

  final ScrollController scrollController ;

  // Corresponds to [ScrollView.shrinkWrap].
  final bool shrinkWrap ;
  final PagingController<int, dynamic> pagingController ;
  const ListPagination({this.buildItem, this.url, this.fun, this.pagingController, this.controller, this.physics, this.shrinkWrap=false, this.scrollController, this.extraValue, this.extraValueKey, }) ;

  @override
  _ListPaginationState createState() => _ListPaginationState();
}

class _ListPaginationState extends State<ListPagination> with SingleTickerProviderStateMixin {

  static const _pageSize = 10;
  PagingController<int, dynamic> pagingController = PagingController(firstPageKey: 1);

  int nextPageKey = 1 ;
  bool isLode = false ;
  bool isLast = false;
  bool isExternalScroll = false ;

  refresh(){
    nextPageKey = 1 ;
    isLode = false ;
    isLast = false;
    _fetchPage(nextPageKey) ;
  }
  Future<void> _fetchPage(int pageKey) async {
    isLode = true ;
    await getListData(widget.url+'?page='+pageKey.toString(),
        fun:widget.fun,
        withLoader:pageKey>1?false:false ,
        extraValueKey: widget.extraValueKey,
        extraValue:widget.extraValue ,
        onSuccess: (newItems) {
          isLast=false;
          isLode = false ;
          nextPageKey = pageKey + 1;
          pagingController.appendPage(newItems, nextPageKey);
          if(isExternalScroll){
            checkScroll();
          }
        },
        onLast:(lastItems) {
          isLast=true;
          isLode = false ;
          pagingController.appendLastPage(lastItems);

        },
        onError: (error) {
          isLode = false ;
          pagingController.error = error;
          print(error) ;
        });


  }

  update(){
    pagingController.refresh() ;

  }
  updateForExternal(){
    refresh();

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
      widget.controller.updateForExternal = updateForExternal ;
      widget.controller.remove = remove ;
      widget.controller.updateItem = updateItem ;
      widget.controller.addItem = addItem ;

    }
    isExternalScroll =widget.scrollController!=null ;
    if(!isAppTestMode){
      if(isExternalScroll){
        _fetchPage(nextPageKey);
        widget.scrollController.addListener(() {
          if(isLode||isLast) return ;
          checkScroll() ;

        });
      }else{
        pagingController.addPageRequestListener((pageKey) {
          _fetchPage(pageKey);
        });

      }

    }else{
      pagingController.appendLastPage([1,2,3,4,5,6,7,8,9,10,11,]);
    }

    super.initState();
  }

  // checkEndScroll(){
  //   double screenHeight =  MediaQuery.of(context).size.height;
  //   double maxScroll = widget.scrollController.position.maxScrollExtent;
  //   double currentScroll = widget.scrollController.position.pixels;
  //
  //   printBlue('widget ${maxScroll} ${currentScroll}  ') ;
  //   double result = maxScroll - currentScroll;
  //   if(maxScroll < screenHeight -100  ){
  //     _fetchPage(nextPageKey);
  //   }
  // }

  checkScroll(){
    double maxScroll = widget.scrollController.position.maxScrollExtent;
    double currentScroll = widget.scrollController.position.pixels;
    double delta = 0.0; // or something else..
    double result = maxScroll - currentScroll;
    printBlue('widget ${maxScroll}   ${currentScroll} ') ;
    printBlue('widget2  ${result}    ${delta} ') ;
    if(!currentScroll.isNegative) return ;
    if (result <= delta) { // whatever you determine here
      if(isLode) return ;
      _fetchPage(nextPageKey);
      return true ;

    }else{
      return false ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
      onRefresh:() => Future.sync(() {
        if(isExternalScroll) update() ;
        pagingController.refresh();
      },),
      child: PagedListView<int, dynamic>(
        primary: false,
        physics: widget.physics??BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        shrinkWrap: widget.shrinkWrap,
        pagingController: pagingController,
        //scrollController:widget.scrollController ,

        builderDelegate: PagedChildBuilderDelegate<dynamic>(
          itemBuilder: (context, item, index) => widget.buildItem(
            item,
          ),
          newPageProgressIndicatorBuilder: (context) => SpinKitThreeBounce(
            color: fPrimaryColor,
            size: 30.0,
          ),
          animateTransitions: true,
          transitionDuration: Duration(milliseconds: 500),

          firstPageErrorIndicatorBuilder: (context) {

            return ErrorResponseState(errorType:  pagingController.error,onTryAgain: (){
              if(isExternalScroll) updateForExternal() ;
              pagingController.refresh();
            },);


          },
          noItemsFoundIndicatorBuilder: (context) => NoDataState(onTryAgain: (){
            if(isExternalScroll) updateForExternal() ;
            pagingController.refresh();
          },),
          firstPageProgressIndicatorBuilder: (context) => SpinKitThreeBounce(
            color: fPrimaryColor,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}