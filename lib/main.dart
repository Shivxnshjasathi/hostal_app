import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Room {
  final int number;
  bool isAvailable;

  Room({required this.number, this.isAvailable = true});
}

class MyApp extends StatelessWidget {
  final List<Room> rooms = [
    Room(number: 101),
    Room(number: 102),
    Room(number: 103),
    Room(number: 104),
    Room(number: 105),
    Room(number: 106),
    Room(number: 107),
    Room(number: 108),
    Room(number: 109),
    Room(number: 110),
    // Add more rooms as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hostel Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RoomList(rooms: rooms),
    );
  }
}

class RoomList extends StatefulWidget {
  final List<Room> rooms;

  RoomList({required this.rooms});

  @override
  _RoomListState createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hostel Rooms'),
      ),
      body: ListView.builder(
        itemCount: widget.rooms.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Room ${widget.rooms[index].number}'),
            subtitle: Text(
                widget.rooms[index].isAvailable ? 'Available' : 'Occupied'),
            trailing: Switch(
              value: widget.rooms[index].isAvailable,
              onChanged: (newValue) {
                setState(() {
                  widget.rooms[index].isAvailable = newValue;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
