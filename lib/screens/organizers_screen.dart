import 'package:etr/items/item_header.dart';
import 'package:etr/items/item_organizers.dart';
import 'package:etr/items/new_blog_item.dart';
import 'package:etr/module/faqs.dart';
import 'package:etr/module/sponsors.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/get_my_object.dart';
import 'package:etr/utils/custom_widget/my_list_paginat.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/material.dart';

import '../module/organizers.dart';

class OrganizersScreen extends StatelessWidget {
  const OrganizersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Organizers'.t),
      body:GetMyObject(
          url: apiOrganizers,
          fun: (json)=> Organizers.fromJson(json),
          onHasData: (value){
            Organizers item =value ;
            return ListView(
              children: [

                ItemHeader(onTap: (){},title: item.name,details: item.details),
                ListView.builder(
                  itemCount: item.organizers.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    Organizer event = item.organizers[index];
                    return ItemOrganizers(item: event,);
                  },)
              ],
            );
          }
      ), /*ListPagination(
          url: apiGetFaqs,
          fun: (json) => Faqs.fromJson(json),
          buildItem: (item) =>   ItemOrganizers()

      ),*/
    );
  }
}
