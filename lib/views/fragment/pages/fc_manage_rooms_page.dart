import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Room {
  int id;
  int beds;
  String category;

  Room({
    this.id = 0,
    required this.beds,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'beds': beds,
      'category': category,
    };
  }

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      beds: json['beds'],
      category: json['category'],
    );
  }
}

class FcManageRoomsPage extends StatefulWidget {
  static const routeName = '/rooms/manage';

  @override
  _FcManageRoomsPageState createState() => _FcManageRoomsPageState();
}

class _FcManageRoomsPageState extends State<FcManageRoomsPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController bedsController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  List<Room> roomsList = [];

  @override
  void initState() {
    super.initState();
    fetchRooms().then((fetchedRooms) {
      setState(() {
        roomsList = fetchedRooms;
      });
    }).catchError((error) {
      print('Error fetching rooms: $error');
    });
  }

  void clearRoomsList() {
    setState(() {
      roomsList = [];
    });
  }

  Future<List<Room>> fetchRooms() async {
    final response = await http.get(Uri.parse('https://room-service-sows.onrender.com/api/room/rooms'));
    if (response.statusCode == 200) {
      List<dynamic> roomsData = json.decode(response.body);
      return roomsData.map((data) => Room.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load rooms');
    }
  }

  Future<void> addRoom(Room room) async {
    final response = await http.post(
      Uri.parse('https://room-service-sows.onrender.com/api/room/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(room.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add room');
    }
  }

  Future<void> updateRoom(Room room) async {
    final response = await http.put(
      Uri.parse('https://room-service-sows.onrender.com/api/room/${room.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(room.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update room');
    }
  }

  Future<void> deleteRoom(int roomId) async {
    final response = await http.delete(
      Uri.parse('https://room-service-sows.onrender.com/api/room/${roomId}'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete room');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.manage_rooms),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text Field for entering room's ID
                TextFormField(
                  controller: idController,
                  decoration: InputDecoration(
                    labelText: 'Room ID',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),

                // Text field for number of beds
                TextFormField(
                  controller: bedsController,
                  decoration: InputDecoration(
                    labelText: 'Number of Beds',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),

                // Text field for room category
                TextFormField(
                  controller: categoryController,
                  decoration: InputDecoration(
                    labelText: 'Room Category',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                // Button Row for Add, Update, Delete
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Add Room Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          Room newRoom = Room(
                            beds: int.parse(bedsController.text),
                            category: categoryController.text,
                          );
                          await addRoom(newRoom);
                        },
                        child: Text('Add Room'),
                      ),
                    ),
                    SizedBox(width: 10),

                    // Update Room Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          int roomId = int.parse(idController.text);
                          Room updatedRoom = Room(
                            id: roomId,
                            beds: int.parse(bedsController.text),
                            category: categoryController.text,
                          );
                          await updateRoom(updatedRoom);
                        },
                        child: Text('Update Room'),
                      ),
                    ),
                    SizedBox(width: 10),

                    // Delete Room Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          int roomId = int.parse(idController.text);
                          await deleteRoom(roomId);
                        },
                        child: Text('Delete Room'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}