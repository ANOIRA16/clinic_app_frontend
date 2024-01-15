import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';
import 'dart:math';

class Room {
  final String name;
  bool isAvailable;

  Room({
    required this.name,
    required this.isAvailable,
  });
}

class FcRoomsPage extends StatefulWidget {
  static const routeName = '/rooms';

  @override
  _FcRoomsPageState createState() => _FcRoomsPageState();
}

class _FcRoomsPageState extends State<FcRoomsPage> {
  static List<Room> consultationRooms = List.generate(30, (index) {
    return Room(name: 'Room N°=${index + 1}', isAvailable: Random().nextBool());
  });

  static List<Room> reanimationRooms = List.generate(8, (index) {
    return Room(name: 'SR${index + 1}', isAvailable: Random().nextBool());
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Available Rooms'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Consultation Simple Rooms',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            buildRoomGrid(consultationRooms, 10),
            SizedBox(height: 16),
            Text(
              'Urgent Reanimation Rooms',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            buildRoomGrid(reanimationRooms, 4), // Adjusted to 4 rooms per row
          ],
        ),
      ),
    );
  }

  Widget buildRoomGrid(List<Room> rooms, int roomsPerRow) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: roomsPerRow,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.5, // Adjust as needed
      ),
      itemCount: rooms.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return RoomCube(room: rooms[index]);
      },
    );
  }
}

class RoomCube extends StatelessWidget {
  final Room room;

  RoomCube({required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75, // Adjusted for bigger squares
      height: 75, // Adjusted for bigger squares
      decoration: BoxDecoration(
        color: room.isAvailable ? Colors.green : Colors.red,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          room.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FcRoomsPage(),
  ));
}
