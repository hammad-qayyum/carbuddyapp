import 'package:carbuddy/Model/Item.dart';
import 'package:flutter/material.dart';
import '../../Widget/RideHistoryListItem.dart';

class RideHistory extends StatefulWidget {
  const RideHistory({ Key? key }) : super(key: key);

  @override
  _RideHistoryState createState() => _RideHistoryState();
}

class _RideHistoryState extends State<RideHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: Text('Ride History'),),),
      body: Container(
      child: ListView.builder(
          itemCount: CatalogModel.items.length,
          
          itemBuilder: (context,index){


          return RideHistoryListItem(item: CatalogModel.items[index]);
        }
        
        ),
    ),
    );
  }
}