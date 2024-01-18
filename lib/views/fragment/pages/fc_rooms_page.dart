import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Room {
final int roomId;
final int beds;
final String category;
final bool isFull;

Room({
  required this.roomId,
  required this.beds,
  required this.category,
  required this.isFull,
});

factory Room.fromJson(Map<String, dynamic> json) {
  return Room(
    roomId: json['roomId'] ?? 0,
    beds: json['beds'] ?? 0,
    category: json['categorie'] as String? ?? 'CONSULTATION',
    isFull: json['isFull'] ?? false,
  );

}
}

class FcRoomsPage extends StatefulWidget {
  static const routeName = '/rooms';

  @override
  _FcRoomsPageState createState() => _FcRoomsPageState();
}

class _FcRoomsPageState extends State<FcRoomsPage> {
  late Future<List<Room>> roomsFuture;

  @override
  void initState() {
    super.initState();
    roomsFuture = fetchRooms();
  }

  Future<List<Room>> fetchRooms() async {
    final response = await http.get(Uri.parse('https://room-service-sows.onrender.com/api/room/rooms'));

    if (response.statusCode == 200) {
      List<dynamic> roomsJson = json.decode(response.body);
      return roomsJson.map((json) => Room.fromJson(json)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load rooms');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Available Rooms'),
      ),
      body: FutureBuilder<List<Room>>(
        future: roomsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If we run into an error, display it to the user
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            // If we got no data from the Future, inform the user
            return Center(child: Text('No rooms data available'));
          }

          // Data is available, so we can display the rooms
          List<Room> rooms = snapshot.data!;

          // Assuming that you want to divide the rooms by category
          Map<String, List<Room>> categorizedRooms = {};
          for (var room in rooms) {
            categorizedRooms.putIfAbsent(room.category, () => []);
            categorizedRooms[room.category]!.add(room);
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: categorizedRooms.entries.map((entry) {
                String category = entry.key;
                List<Room> categoryRooms = entry.value;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$category Rooms',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0, // gap between lines
                      children: categoryRooms.map((room) => RoomCube(room: room)).toList(),
                    ),
                    SizedBox(height: 16),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

class RoomCube extends StatelessWidget {
  final Room room;

  RoomCube({required this.room});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: room.isFull ? Colors.green : Colors.red,
      child: Container(
        width: 100,
        height: 100,
        child: Center(
          child: Text(
            'Room ${room.roomId}\n${room.beds} beds',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

