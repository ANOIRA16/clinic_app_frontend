import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Patient {
  int id;
  final String name;

  Patient({
    required this.id,
    required this.name,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Room {
  int roomId;
  int beds;
  final String category;

  Room({
    required this.roomId,
    required this.beds,
    required this.category,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomId: json['id'],
      beds: json['beds'],
      category: json['category'],
    );
  }

  void addPatient() {
    if (beds > 0) {
      beds--;
    }
  }

  void removePatient() {
    beds++;
  }
}

class FcManageRoomsPage extends StatefulWidget {
  static const routeName = '/rooms/manage';

  @override
  _FcManageRoomsPageState createState() => _FcManageRoomsPageState();
}

class _FcManageRoomsPageState extends State<FcManageRoomsPage> {
  late Future<List<Room>> roomsFuture;
  late Future<List<Patient>> patientsFuture;
  List<Room> rooms = [];
  String? selectedRoomId;
  String? selectedPatientId;

  @override
  void initState() {
    super.initState();
    roomsFuture = fetchRooms();
    patientsFuture = fetchPatients();
  }

  Future<List<Patient>> fetchPatients() async {
    final response = await http.get(Uri.parse('http://localhost:8082/api/patient/patients'));

    if (response.statusCode == 200) {
      List<dynamic> patientsData = json.decode(response.body);
      return patientsData.map((data) => Patient.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load patients');
    }
  }

  Future<List<Room>> fetchRooms() async {
    final response = await http.get(Uri.parse('http://localhost:8083/api/room/rooms'));

    if (response.statusCode == 200) {
      List<dynamic> roomsData = json.decode(response.body);
      return roomsData.map((data) => Room.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load rooms');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.manage_rooms),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<Room>>(
              future: roomsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (!snapshot.hasData) {
                  return Text('No rooms data available');
                }

                List<Room> rooms = snapshot.data!;
                return Column(
                  children: [
                    TextFormField(
                      onChanged: (newValue) {
                        setState(() {
                          selectedPatientId = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Patient ID',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20), // Add some spacing between the fields
                    TextFormField(
                      onChanged: (newValue) {
                        setState(() {
                          selectedRoomId = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Room ID',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            FutureBuilder<List<Patient>>(
              future: patientsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text('No patients data available');
                }

                return Column(
                  children: [
                    TextFormField(
                      onChanged: (newValue) {
                        setState(() {
                          // Convert the input to String
                          selectedPatientId = newValue.toString();
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Patient ID',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20), // Add some spacing between the fields
                    TextFormField(
                      onChanged: (newValue) {
                        setState(() {
                          // Convert the input to String
                          selectedRoomId = newValue.toString();
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Room ID',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => manageRoomAssignment(add: true),
                  child: Text('Add Patient to Room'),
                ),
                ElevatedButton(
                  onPressed: () => manageRoomAssignment(add: false),
                  child: Text('Remove Patient from Room'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void manageRoomAssignment({required bool add}) async {
    if (selectedRoomId != null && selectedPatientId != null) {
      final room = rooms.firstWhere((r) => r.roomId == selectedRoomId);

      final apiEndpoint = add ? 'addPatient' : 'removePatient';
      final response = await http.post(
        Uri.parse('http://localhost:8083/api/room/addPatient/${room.roomId}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'id': selectedPatientId!,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          if (add) {
            room.addPatient();
          } else {
            room.removePatient();
          }
        });
      } else {
        final error = json.decode(response.body);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to update room: ${error['message']}'),
              actions: <Widget>[
                TextButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please select both a room and a patient.'),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}