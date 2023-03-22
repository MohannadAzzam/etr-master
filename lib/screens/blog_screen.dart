import 'package:etr/items/new_blog_item.dart';
import 'package:etr/module/faqs.dart';
import 'package:etr/utils/components.dart';
import 'package:etr/utils/custom_widget/my_list_paginat.dart';
import 'package:etr/utils/web_service/web_service.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Blog'.t),
      body: ListPagination(
          url: apiGetFaqs,
          fun: (json) => Faqs.fromJson(json),
          buildItem: (item) =>   NewBlogItem(item: item,)

      ),
    );
  }
}
