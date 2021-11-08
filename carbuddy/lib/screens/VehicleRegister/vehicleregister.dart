import 'package:flutter/material.dart';


class VehicleRegister extends StatefulWidget {
  const VehicleRegister({ Key? key }) : super(key: key);

  @override
  _VehicleRegisterState createState() => _VehicleRegisterState();
}

class _VehicleRegisterState extends State<VehicleRegister> {

  String _name = '';
  String _email = '';
  String _password = '';
  String _url= '';
  String _phoneNumber= '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _color() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Color'),
      keyboardType: TextInputType.text,
      validator: (var value) {
        if (value!.isEmpty) {
          return 'Color is Required';
        }

        return null;
      },
      onSaved: (var value) {
        _password = value!;
      },
    );
  }

  Widget _carName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Car Name'),
      keyboardType: TextInputType.text,
      validator: (var value) {
        if (value!.isEmpty) {
          return 'Car Name is Required';
        }

        return null;
      },
      onSaved: (var value) {
        _url = value!;
      },
    );
  }

    Widget _companyName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Company Name'),
      keyboardType: TextInputType.text,
      validator: (var value) {
        if (value!.isEmpty) {
          return 'Company Name is Required';
        }

        return null;
      },
      onSaved: (var value) {
        _url = value!;
      },
    );
  }

  Widget _registrationNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Registration Number'),
      keyboardType: TextInputType.url,
      validator: (var value) {
        if (value!.isEmpty) {
          return 'Registration Number is Required';
        }

        return null;
      },
      onSaved: (var value) {
        _url = value!;
      },
    );
  }

  Widget _carModel() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Car model'),
      keyboardType: TextInputType.number,
      validator: (var value) {
        if (value!.isEmpty) {
          return 'Car model is Required';
        }

        return null;
      },
      onSaved: (var value) {
        _url = value!;
      },
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