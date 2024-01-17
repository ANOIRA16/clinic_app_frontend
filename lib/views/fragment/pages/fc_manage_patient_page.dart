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

class FcManagePatientPage extends StatefulWidget {
  static const routeName = '/patient/manage';

  @override
  _FcManagePatientPageState createState() => _FcManagePatientPageState();
}

class _FcManagePatientPageState extends State<FcManagePatientPage> {
  late Future<List<Patient>> patientsFuture;
  String errorMessage = '';

  // Placeholder data for drop-down menus
  List<String> rooms = ['Room 1', 'Room 2', 'Room 3']; // Replace with actual room data
  List<String> doctors = ['Doctor A', 'Doctor B', 'Doctor C']; // Replace with actual doctor data

  // Selected values for drop-down menus
  String selectedRoom = 'Room 1';
  String selectedDoctor = 'Doctor A';

  @override
  void initState() {
    super.initState();
    patientsFuture = fetchPatients();
  }

  Future<List<Patient>> fetchPatients() async {
    try {
      final response = await http.get(Uri.parse('https://patient-service-2gol.onrender.com/api/patient/patients'));

      if (response.statusCode == 200) {
        List<dynamic> patientsData = json.decode(response.body);
        List<Patient> fetchedPatients = patientsData.map((data) => Patient.fromJson(data)).toList();
        return fetchedPatients;
      } else {
        throw Exception('Failed to load patients');
      }
    } catch (e) {
      errorMessage = e.toString();
      throw e;
    }
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
                    headingRowColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                      return headerColor;
                    }),
                    dataRowColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                      return rowColor;
                    }),
                    columns: [
                      DataColumn(label: Text('ID', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                      DataColumn(label: Text('Full Name', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                      DataColumn(label: Text('Age', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                      DataColumn(label: Text('Gender', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                      DataColumn(label: Text('Room', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                      DataColumn(label: Text('Doctor', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                      DataColumn(label: Text('Actions', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                    ],
                    rows: patients.map((patient) => DataRow(
                      cells: [
                        DataCell(Text(patient.id.toString(), style: TextStyle(color: InitialStyle.primaryColor))),
                        DataCell(Text(patient.name, style: TextStyle(color: InitialStyle.primaryColor))),
                        DataCell(Text(patient.age.toString(), style: TextStyle(color: InitialStyle.primaryColor))),
                        DataCell(Text(patient.gender, style: TextStyle(color: InitialStyle.primaryColor))),
                        DataCell(
                          DropdownButton<String>(
                            value: selectedRoom,
                            items: rooms.map((String room) {
                              return DropdownMenuItem<String>(
                                value: room,
                                child: Text(room),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedRoom = newValue!;
                              });
                            },
                          ),
                        ),
                        DataCell(
                          DropdownButton<String>(
                            value: selectedDoctor,
                            items: doctors.map((String doctor) {
                              return DropdownMenuItem<String>(
                                value: doctor,
                                child: Text(doctor),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedDoctor = newValue!;
                              });
                            },
                          ),
                        ),
                        DataCell(Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Add your action for "UPDATE"
                              },
                              style: ElevatedButton.styleFrom(primary: Colors.blue),
                              child: Text('UPDATE'),
                            ),
                            SizedBox(width: 8), // Add some spacing between buttons
                            ElevatedButton(
                              onPressed: () {
                                // Add your action for "CANCEL"
                              },
                              style: ElevatedButton.styleFrom(primary: Colors.red),
                              child: Text('CANCEL'),
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