import 'package:etr/items/item_header.dart';
import 'package:etr/items/item_organizers.dart';
import 'package:etr/items/item_shepherds.dart';
import 'package:etr/items/new_blog_item.dart';
import 'package:etr/module/faqs.dart';
import 'package:etr/module/sponsors.dart';
import 'package:etr/screens/choose_package_screen.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/get_my_object.dart';
import 'package:etr/utils/custom_widget/my_list_paginat.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/material.dart';

class SponsorsScreen extends StatelessWidget {
  const SponsorsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Sponsors'.t),
      body: GetMyObject(
        url: apiSponsors,
        fun: (json)=> Sponsors.fromJson(json),
        onHasData: (value){
          Sponsors item =value ;
          return ListView(
            children: [

              ItemHeader(onTap: (){
                To(context, ChoosePackageScreen());
              },title: item.name,details: item.details),
              ListView.builder(
                itemCount: item.sponsors.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Sponsor event = item.sponsors[index];
                  return ItemShepherds(item: event,);
                },)
            ],
          );
        }
      ),
    );
  }
}
