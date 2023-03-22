import 'package:etr/items/item_header.dart';
import 'package:etr/items/item_offer_ticker.dart';
import 'package:etr/module/tickets.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/get_my_object.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('tickets'.t),
      body: GetMyObject(
        url: apiTickets,
        fun: (json)=> Tickets.fromJson(json),
        onHasData: (value) {
          Tickets tickets = value ;
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [

              ItemHeader(onTap: (){},title: tickets.name,details: tickets.details),
              ListView.builder(
                itemCount: tickets.events.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  TicketsEvent event = tickets.events[index];
                return   Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsetsDirectional.only(start: 20.w,top: 20.h),
                      child: myText(event.name ,color: fPrimaryColor,fontSize: 20.sp),
                    ) ,

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(event.events.length, (index)=> ItemOfferTicket(item: event.events[index],)),
                      ),
                    ),
                  ],
                );
              },)

            ],
          );
        }
      ),
    );
  }
}
