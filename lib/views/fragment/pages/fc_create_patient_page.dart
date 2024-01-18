import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';
import 'package:fx_flutterap_components/components/fx_form/fx_text_field/fx_text_field_form.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fx_flutterap_components/components/fx_button/fx_block_button.dart';

class Doctor {
  int id;
  String name;
  String specialization;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
    );
  }
}

class Patient {
  String? firstName;
  String? lastName;
  String? age;
  String? gender;
  String? inChargeDoctor;

  Patient({
    this.firstName,
    this.lastName,
    this.age,
    this.gender,
    this.inChargeDoctor,
  });

  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'gender': gender,
      'name': '$firstName $lastName',
      'doctor_ids': [inChargeDoctor],
    };

  }
}

Future<void> createPatient(Patient patient) async {
  final response = await http.Client().post(
    Uri.parse('https://patient-service-2gol.onrender.com/api/patient/add'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(patient.toJson()),
  );
  if (response.statusCode == 201) {
    print('Patient created successfully.');
  } else {
    print('Error creating patient: ${response.statusCode}');
    print('Response body: ${response.body}');
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
    String? _selectedGender;

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
                  _buildFormField('First Name', _newPatient.firstName ?? ''),
                  _buildFormField('Last Name', _newPatient.lastName ?? ''),
                  _buildFormField('Age', _newPatient.age ?? ''),
                  _buildFormField('Gender', _newPatient.gender ?? ''),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {
                        _submitForm();
                      },
                      child: Text('INSERT'),
                      style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Set the button background color
                      onPrimary: Colors.white, // Set the text color
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Set padding
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Set rounded corners
                      ),
                      ),
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
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(

        width: MediaQuery.of(context).size.width * 0.4,
        child: FxTextFieldForm(
          hint: "",
          label: label,
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
                case 'Gender':
                  _newPatient.gender = val;
                  break;
              }
            });
          },
        ),
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
            SizedBox(height: 12),
            Text('First Name: ${_newPatient.firstName}'),
            Text('Last Name: ${_newPatient.lastName}'),
            Text('Age: ${_newPatient.age}'),
            Text('Gender: ${_newPatient.gender}'),
          ],
        ),
      ),
    );
  }

  void _submitForm() async {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      // Create a new Patient object from the form data
      Patient newPatient = Patient(
        firstName: _newPatient.firstName,
        lastName: _newPatient.lastName,
        age: _newPatient.age,
        gender: _newPatient.gender,
      );

      await createPatient(newPatient);


      form.reset();
      setState(() {
        _newPatient.firstName = '';
        _newPatient.lastName = '';
        _newPatient.age = '';
        _newPatient.gender = '';
      });
    }
  }
}
