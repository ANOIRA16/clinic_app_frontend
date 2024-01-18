import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

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
  int id;
  String name;
  int age;
  String gender;
  List<int> doctorResponseList;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.doctorResponseList,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    List<dynamic> doctorResponseJsonList = json['doctorResponseList'] ?? [];
    List<int> doctorResponseList =
    doctorResponseJsonList.map((id) => id as int).toList();

    return Patient(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      doctorResponseList: doctorResponseList,
    );
  }
}

class FcPatientsPage extends StatefulWidget {
  static const routeName = '/patients';

  @override
  _FcPatientsPageState createState() => _FcPatientsPageState();
}

class _FcPatientsPageState extends State<FcPatientsPage> {
  List<Doctor> doctorsList = [];
  late Future<List<Patient>> patientsFuture;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    // Initialize patientsFuture
    patientsFuture = fetchPatients();

    // Fetch doctors when the widget is initialized
    fetchDoctors().then((fetchedDoctors) {
      setState(() {
        // Update the state with the fetched doctors
        doctorsList = fetchedDoctors;
      });
    });
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

  Future<Patient> fetchPatientsWithDoctors(int id) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://patient-service-2gol.onrender.com/api/patient/fullPatient/${id}',
        ),
      );

      if (response.statusCode == 200) {
        dynamic patientData = json.decode(response.body);

        // Check if the decoded data is not null
        if (patientData != null) {
          List<dynamic> doctorResponseJsonList =
              patientData['doctorResponseList'] ?? [];
          List<int> doctorResponseList =
          doctorResponseJsonList.map((id) => id as int).toList();

          Patient fetchedPatient = Patient(
            id: patientData['id'],
            name: patientData['name'],
            age: patientData['age'],
            gender: patientData['gender'],
            doctorResponseList: doctorResponseList,
          );

          return fetchedPatient;
        }
      }
      return Patient(
        id: 0,
        name: '',
        age: 0,
        gender: '',
        doctorResponseList: [],
      );


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

  Future<List<Doctor>> fetchDoctors() async {
    try {
      final response = await http.get(
          Uri.parse('https://doctor-service-5g8m.onrender.com/api/doctor/doctors'));

      if (response.statusCode == 200) {
        List<dynamic> doctorsData = json.decode(response.body);
        List<Doctor> fetchedDoctors = doctorsData.map((data) => Doctor.fromJson(data)).toList();
        return fetchedDoctors;
      } else {
        throw Exception('Failed to load doctors');
      }
    } catch (e) {
      throw e;
    }
  }

  void _showPatientInfoPopup(int patientId) async {
    Patient fullPatients = await fetchPatientsWithDoctors(patientId);

    // Find the patient with the matching ID
    /*Patient selectedPatient = fullPatients.firstWhere(
          (patient) => patient.id == patientId,
      orElse: () => Patient(
        id: 0,
        name: '',
        age: 0,
        gender: '',
        doctorResponseList: [],
      ),
    );*/

    // Show a dialog or a custom popup with the patient information
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Patient Information'),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'ID: ${fullPatients.id}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Name: ${fullPatients.name}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Age: ${fullPatients.age}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Affected Doctors:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                DataTable(
                  columns: [
                    DataColumn(label: Text('Doctor ID')),
                    DataColumn(label: Text('Doctor Name')),
                  ],
                  rows: fullPatients.doctorResponseList
                      .map(
                        (doctorId) {
                      // Find the corresponding doctor in the doctorsList
                      Doctor doctor = doctorsList.firstWhere(
                            (doc) => doc.id == doctorId,
                        orElse: () => Doctor(id: -1, name: 'Not Found', specialization: ''),
                      );

                      return DataRow(cells: [
                        DataCell(Text(doctorId.toString())),
                        DataCell(Text(doctor.name)),
                      ]);
                    },
                  )
                      .toList(),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle Show Appointment History
                        // Add your logic here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Button color
                        onPrimary: Colors.white, // Text color
                        elevation: 5, // Button shadow
                      ),
                      child: Text('Show Appointment History'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle Show All Documents
                        // Add your logic here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Button color
                        onPrimary: Colors.white, // Text color
                        elevation: 5, // Button shadow
                      ),
                      child: Text('Show All Documents'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Button color
                        onPrimary: Colors.white, // Text color
                        elevation: 5, // Button shadow
                      ),
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
                    headingRowColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                        return headerColor;
                      },
                    ),
                    dataRowColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                        return rowColor;
                      },
                    ),
                    columns: [
                      DataColumn(
                        label: Text('ID', style: TextStyle(color: InitialStyle.primaryDarkColor)),
                      ),
                      DataColumn(
                        label: Text('Full Name', style: TextStyle(color: InitialStyle.primaryDarkColor)),
                      ),
                      DataColumn(
                        label: Text('Age', style: TextStyle(color: InitialStyle.primaryDarkColor)),
                      ),
                      DataColumn(
                        label: Text('Gender', style: TextStyle(color: InitialStyle.primaryDarkColor)),
                      ),
                      DataColumn(
                        label: Text('Actions', style: TextStyle(color: InitialStyle.primaryDarkColor)),
                      ),
                    ],
                    rows: patients
                        .map(
                          (patient) => DataRow(
                        cells: [
                          DataCell(
                            Text(patient.id.toString(), style: TextStyle(color: InitialStyle.primaryColor)),
                          ),
                          DataCell(
                            Text(patient.name, style: TextStyle(color: InitialStyle.primaryColor)),
                          ),
                          DataCell(
                            Text(patient.age.toString(), style: TextStyle(color: InitialStyle.primaryColor)),
                          ),
                          DataCell(
                            Text(patient.gender, style: TextStyle(color: InitialStyle.primaryColor)),
                          ),
                          DataCell(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.account_circle_outlined, color: InitialStyle.warningColorRegular),
                                  onPressed: () {
                                    _showPatientInfoPopup(patient.id);
                                    // Add your action here
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.add_chart, color: InitialStyle.dangerColorRegular),
                                  onPressed: () {
                                    deletePatient(patient);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                        .toList(),
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
  }}