import 'dart:async';

import 'package:carbuddy/Model/LocationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapHome extends StatefulWidget {
  const MapHome({ Key? key }) : super(key: key);

  @override
  _MapHomeState createState() => _MapHomeState();
}

class _MapHomeState extends State<MapHome> {

  Completer<GoogleMapController> _controller = Completer();
  // TextEditingController _searchController = TextEditingController();
  TextEditingController _startLocation = TextEditingController();
  TextEditingController _destinationLocation = TextEditingController();

  Set<Polyline> _polylines = Set<Polyline>();

  int _polylineIdCounter =1;

  // adding markers to google maps

  static final Marker marker1  = Marker(
    markerId: MarkerId('home loc'),
    infoWindow: InfoWindow(title: 'This is home area'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(31.460117, 74.301438),
  );

  static final Marker marker2  = Marker(
    markerId: MarkerId('university loc'),
    infoWindow: InfoWindow(title: 'This is university area'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: LatLng(31.473019, 74.409482),
  );

  // connect two points with a line Polyline

  // static final Polyline polyLine1 = Polyline(
  //   polylineId : PolylineId('home to uni'),
  //   points : [marker1.position , marker2.position],
  //   width: 5,
  //   color: Colors.green
  // );

  

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.460117, 74.301438),
    zoom: 13.4746,
  );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(31.473019, 74.409482),
  //     zoom: 19.151926040649414);
  Future<void> _goToPlaceLatLng(double lat, double lng, Map<String,dynamic> boundsNe, Map<String,dynamic> boundsSw) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat,lng), zoom:15  ),
    ),);
    controller.animateCamera(
      CameraUpdate.newLatLngBounds(LatLngBounds(
        southwest: LatLng(boundsSw['lat'], boundsSw['lng']), 
        northeast: LatLng(boundsNe['lat'], boundsNe['lng'])),
         25)
    );
  }

  void _setPolyline(List<PointLatLng> points){
    final String polylineIdVal = 'polyline_$_polylineIdCounter';
    _polylineIdCounter++;

    _polylines.add(
      Polyline(polylineId: PolylineId(polylineIdVal),
      width: 2,
      color: Colors.blue,
      points: points.map((point)=>LatLng(point.latitude, point.longitude)).toList()
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20,),
          TextFormField(
            // controller: _searchController,
            controller: _startLocation,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(hintText: 'Start'),
            // onChanged: (value){
            //   print(value);
            // },
          ),
          // TextFormField(
          //   controller: _destinationLocation,
          //   textCapitalization: TextCapitalization.words,
          //   decoration: InputDecoration(hintText: 'Destination'),
          //   // onChanged: (value){
          //   //   print(value);
          //   // },
          // ),
          // //directions icon button
          // IconButton(onPressed: () async {
          //   var directions = await LocationService().getDirections(_startLocation.text, _destinationLocation.text);
          //   _goToPlaceLatLng(
          // directions['start_location']['lat'],
          // directions['start_location']['lng'],
          // directions['bounds_ne'],
          // directions['bounds_sw']
          // );
          //   _setPolyline(directions['polyline_decoded']);
          //   print("!!!!!!!!!!!!!!!!!!!!!!!!"+directions['polyline_decoded']);
            
          // },
          // icon: Icon(Icons.search)),
          // // go to place icon button
           IconButton(onPressed: ()async{
                print('----------------------------------------icon button on press');
                var place = await LocationService().getPlace(_startLocation.text);
                _goToPlace(place);
              }, icon: Icon(Icons.search)),
          // Row(
          //   children: [
          //     Expanded(child: TextFormField(
          //       controller: _searchController,
          //       textCapitalization: TextCapitalization.words,
          //       decoration: InputDecoration(hintText: 'Search by City'),
          //       // onChanged: (value){
          //       //   print(value);
          //       // },
          //     )),
              // IconButton(onPressed: ()async{
              //   print('----------------------------------------icon button on press');
              //   var place = await LocationService().getPlace(_searchController.text);
              //   _goToPlace(place);
              // }, icon: Icon(Icons.search))
          //   ],
          // ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: {
                marker1,
                //  marker2
              },
              polylines: _polylines
              ,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  
  


  }


  Future<void> _goToPlace(Map<String,dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat,lng), zoom:15  ),
    ),);
  }

  

// Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
}
