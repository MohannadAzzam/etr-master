
import 'package:etr/items/item_faq.dart';
import 'package:etr/module/faqs.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/my_list_paginat.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/material.dart';


class FAQScreen extends StatefulWidget {
  const FAQScreen({Key key}) : super(key: key);

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('FAQ'.t),
      body: ListPagination(
          url: apiGetFaqs,
           fun: (json) => Faqs.fromJson(json),
          buildItem: (item) =>  ItemFAQ(index: 0,faqs: item,)

      ),
    );
  }
}
