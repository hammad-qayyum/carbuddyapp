import 'package:flutter/material.dart';


class VehicleRegister extends StatefulWidget {
  const VehicleRegister({ Key? key }) : super(key: key);

  @override
  _VehicleRegisterState createState() => _VehicleRegisterState();
}

class _VehicleRegisterState extends State<VehicleRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is the vehicle register screen'),
    );
  }
}