
import 'dart:io';

import 'package:etr/utils/components.dart';
import 'package:etr/utils/helpers.dart';
import 'package:etr/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:image_picker/image_picker.dart';

class BottomSheetSelected extends StatefulWidget {

 final bool isMultiSelect  ;
  const BottomSheetSelected({Key key, this.isMultiSelect = false}) : super(key: key);

  @override
  _BottomSheetSelectedState createState() => _BottomSheetSelectedState();
}

class _BottomSheetSelectedState extends State<BottomSheetSelected> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
          color: fWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20) )
      ),
      padding: EdgeInsets.symmetric(vertical: 20.h),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildSelect('camera2_icon','Camera'.t,() async {
           Navigator.pop(context, await getImageBase(ImageSource.camera));
          }),

          buildSelect('gallary_icon','Gallery'.t,() async {
            if(widget.isMultiSelect){
              Navigator.pop(context, await getMultiImageRe());
            }else{
              Navigator.pop(context, await getImageBase(ImageSource.gallery));
            }

          }),
        ],
      ),
    );
  }
 Widget buildSelect(String image,String title,Function onTap){
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: fBackGroundTextFailed,
              borderRadius: BorderRadius.circular(20)
            ),
            padding: EdgeInsets.all(50.r),
            child: svgImage(image),
          ),
          SizedBox(height: 20,),
          myText(title)
        ],
      ),
    ) ;
  }
}

Future getImage(BuildContext context,{bool isMultiSelect = false}) async {
  if(isMultiSelect){
 var file =  await bottomSheet(context: context, child: BottomSheetSelected(isMultiSelect: isMultiSelect,)) ;

 List<File> listFile = [] ;
 List<XFile> listXFile = [] ;

 if(file is List){
   listXFile =file ;

 }else{
   listXFile.add(file);

 }


   await Future.wait(listXFile.map((element)async{
      listFile.add(await fixExifRotation(element.path)) ;
    })) ;

    return listFile;
  }else{
    XFile file =  await bottomSheet(context: context, child: BottomSheetSelected(isMultiSelect: isMultiSelect,)) ;
    return await fixExifRotation(file.path) ;
  }



}

Future<XFile> getImageBase(ImageSource re)async{

  return await ImagePicker().pickImage(source:re ,maxHeight: 480, maxWidth: 640,imageQuality: 50);

}
Future<List<XFile>> getMultiImageRe()async{

  return await ImagePicker().pickMultiImage(imageQuality: 50,maxHeight: 480, maxWidth: 640);

}

Future<File> fixExifRotation(String imagePath) async {
  return await FlutterExifRotation.rotateImage(path: imagePath);
  // final originalFile = File(imagePath);
  // List<int> imageBytes = await originalFile.readAsBytes();
  //
  // final originalImage = img.decodeImage(imageBytes);
  //
  // final height = originalImage.height;
  // final width = originalImage.width;
  //
  // // Let's check for the image size
  // // This will be true also for upside-down photos but it's ok for me
  // if (height >= width) {
  //   // I'm interested in portrait photos so
  //   // I'll just return here
  //   return originalFile;
  // }
  //
  // // We'll use the exif package to read exif data
  // // This is map of several exif properties
  // // Let's check 'Image Orientation'
  // final exifData = await readExifFromBytes(imageBytes);
  //
  // if(exifData==null){
  //   return File(imagePath) ;
  // }
  // img.Image fixedImage;
  //
  // if (height < width) {
  //   // rotate
  //   if (exifData['Image Orientation'].printable.contains('Horizontal')) {
  //     fixedImage = img.copyRotate(originalImage, 90);
  //   } else if (exifData['Image Orientation'].printable.contains('180')) {
  //     fixedImage = img.copyRotate(originalImage, -90);
  //   } else if (exifData['Image Orientation'].printable.contains('CCW')) {
  //     fixedImage = img.copyRotate(originalImage, 180);
  //   } else {
  //     fixedImage = img.copyRotate(originalImage, 0);
  //   }
  // }
  //
  // // Here you can select whether you'd like to save it as png
  // // or jpg with some compression
  // // I choose jpg with 100% quality
  // final fixedFile = await originalFile.writeAsBytes(img.encodeJpg(fixedImage));
  //
  // return fixedFile;
}