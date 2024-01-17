import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

class Patient {
  int id;
  String name;
  int age;
  String gender;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
    );
  }
}

class FcPatientsPage extends StatefulWidget {
  static const routeName = '/patients';

  @override
  _FcPatientsPageState createState() => _FcPatientsPageState();
}

class _FcPatientsPageState extends State<FcPatientsPage> {
  late Future<List<Patient>> patientsFuture;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    patientsFuture = fetchPatients();
  }

  Future<void> deletePatient(Patient patient) async {
    try {
      final response = await http.delete(
        Uri.parse(
          'https://patient-service-2gol.onrender.com/api/patient/${patient.id}',
        ),
      );

      if (response.statusCode == 200) {
        updatePatientsList();
        print('Patient deleted successfully');
      } else {
        throw Exception('Failed to delete patient');
      }
    } catch (e) {
      errorMessage = e.toString();
      throw e;
    }
  }

  Future<List<Patient>> fetchPatients() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://patient-service-2gol.onrender.com/api/patient/patients',
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> patientsData = json.decode(response.body);
        List<Patient> fetchedPatients =
        patientsData.map((data) => Patient.fromJson(data)).toList();
        return fetchedPatients;
      } else {
        throw Exception('Failed to load patients');
      }
    } catch (e) {
      errorMessage = e.toString();
      throw e;
    }
  }

  void updatePatientsList() {
    setState(() {
      patientsFuture = fetchPatients();
    });
  }

  Future<List<Patient>> fetchFullPatients() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://patient-service-2gol.onrender.com/api/patient/patients',
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> patientsData = json.decode(response.body);
        List<Patient> fetchedPatients =
        patientsData.map((data) => Patient.fromJson(data)).toList();
        return fetchedPatients;
      } else {
        throw Exception('Failed to load patients');
      }
    } catch (e) {
      errorMessage = e.toString();
      throw e;
    }
  }
// Function to show patient information popup
    void _showPatientInfoPopup(int patientId) async {
      List<Patient> fullPatients = await fetchFullPatients();

      // Find the patient with the matching ID
      Patient selectedPatient = fullPatients.firstWhere((patient) =>
      patient.id == patientId,
          orElse: () => Patient(id: 0, name: '', age: 0, gender: ''));

      // Show a dialog or a custom popup with the patient information
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Patient Information'),
            content: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('ID: ${selectedPatient.id}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('Name: ${selectedPatient.name}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('Age: ${selectedPatient.age}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),

            actions: [
              ElevatedButton(
                onPressed: () {
                  // Add action for "Show History"
                  Navigator.pop(context); // Close the popup
                  // Add your logic to show patient history
                },
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: Text('Show History'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add action for "Show Documents"
                  Navigator.pop(context); // Close the popup
                  // Add your logic to show patient documents
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text('Show Documents'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the popup
                },
                child: Text('Close', style: TextStyle(color: Colors.red)),
              ),
            ],
          );
        },
      );
    }

    @override
    Widget build(BuildContext context) {
      ThemeData themeData = Theme.of(context);
      Color headerColor = Colors.grey[400]!;
      Color rowColor = Colors.grey[200]!;

      return FxMainBootstrapContainer(
        title: AppLocalizations.of(context)!.patient_title_1,
        list: [
          FxContainerItems(
            title: AppLocalizations.of(context)!.patients,
            information: "It is a patients screen located in fc_patients_page.dart",
            child: FutureBuilder<List<Patient>>(
              future: patientsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No patients data available.'));
                } else {
                  List<Patient> patients = snapshot.data!;
                  return Container(
                    width: double.infinity,
                    child: DataTable(
                      columnSpacing: 38,
                      headingRowColor: MaterialStateColor.resolveWith((Set<
                          MaterialState> states) {
                        return headerColor;
                      }),
                      dataRowColor: MaterialStateColor.resolveWith((Set<
                          MaterialState> states) {
                        return rowColor;
                      }),
                      columns: [
                        DataColumn(label: Text('ID', style: TextStyle(
                            color: InitialStyle.primaryDarkColor))),
                        DataColumn(label: Text('Full Name', style: TextStyle(
                            color: InitialStyle.primaryDarkColor))),
                        DataColumn(label: Text('Age', style: TextStyle(
                            color: InitialStyle.primaryDarkColor))),
                        DataColumn(label: Text('Gender', style: TextStyle(
                            color: InitialStyle.primaryDarkColor))),
                        DataColumn(label: Text('Actions', style: TextStyle(
                            color: InitialStyle.primaryDarkColor))),
                      ],
                      rows: patients.map((patient) =>
                          DataRow(
                            cells: [
                              DataCell(Text(patient.id.toString(),
                                  style: TextStyle(
                                      color: InitialStyle.primaryColor))),
                              DataCell(Text(patient.name, style: TextStyle(
                                  color: InitialStyle.primaryColor))),
                              DataCell(Text(patient.age.toString(),
                                  style: TextStyle(
                                      color: InitialStyle.primaryColor))),
                              DataCell(Text(patient.gender, style: TextStyle(
                                  color: InitialStyle.primaryColor))),
                              DataCell(Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.account_circle_outlined,
                                        color: InitialStyle
                                            .warningColorRegular),
                                    onPressed: () {
                                      _showPatientInfoPopup(patient.id);
                                      // Add your action here
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add_chart,
                                        color: InitialStyle.dangerColorRegular),
                                    onPressed: () {
                                      deletePatient(patient);
                                    },
                                  ),
                                ],
                              )),
                            ],
                          )).toList(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
        bootstrapSizes: 'col-sm-16 col-ml-16 col-lg-16 col-xl-12',
        description: AppLocalizations.of(context)!.patients,
      );
    }
  }

