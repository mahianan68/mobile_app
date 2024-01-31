import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

class TableEventsExample extends StatefulWidget {
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {

  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {};
  Future<Map<DateTime, List<Event>>> fetchEvents() async {
    Map<DateTime, List<Event>> events = {};

   FirebaseFirestore.instance.collection('eventschedule').get().then((querySnapshot) {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Timestamp timestamp = doc['selectedDate'];
        String title = doc['name'];

        DateTime date = timestamp.toDate().toUtc();
        events.putIfAbsent(date, () => []).add(Event(title)); // Group events by date
      }
    });

    return events;
  }
  TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List<Event>> _selectedEvents;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  // void initState() {
  //   super.initState();
  //
  //   _selectedDay = _focusedDay;
  //   _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  // }
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _fetchEvents(); // Call the fetchEvents function
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  Future<void> _fetchEvents() async {
    events = await fetchEvents(); // Assign the fetched events to the events map
    setState(() {}); // Trigger a rebuild to display the events
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? []; // Retrieve events from the fetched events map
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Events'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  title: Text("Set appointment"),
                  content: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      controller: _eventController,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          events.addAll({
                            _selectedDay!: [Event(_eventController.text)]
                          });
                           print(events);

                          Navigator.of(context).pop();
                          _selectedEvents.value= _getEventsForDay(_selectedDay!);
                        },
                        child: Text("add"))
                  ],
                );
              });
        },
        child: Icon(Icons.add),
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
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      // child: ListTile(
                      //   onTap: () => print("works"),
                      //   title: Text('${value[index]}'),
                      // ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
