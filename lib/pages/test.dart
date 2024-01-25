import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'apointmentlist.dart';
import 'utils.dart';

class EventCal2 extends StatefulWidget {
  @override
  _EventCal2State createState() => _EventCal2State();
}

class _EventCal2State extends State<EventCal2> {
  var name = "";

  final nameController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {};
  TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List<Event>> _selectedEvents;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  CollectionReference schedule = FirebaseFirestore.instance.collection('schedule');

  @override
  void initState() {
    super.initState();
    _fetchEvents();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }
  Future<void> _fetchEvents() async {
    final eventsSnapshot = await schedule.get();
    final eventsData = eventsSnapshot.docs.map((doc) => doc.data());

    // Convert Firestore data to Event objects
    final events = eventsData.map((data) => Event(
      title: data['name'],
      date: (data['selectedDate'] as Timestamp).toDate(),
    ));

    setState(() {
      // Update events map with fetched data
      events.forEach((event) {
        this.events[event.date] = [event];
      });
      _selectedEvents.value = _getEventsForDay(_selectedDay!);
    });
  }
  Future<List<YourObject>> fetchData() async {
    try {
      QuerySnapshot querySnapshot = await collectionRef.get();
      List<QueryDocumentSnapshot> docs = querySnapshot.docs;

      // Convert each document to your object
      List<YourObject> objectsList = docs.map((doc) => YourObject.fromDocument(doc)).toList();
      return objectsList;
    } catch (error) {
      print('Error fetching data: $error');
      return []; // Return an empty list if an error occurs
    }
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  clearText() {
    nameController.clear();
  }


  Future<void> addUser() {
    return schedule
        .add({'name': name,'settingDate':DateTime.now(),'selectedDate': _selectedDay})
        .then((value) => print('schedule Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return events[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apointment Calender'),
      ),

      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: DateTime.utc(2013, 3, 15),
            lastDay: DateTime.utc(2030, 3, 15),

            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            // calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            rangeSelectionMode: RangeSelectionMode.disabled,
            startingDayOfWeek: StartingDayOfWeek.saturday,
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          ListStudentPage(),



        ],
      ),
    );
  }
}
