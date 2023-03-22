import 'dart:io';

import 'package:etr/utils/components.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class ItemImageSelected extends StatelessWidget {
 final dynamic  file ;
 final Function onDelete ;
  const ItemImageSelected({Key key, this.file, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        children: [
          Positioned.fill(child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5),

              child:file is File ?Image.file(file,fit: BoxFit.cover,) :  imageNet(file.image))),
          if(onDelete!=null)
          InkWell(
            onTap: onDelete,
            child: Container(
                decoration: const BoxDecoration(
                  color: fRed,
                    shape: BoxShape.circle
                ),
                padding: const EdgeInsets.all(2),
                child: const Icon(Icons.close,color: fWhite,)),
          ),
        ],
      ),
    );
  }
}
