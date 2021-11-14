import 'package:flutter/material.dart';


class VehicleRegister extends StatefulWidget {
  const VehicleRegister({ Key? key }) : super(key: key);

  @override
  _VehicleRegisterState createState() => _VehicleRegisterState();
}

class _VehicleRegisterState extends State<VehicleRegister> {

 String RideType='';

 TextEditingController _carcolor  = TextEditingController();
 TextEditingController _nameCar  = TextEditingController();
 TextEditingController _nameCompany  = TextEditingController();
 TextEditingController _carRegistrationNumber  = TextEditingController();
 TextEditingController _modelCar  = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _selectRideType(){
    return DropdownButton<String>(
      value: RideType,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          RideType = newValue!;
        });
      },
      items: <String>['Economy', 'Businesss', 'Premium']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _color() {
    return TextFormField(
      controller: _carcolor,
      decoration: InputDecoration(labelText: 'Color'),
      keyboardType: TextInputType.text,
      
    );
  }

  Widget _carName() {
    return TextFormField(
      controller: _nameCar,
      decoration: InputDecoration(labelText: 'Car Name'),
      keyboardType: TextInputType.text,
      
    );
  }

    Widget _companyName() {
    return TextFormField(
      controller: _nameCompany,
      decoration: InputDecoration(labelText: 'Company Name'),
      keyboardType: TextInputType.text,
     
    );
  }

  Widget _registrationNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Registration Number'),
      keyboardType: TextInputType.url,
      controller: _carRegistrationNumber,
      
    );
  }

  Widget _carModel() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Car model'),
      keyboardType: TextInputType.number,
      controller: _modelCar,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: Text("Vehicle Registration"), )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // _buildName(),
                // _buildEmail(),
                // _selectRideType(),
                _companyName(),
                _color(),
                _carModel(),
                _carName(),
                _registrationNumber(),

                SizedBox(height: 100),
                Text(
                  'Add Vehicle',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}