import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

class Room {
  final int roomId;
  final int beds;
  final String category;
  bool isAvailable;

  Room({
    required this.roomId,
    required this.beds,
    required this.category,
    this.isAvailable = true, // All rooms start as empty (available)
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomId: json['roomId'] ?? 0,
      beds: json['beds'] ?? 0,
      category: json['categorie'] as String? ?? 'Unknown',
      isAvailable: (json['beds'] as int? ?? 0) > 0,
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

class FcManagePatientPage extends StatefulWidget {
  static const routeName = '/patient/manage';

  @override
  _FcManagePatientPageState createState() => _FcManagePatientPageState();
}

class _FcManagePatientPageState extends State<FcManagePatientPage> {
  late Future<List<Patient>> patientsFuture;
  late Future<List<Doctor>> doctorsFuture;
  String errorMessage = '';

  // Placeholder data for drop-down menus
  List<String> rooms = []; // Replace with actual room data

  // Selected values for drop-down menus
  String selectedRoom = '';
  late Doctor selectedDoctor;

  @override
  void initState() {
    super.initState();
    patientsFuture = fetchPatients();
    doctorsFuture = fetchDoctors();
    fetchRooms().then((rooms) {
      // Update the dropdown with the fetched rooms
      setState(() {
        this.rooms = rooms;
        selectedRoom = rooms.isNotEmpty ? rooms.first : ''; // Set default selected room
      });
    });
  }

  Future<List<String>> fetchRooms() async {
    try {
      // Replace the URL with the endpoint to fetch rooms
      final response = await http.get(Uri.parse('https://room-service-sows.onrender.com/api/room/rooms'));

      if (response.statusCode == 200) {
        List<dynamic> roomsData = json.decode(response.body);
        List<String> fetchedRooms = roomsData.map((data) => data.toString()).toList();

        // Print the fetched rooms
        fetchedRooms.forEach((room) {
          print('Room: $room');
        });

        return fetchedRooms;
      } else {
        throw Exception('Failed to load rooms');
      }
    } catch (e) {
      print('Error fetching rooms: $e');
      errorMessage = e.toString();
      throw e;
    }
  }
  Future<void> assignDoctorToPatient(int patientId, int doctorId) async {
    try {
      final response = await http.put(
        Uri.parse('https://patient-service-2gol.onrender.com/api/patient/$patientId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'doctor_ids': [doctorId]}),
      );

      if (response.statusCode == 200) {
        print('Doctor assigned to patient successfully');
      } else {
        throw Exception('Failed to assign doctor to patient');
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }

  Future<void> assignDoctorToPatientAndReload(int patientId, int doctorId) async {
    await assignDoctorToPatient(patientId, doctorId);
    // Reload the patient data after assigning the doctor
    patientsFuture = fetchPatients();
    setState(() {});
  }

  Future<List<Doctor>> fetchDoctors() async {
    try {
      final response =
      await http.get(Uri.parse('https://doctor-service-5g8m.onrender.com/api/doctor/doctors'));

      if (response.statusCode == 200) {
        List<dynamic> doctorsData = json.decode(response.body);
        List<Doctor> fetchedDoctors = doctorsData.map((data) => Doctor.fromJson(data)).toList();

        // Print the fetched doctors
        fetchedDoctors.forEach((doctor) {
          print('Doctor ID: ${doctor.id}, Name: ${doctor.name}, Specialization: ${doctor.specialization}');
        });

        return fetchedDoctors;
      } else {
        throw Exception('Failed to load doctors');
      }
    } catch (e) {
      print('Error fetching doctors: $e');
      errorMessage = e.toString();
      throw e;
    }
  }

  Future<List<Patient>> fetchPatients() async {
    try {
      final response =
      await http.get(Uri.parse('https://patient-service-2gol.onrender.com/api/patient/patients'));

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
                          FutureBuilder<List<Doctor>>(
                            future: doctorsFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return Text('No doctors data available.');
                              } else {
                                List<Doctor> doctors = snapshot.data!;
                                selectedDoctor = doctors.first; // Set default selected doctor

                                return DropdownButton<Doctor>(
                                  value: selectedDoctor,
                                  items: doctors.map((Doctor doctor) {
                                    return DropdownMenuItem<Doctor>(
                                      value: doctor,
                                      child: Text('${doctor.id} - ${doctor.name}'),
                                    );
                                  }).toList(),
                                  onChanged: (Doctor? newValue) {
                                    setState(() {
                                      selectedDoctor = newValue!;
                                    });
                                  },
                                );
                              }
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