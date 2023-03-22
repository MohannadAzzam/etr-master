// import 'dart:typed_data';
// import 'dart:ui' as ui;
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:etr/utils/my_colors.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart';
//
//
// //String googleAPIKey2 = 'AIzaSyBm-bSOgvL17sfF6sm4SO8EDHrEf9aYLk4';
// String googleAPIKey = 'AIzaSyCTH9nPopEmMswYlEjqXJqBHCUq3gT4cLA';
//
// Future<String> getAddressFromPostion(double lat, double long) async {
//   try {
//     List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
//     print('placemarks $placemarks.first.name.');
//     return placemarks.first.locality +', '+
//         placemarks.first.administrativeArea ;
//
//   } on Exception catch (a) {
//     // a.printError();
//   }
// }
//
// Future<CameraUpdate> goToPostion(LatLng latLng) async {
//   return CameraUpdate.newCameraPosition(
//     CameraPosition(
//       bearing: 0,
//       target: latLng,
//       zoom: 17.0,
//     ),
//   );
// }
//
// boundCamera(GoogleMapController c, List<LatLng> latlngs, Function end) {
//
//     CameraUpdate u2 = CameraUpdate.newLatLngBounds(getBounds(latlngs), 100);
//     c.animateCamera(u2).then((void v) async {
//       end();
//
//     });
//
// }
//
// getBounds(List<LatLng> list) {
//   //assert(list.isNotEmpty);
//   print('Post size :' + list.length.toString());
//   double x0, x1, y0, y1;
//   if (list.isEmpty) {
//     return LatLngBounds(northeast: LatLng(0, 0), southwest: LatLng(0, 0));
//   } else {
//     for (LatLng latLng in list) {
//       if (latLng == null) continue;
//       if (x0 == null) {
//         x0 = x1 = latLng.latitude;
//         y0 = y1 = latLng.longitude;
//       } else {
//         if (latLng.latitude > x1) x1 = latLng.latitude;
//         if (latLng.latitude < x0) x0 = latLng.latitude;
//         if (latLng.longitude > y1) y1 = latLng.longitude;
//         if (latLng.longitude < y0) y0 = latLng.longitude;
//       }
//     }
//     return LatLngBounds(northeast: LatLng(x1, y1), southwest: LatLng(x0, y0));
//   }
// }
//
// void check(CameraUpdate u, GoogleMapController c) async {
//   c.animateCamera(u);
//   // (await _controller.future).animateCamera(u);
//   LatLngBounds l1 = await c.getVisibleRegion();
//   LatLngBounds l2 = await c.getVisibleRegion();
//   print(l1.toString());
//   print(l2.toString());
//   if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) {
//     check(u, c);
//   }
// }
//
//
// Future<LatLng> getLocationByCode(String zipCode) async {
//   try {
//    // List<Location> locations = await locationFromAddress('92807');
//     print('zipCode $zipCode');
//    List<Location> locations = await locationFromAddress(zipCode);
//     return LatLng(locations[0].latitude, locations[0].longitude);
//   } on Exception catch (e) {
//     return null;
//   }
// }
//
// Future<Marker> getMark(BuildContext context, LatLng latLng, String id) async {
//   //getAddressFromPostion(latLng.latitude, latLng.longitude);
//   //var icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 100), "assets/icons/marck_icon2.png");
//    var icon = await bitmapDescriptorFromSvgAsset(context , 'assets/images/mark_base_location.png') ;
//  // var icon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
//   return Marker(markerId: MarkerId(id), position: latLng, icon: icon);
// }
// Future<Marker> getCustomMark(BuildContext context,String mark, LatLng latLng, String id) async {
//   //getAddressFromPostion(latLng.latitude, latLng.longitude);
//   //var icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 100), "assets/icons/marck_icon2.png");
//   var icon = await getBytesFromAsset(mark, 60);//bitmapDescriptorFromSvgAsset(context , mark) ;
//   // var icon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
//   return Marker(markerId: MarkerId(id), position: latLng, icon: BitmapDescriptor.fromBytes(icon));
// }
// double getDistance(LatLng startCoordinates, LatLng destinationCoordinates) {
//   double distance = Geolocator.distanceBetween(
//     startCoordinates.latitude,
//     startCoordinates.longitude,
//     destinationCoordinates.latitude,
//     destinationCoordinates.longitude,
//   );
//   print('distance $distance ${distance * 0.000621371192}');
//   return Geolocator.distanceBetween(
//         startCoordinates.latitude,
//         startCoordinates.longitude,
//         destinationCoordinates.latitude,
//         destinationCoordinates.longitude,
//       ) * 0.000621371192;
//
// }
//
// Future<Polyline> getPolyline(PointLatLng start, PointLatLng end) async {
//   List<LatLng> polylineCoordinates = [];
//
//   PolylinePoints polylinePoints = PolylinePoints();
//   PolylineResult result =
//       await polylinePoints.getRouteBetweenCoordinates(googleAPIKey, start, end);
//
//   print('length ${result.points.length}');
//   if (result.points.isNotEmpty) {
//     // loop through all PointLatLng points and convert them
//     // to a list of LatLng, required by the Polyline
//     polylineCoordinates.clear();
//     result.points.forEach((PointLatLng point) {
//       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//     });
//   }
//
//   // create a Polyline instance
//   // with an id, an RGB color and the list of LatLng pairs
//   return Polyline(
//       width: 5,
//       jointType: JointType.round,
//       startCap: Cap.roundCap,
//       endCap: Cap.roundCap,
//       polylineId: PolylineId("poly"),
//       color: fPrimaryColor,
//       points: polylineCoordinates);
//
//   // add the constructed polyline as a set of points
//   // to the polyline set, which will eventually
//   // end up showing up on the map
// }
// Future<Uint8List> getBytesFromAsset(String path, int width) async {
//   ByteData data = await rootBundle.load(path);
//   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
//   ui.FrameInfo fi = await codec.getNextFrame();
//   return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
// }
// Future<BitmapDescriptor> bitmapDescriptorFromSvgAsset(
//     BuildContext context, String assetName) async {
//   // Read SVG file as String
//
//   return  BitmapDescriptor.fromBytes(await getBytesFromAsset(assetName, 40));
//   String svgString = await DefaultAssetBundle.of(context).loadString(assetName);
//   // Create DrawableRoot from SVG String
//   DrawableRoot svgDrawableRoot = await svg.fromSvgString(svgString, null);
//
//   // toPicture() and toImage() don't seem to be pixel ratio aware, so we calculate the actual sizes here
//   MediaQueryData queryData = MediaQuery.of(context);
//   double devicePixelRatio = queryData.devicePixelRatio;
//   double width = 35 * devicePixelRatio; // where 32 is your SVG's original width
//   double height = 35 * devicePixelRatio; // same thing
//
//   // Convert to ui.Picture
//   ui.Picture picture = svgDrawableRoot.toPicture(size: Size(width, height));
//
//   // Convert to ui.Image. toImage() takes width and height as parameters
//   // you need to find the best size to suit your needs and take into account the
//   // screen DPI
//   ui.Image image = await picture.toImage(65, 65);
//   ByteData bytes = await image.toByteData(format: ui.ImageByteFormat.png);
//   return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
// }
//
//
// // Future<BitmapDescriptor> createCustomMarkerBitmap(String title) async {
// // /*
// //   TextSpan span = new TextSpan(
// //     style: new TextStyle(
// //       color: Colors.black,
// //       fontSize: 50.0,
// //       fontWeight: FontWeight.bold,
// //     ),
// //     text: title,
// //   );
// //
// //   TextPainter tp = new TextPainter(
// //     text: span,
// //
// //     textAlign: TextAlign.center,
// //     textDirection: TextDirection.ltr,
// //   );
// //   tp.text =WidgetSpan(child: Container(
// //     color: yPrimaryColor,
// //     child: myText(title),
// //     // text: title,
// //     // style: TextStyle(
// //     //   fontSize: 50.0,
// //     //   color: yWhite,
// //     //   fontWeight: FontWeight.w800,
// //     //   background: Paint()
// //     //     ..strokeWidth = 50
// //     //     ..color = yPrimaryColor
// //     //     ..style = PaintingStyle.stroke
// //     //     ..strokeJoin = StrokeJoin.round ,
// //     //
// //     //   letterSpacing: 1.0,
// //     //   fontFamily: 'Roboto Bold',
// //     // ),
// //   )) ;
// //
// //   ui.PictureRecorder recorder = new ui.PictureRecorder();
// //   Canvas c = new Canvas(recorder);
// //
// //   tp.layout();
// //   tp.paint(c, new Offset(20.0, 10.0));
// //
// //   */
// // /* Do your painting of the custom icon here, including drawing text, shapes, etc. *//*
// //
// //
// //   ui.Picture p = recorder.endRecording();
// //   ByteData pngBytes = await (await p.toImage(tp.width.toInt() + 40, tp.height.toInt() + 20))
// //       .toByteData(format: ui.ImageByteFormat.png);
// // */
// //
// //
// //   Uint8List data = await placeToMarker(title, duration: 20) ; /*Uint8List.view(pngBytes.buffer);*/
// //
// //   return BitmapDescriptor.fromBytes(data);
// // }
// //
// // Future<Uint8List> placeToMarker(String place, {@required int duration}) async {
// //   ui.PictureRecorder recorder = ui.PictureRecorder();
// //   ui.Canvas canvas = ui.Canvas(recorder);
// //   final ui.Size size = ui.Size(250, 120);
// //   MyCustomMarker customMarker = MyCustomMarker(place, duration);
// //   customMarker.paint(canvas, size);
// //   ui.Picture picture = recorder.endRecording();
// //   final ui.Image image = await picture.toImage(
// //     size.width.toInt(),
// //     size.height.toInt(),
// //   );
// //
// //   final ByteData byteData = await image.toByteData(
// //     format: ui.ImageByteFormat.png,
// //   );
// //   return byteData.buffer.asUint8List();
// // }
// // Future<BitmapDescriptor> bitmapDescriptorFromSvgAsset(
// //     BuildContext context, String assetName) async {
// //   // Read SVG file as String
// //
// //   return await BitmapDescriptor.fromAssetImage(
// //       const ImageConfiguration(devicePixelRatio: 2.5),
// //       assetName);
// //   String svgString = await DefaultAssetBundle.of(context).loadString(assetName);
// //   // Create DrawableRoot from SVG String
// //   DrawableRoot svgDrawableRoot = await svg.fromSvgString(svgString, null);
// //
// //   // toPicture() and toImage() don't seem to be pixel ratio aware, so we calculate the actual sizes here
// //   MediaQueryData queryData = MediaQuery.of(context);
// //   double devicePixelRatio = queryData.devicePixelRatio;
// //   double width = 35 * devicePixelRatio; // where 32 is your SVG's original width
// //   double height = 35 * devicePixelRatio; // same thing
// //
// //   // Convert to ui.Picture
// //   ui.Picture picture = svgDrawableRoot.toPicture(size: Size(width, height));
// //
// //   // Convert to ui.Image. toImage() takes width and height as parameters
// //   // you need to find the best size to suit your needs and take into account the
// //   // screen DPI
// //   ui.Image image = await picture.toImage(65, 65);
// //   ByteData bytes = await image.toByteData(format: ui.ImageByteFormat.png);
// //   return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
// // }
// // place.GoogleMapsPlaces places = place.GoogleMapsPlaces(apiKey: googleAPIKey);
// // Future<List<place.PlacesSearchResult>> retrieveNearbyRestaurants(
// //     BuildContext context, LatLng _userLocation,String type) async {
// //
// //   place.PlacesSearchResponse _response ;
// //   num radius = 0 ;
// //  // while(_response?.results==null||( _response.results.length < 19 && radius <200000)){
// //   radius+=50000 ;
// //
// //     print('retrieveNearbyRestaurants $radius') ;
// //    /* _response = await places.searchNearbyWithRadius(
// //         place.Location(lat: _userLocation.latitude, lng: _userLocation.longitude),
// //         radius,
// //         keyword:'restaurants' ,
// //         type: "restaurants");*/
// //
// //   print('start ${DateTime.now().toIso8601String()}') ;
// //     _response = await places.searchNearbyWithRankBy( place.Location(lat: _userLocation.latitude, lng: _userLocation.longitude), "distance",type:type/*'restaurants'*/,keyword:type/*'restaurants'*/ );
// //
// //
// //   print('end ${DateTime.now().toIso8601String()}') ;
// //  //  if(_response?.results!=null){
// //  //      _response?.results.forEach((element) {
// //  //        print('element ${element.photos.length}') ;
// //  //      });
// //  //      print('retrieveNearbyRestaurants ${_response.results?.last??''}') ;
// //  // //   }
// //  //  }
// //
// //   return _response.results;
// //
// // }
// //
// // Future<Set<Marker>> resultToMarkers(BuildContext context, List<place.PlacesSearchResult> results) async {
// //  // var icon = await bitmapDescriptorFromSvgAsset(context , 'assets/icons/mark_store_icon.png') ;
// //
// //   List<Marker> markrt =  await Future.wait(await results.map((result) async{
// //     var icon = await createCustomMarkerBitmap(result.name);
// //     return Marker(
// //         markerId: MarkerId(result.name),
// //         icon:icon /*BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)*/,
// //         infoWindow: InfoWindow(
// //             title: result.name,
// //             snippet: "Ratings: " + (result.rating?.toString() ?? "Not Rated")),
// //         onTap: () {
// //           SheetController sheetController = SheetController();
// //           bottomSheet(
// //               sheetController: sheetController,
// //               context: context,
// //               child: BottomSheetDetails(
// //                 sheetController: sheetController,
// //                 result: result,
// //               ));
// //         },
// //         position: LatLng(result.geometry.location.lat, result.geometry.location.lng));
// //   }).toSet());
// //   return markrt.toSet();
// // }
//
//
// //  Future<void> openMap(double latitude, double longitude) async {
// // //String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude&travelmode=driving&dir_action=navigate';
// // String googleUrl = Uri.parse("google.navigation:q=$latitude,$longitude&mode=d").toString();
// // if (await canLaunch(googleUrl)) {
// // await launch(googleUrl);
// // } else {
// // throw 'Could not open the map.';
// // }
// // }
//
// String getUrlImage(String imageRef){
//   return 'https://maps.googleapis.com/maps/api/place/photo'
//      '?maxwidth=400'
//      '&photo_reference=$imageRef'
//      '&key=$googleAPIKey' ;
// }