import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';

class Room {
  final String name;
  bool isAvailable;

  Room({
    required this.name,
    required this.isAvailable,
  });
}

class RoomManager {
  static List<Room> consultationRooms = List.generate(30, (index) {
    return Room(name: 'Room N°=${index + 1}', isAvailable: true);
  });

  static List<Room> reanimationRooms = List.generate(8, (index) {
    return Room(name: 'SR${index + 1}', isAvailable: false);
  });
}

class FcManageRoomsPage extends StatefulWidget {
  static const routeName = '/rooms/manage';

  @override
  _FcManageRoomsPageState createState() => _FcManageRoomsPageState();
}

class _FcManageRoomsPageState extends State<FcManageRoomsPage> {
  @override
  Widget build(BuildContext context) {
    return FxMainBootstrapContainer(
      title: AppLocalizations.of(context)!.manage_rooms,
      list: [
        FxContainerItems(
          title: AppLocalizations.of(context)!.consultation_rooms,
          information: "Manage the availability of Consultation Rooms",
          child: buildRoomGrid(RoomManager.consultationRooms),
        ),
        FxContainerItems(
          title: AppLocalizations.of(context)!.reanimation_rooms,
          information: "Manage the availability of Reanimation Rooms",
          child: buildRoomGrid(RoomManager.reanimationRooms),
        ),
      ],
      bootstrapSizes: 'col-sm-12 col-ml-12 col-lg-12 col-xl-12',
      description: AppLocalizations.of(context)!.manage_rooms,
    );
  }

  Widget buildRoomGrid(List<Room> rooms) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.5,
      ),
      itemCount: rooms.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return RoomCube(room: rooms[index], onUpdate: _updateRoomAvailability);
      },
    );
  }

  void _updateRoomAvailability(bool isAvailable) {
    // Handle the room update logic here
    // You can access the selected room using widget.room and update its availability
  }
}

class RoomCube extends StatefulWidget {
  final Room room;
  final ValueChanged<bool> onUpdate;

  RoomCube({required this.room, required this.onUpdate});

  @override
  _RoomCubeState createState() => _RoomCubeState();
}

class _RoomCubeState extends State<RoomCube> {
  late bool _isAvailable;

  @override
  void initState() {
    super.initState();
    _isAvailable = widget.room.isAvailable;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isAvailable = !_isAvailable;
        });
        widget.onUpdate(_isAvailable);
      },
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          color: _isAvailable ? Colors.green : Colors.red,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            widget.room.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FcManageRoomsPage(),
  ));
}
