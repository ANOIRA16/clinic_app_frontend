import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Doctor {
  int id;
  String name;
  String specialization;
  List<PatientResponse> patientResponseList;

  Doctor({
    this.id = 0,
    required this.name,
    required this.specialization,
    this.patientResponseList = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
      'patientResponseList': patientResponseList.map((e) => e.toJson()).toList(),
    };
  }

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
      patientResponseList: (json['patientResponseList'] as List)
          .map((e) => PatientResponse.fromJson(e))
          .toList(),
    );
  }
}

class PatientResponse {
  int id;
  String name;
  int age;
  String gender;
  List<int> doctorIds; // Added field for doctor IDs

  PatientResponse({
    this.id = 0,
    required this.name,
    required this.age,
    required this.gender,
    this.doctorIds = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'doctor_ids': doctorIds, // Include doctor IDs in the JSON
    };
  }

  factory PatientResponse.fromJson(Map<String, dynamic> json) {
    return PatientResponse(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      doctorIds: json['doctor_ids'] != null ? List<int>.from(json['doctor_ids']) : [],
    );
  }
}

class FcManageDoctorPage extends StatefulWidget {
  static const routeName = '/doctor/manage';
  final Doctor? doctor; // Make Doctor optional

  FcManageDoctorPage({this.doctor});

  @override
  _FcManageDoctorPageState createState() => _FcManageDoctorPageState();
}

class _FcManageDoctorPageState extends State<FcManageDoctorPage> {
  int? selectedDoctorId;
  late TextEditingController idController;
  late TextEditingController nameController;
  late TextEditingController specializationController;
  late List<Doctor> doctorsList;
  List<DropdownMenuItem<int>> doctorIds = [];

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    nameController = TextEditingController();
    specializationController = TextEditingController();
    doctorsList = [];
    fetchDoctors().then((fetchedDoctors) {
      setState(() {
        doctorsList = fetchedDoctors;
      });
    }).catchError((error) {
      // Handle error, e.g., show an error message
      print('Error fetching doctors: $error');
    });
  }

  Future<void> addPatientWithDoctors(PatientResponse patient) async {
    final response = await http.post(
      Uri.parse('https://doctor-service-5g8m.onrender.com/api/doctor/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(patient.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add patient');
    }
  }

  void findDoctorById(int doctorId) {
    Doctor foundDoctor = doctorsList.firstWhere(
          (doctor) => doctor.id == doctorId,
      orElse: () => Doctor(id: -1, name: 'Not Found', specialization: ''),
    );

    if (foundDoctor.id != -1) {
      nameController.text = foundDoctor.name;
      specializationController.text = foundDoctor.specialization;
    } else {
      // Doctor not found logic
      nameController.clear();
      specializationController.clear();
    }
  }


  Future<List<Doctor>> fetchDoctors() async {
    try {
      final response = await http.get(
          Uri.parse('http://localhost:8081/api/doctor/doctors'));

      if (response.statusCode == 200) {
        List<dynamic> doctorsData = json.decode(response.body);
        List<Doctor> fetchedDoctors = doctorsData.map((data) =>
            Doctor.fromJson(data)).toList();
        return fetchedDoctors; // Add this return statement
      } else {
        throw Exception('Failed to load doctors');
      }
    } catch (e) {
      throw e;
    }
  }

    Future<void> addDoctor(Doctor doctor) async {
      final response = await http.post(
        Uri.parse('http://localhost:8081/api/doctor/add'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(doctor.toJson()),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to add doctor');
      }
    }

    Future<void> updateDoctor(Doctor doctor) async {
      final response = await http.put(
        Uri.parse('http://localhost:8081/api/doctor/${doctor.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(doctor.toJson()),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to update doctor');
      }
    }

  Future<void> deleteDoctor(int doctorId) async {
    final response = await http.delete(
      Uri.parse('http://localhost:8081/api/doctor/${doctorId}'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete doctor');
    } else {
      // Post-deletion logic (optional)
      // Example: Refresh the list of doctors after successful deletion
      fetchDoctors();
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Doctors'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Field for entering doctor's ID
            TextFormField(
              controller: idController,
              decoration: InputDecoration(
                labelText: 'Doctor ID',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  int doctorId = int.tryParse(value) ?? -1;
                  findDoctorById(doctorId);
                }
              },
            ),
            SizedBox(height: 20),

            // Text field for doctor's name
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Doctor Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Text field for doctor's specialization
            TextFormField(
              controller: specializationController,
              decoration: InputDecoration(
                labelText: 'Specialization',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Button Row for Add, Update, Delete
            Row(
              children: <Widget>[
                // Add Doctor Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      Doctor newDoctor = Doctor(
                        name: nameController.text,
                        specialization: specializationController.text,
                      );
                      await addDoctor(newDoctor);
                      // Update UI or show confirmation
                    },
                    child: Text('Add Doctor'),
                  ),
                ),
                SizedBox(width: 10),
                // Update Doctor Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (idController.text.isNotEmpty) {
                        int doctorId = int.tryParse(idController.text) ?? -1;
                        Doctor updatedDoctor = Doctor(
                          id: doctorId,
                          name: nameController.text,
                          specialization: specializationController.text,
                        );
                        await updateDoctor(updatedDoctor);
                        // Update UI or show confirmation
                      }
                    },
                    child: Text('Update Doctor'),
                  ),
                ),
                SizedBox(width: 10),
                // Delete Doctor Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (idController.text.isNotEmpty) {
                        int doctorId = int.tryParse(idController.text) ?? -1;
                        await deleteDoctor(doctorId);
                        // Update UI or show confirmation
                      }
                    },
                    child: Text('Delete Doctor'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

