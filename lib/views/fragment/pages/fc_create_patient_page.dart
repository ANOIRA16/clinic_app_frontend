import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Patient {
  String firstName = '';
  String lastName = '';
  String age = '';
  String phoneNumber = '';
  String address = '';
  String inChargeDoctor = '';
  String condition = '';

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'phoneNumber': phoneNumber,
      'address': address,
      'inChargeDoctor': inChargeDoctor,
      'condition': condition,
    };
  }
}

Future<void> createPatient(Patient patient) async {
  final response = await http.post(
    Uri.parse('http://localhost:8082/api/patient'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(patient.toJson()), // Convert your Patient object to JSON
  );

  if (response.statusCode == 201) {
    // Patient created successfully+
    print('Patient created successfully.');
  } else {
    // Handle errors (e.g., display an error message)
    print('Error creating patient: ${response.statusCode}');
  }
}

class FcCreatePatientPage extends StatefulWidget {
  static const routeName = '/patients/add';

  @override
  _FcCreatePatientPageState createState() => _FcCreatePatientPageState();
}

class _FcCreatePatientPageState extends State<FcCreatePatientPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Patient _newPatient = Patient();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Color headerColor = Colors.grey[400]!;
    Color rowColor = Colors.grey[200]!;

    return FxMainBootstrapContainer(
      title: AppLocalizations.of(context)!.patient_title_1,
      list: [
        FxContainerItems(
          title: AppLocalizations.of(context)!.addPatient,
          information: "Use the form to add a new patient",
          child: Container(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildFormField('First Name', _newPatient.firstName),
                  _buildFormField('Last Name', _newPatient.lastName),
                  _buildFormField('Age', _newPatient.age),
                  _buildFormField('Phone Number', _newPatient.phoneNumber),
                  _buildFormField('Address', _newPatient.address),
                  _buildFormField('In Charge Doctor', _newPatient.inChargeDoctor),
                  _buildFormField('Condition', _newPatient.condition),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    child: Text('Submit'),
                  ),
                  SizedBox(height: 20),
                  _displayPatientInfo(),
                ],
              ),
            ),
          ),
        ),
      ],
      bootstrapSizes: 'col-sm-16 col-ml-16 col-lg-16 col-xl-12',
      description: AppLocalizations.of(context)!.patients,
    );
  }

  Widget _buildFormField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: label),
        initialValue: value,
        onChanged: (val) {
          setState(() {
            switch (label) {
              case 'First Name':
                _newPatient.firstName = val;
                break;
              case 'Last Name':
                _newPatient.lastName = val;
                break;
              case 'Age':
                _newPatient.age = val;
                break;
              case 'Phone Number':
                _newPatient.phoneNumber = val;
                break;
              case 'Address':
                _newPatient.address = val;
                break;
              case 'In Charge Doctor':
                _newPatient.inChargeDoctor = val;
                break;
              case 'Condition':
                _newPatient.condition = val;
                break;
            }
          });
        },
      ),
    );
  }

  Widget _displayPatientInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('First Name: ${_newPatient.firstName}'),
            Text('Last Name: ${_newPatient.lastName}'),
            Text('Age: ${_newPatient.age}'),
            Text('Phone Number: ${_newPatient.phoneNumber}'),
            Text('Address: ${_newPatient.address}'),
            Text('In Charge Doctor: ${_newPatient.inChargeDoctor}'),
            Text('Condition: ${_newPatient.condition}'),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      // Perform the database insertion logic here
      // Access the new patient data using _newPatient
      // Clear the form
      form.reset();
      // Reset the patient data
      setState(() {
        _newPatient.firstName = '';
        _newPatient.lastName = '';
        _newPatient.age = '';
        _newPatient.phoneNumber = '';
        _newPatient.address = '';
        _newPatient.inChargeDoctor = '';
        _newPatient.condition = '';
      });
    }
  }
}
