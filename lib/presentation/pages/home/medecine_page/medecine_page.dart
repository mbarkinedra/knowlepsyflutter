import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../app/util/app_colors.dart';
import '../../../../app/widget/custom_button.dart';
import '../../../../app/widget/pop_up_Alert.dart';
import '../../../../app/widget/widget_drawer.dart';
import '../../home_page.dart';
import '../setting_page/personal_information_page/personal_information_page.dart';
import 'insert_medecine.dart';

class MedecinePage extends StatefulWidget {
  const MedecinePage({Key? key}) : super(key: key);

  @override
  State<MedecinePage> createState() => _MedecinePageState();
}

class _MedecinePageState extends State<MedecinePage> {
  DateTime _selectedDay = DateTime.now();

  DateTime? _focusedDay;
  List<Event> _selectedEvents = [];
  Map<DateTime, List<Event>> selectedEvents = {};

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    List<Event> e = [];
    selectedEvents = {_selectedDay: e};

    for (int i = 0; i < 2; i++) {
      e.add(Event(
          name: "Panadol  $i",
          des: "  3 pils(10mg) ",
          time: "8:00_9:00",
          icone: ""));
    }

    selectedEvents[DateTime.now()]?.addAll(e);
    print(selectedEvents[DateTime.now()]);
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      body: Column(children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Center(
            child: Text(" Medecine",
                style: TextStyle(color: Colors.white, fontSize: 21)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 18),
                    child: Text("Schedule",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TableCalendar(
                    calendarBuilders: CalendarBuilders(
                        todayBuilder: (context, _datetime, focusedDay) {
                      return Container(
                        decoration: BoxDecoration(
                            color: focusedDay == _datetime
                                ? Colors.amberAccent
                                : Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(4.0)),
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 0.0),
                        child: focusedDay == _datetime
                            ? Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      DateUtils.weekdays[_datetime.weekday - 1],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        _datetime.day.toString(),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      DateUtils.weekdays[_datetime.weekday - 1],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        _datetime.day.toString(),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      );
                    }, selectedBuilder: (context, _datetime, focusedDay) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(4.0)),
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 0.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                DateUtils.weekdays[_datetime.weekday - 1],
                                style: TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _datetime.day.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    calendarStyle: CalendarStyle(
                      canMarkersOverflow: true,
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay =
                            focusedDay; // update `_focusedDay` here as well
                      });
                    },
                    calendarFormat: CalendarFormat.week,
                    firstDay: DateTime.utc(2010, 10, 16),
                    headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        formatButtonShowsNext: false,
                        titleTextStyle: TextStyle(
                          fontSize: 12,
                        )),
                    daysOfWeekVisible: false,
                    lastDay: DateTime.utc(2030, 3, 14),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                        decoration: BoxDecoration(color: Colors.amberAccent),
                        weekdayStyle: TextStyle(
                          fontSize: 10,
                        )),
                    focusedDay:
                        _selectedDay == null ? DateTime.now() : _selectedDay!,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      text: 'insert a medecine',
                      color: AppColors.secondryColor,
                      width: MediaQuery.of(context).size.width * .6,
                      // MediaQuery.of(context).size.width*.8,
                      hight: 50,
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (
                          context,
                        ) =>
                                const InsertMedecine()));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Medecine",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Today",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: _getEventsForDay(_selectedDay).length,
                itemBuilder: (context, pos) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset(
                                    "assets/images/icon_piles.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "TEGRETOL",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    "assets/images/icon_time.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  Text("12:23"),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset(
                                    "assets/images/icon_medecine.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  Text(
                                    "2 piles",
                                    style: TextStyle(),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    "assets/images/icon_dosage.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text("200: mg"),
                                  Spacer(),
                                  Container(
                                    height: 30,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurpleAccent,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                        child: Text(
                                      "taken",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              )
                            ],
                          )),
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  );

                  // return Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //     height: 150,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.white.withOpacity(1)),
                  //     child: IntrinsicHeight(
                  //       child: Row(
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Container(
                  //                 height: double.infinity,
                  //                 width: 40,
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(5),
                  //                   color: Colors.deepPurpleAccent[100],
                  //                 ),
                  //                 child: Align(
                  //                     alignment: Alignment.topCenter,
                  //                     child: Padding(
                  //                       padding:
                  //                           const EdgeInsets.only(top: 8.0),
                  //                       child: Icon(Icons.add),
                  //                     ))),
                  //           ),
                  //           Padding(
                  //             padding:
                  //                 const EdgeInsets.only(top: 8.0, bottom: 8),
                  //             child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                       _getEventsForDay(_selectedDay)[pos]
                  //                           .name,
                  //                       style: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           fontSize: 16)),
                  //                   Text(_getEventsForDay(_selectedDay)[pos]
                  //                       .des),
                  //                   Spacer(),
                  //                   Text(_getEventsForDay(_selectedDay)[pos]
                  //                       .time)
                  //                 ]),
                  //           ),
                  //           Spacer(),
                  //           Align(
                  //             alignment: Alignment.topRight,
                  //             child: GestureDetector(
                  //               onTap: () {
                  //                 //     Navigator.of(context).push(MaterialPageRoute(
                  //                 //        builder: (
                  //                 //           context,
                  //                 //          ) =>
                  //                 //         PopUpAlert()));
                  //
                  //                 _showMyDialog();
                  //               },
                  //               child: Image.asset(
                  //                 "assets/images/chek_medecine.png",
                  //                 width: 40,
                  //                 height: 40,
                  //               ),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // );
                })),
        SizedBox(
          height: 8,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 2.0, left: 18),
            child: Text("Tomorrow",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: _getEventsForDay(_selectedDay).length,
                itemBuilder: (context, pos) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset(
                                    "assets/images/icon_piles.png",
                                    color: AppColors.secondryColor,
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "TEGRETOL",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    "assets/images/icon_time.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  Text("12:23"),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset(
                                    "assets/images/icon_medecine.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  Text(
                                    "2 piles",
                                    style: TextStyle(),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    "assets/images/icon_dosage.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text("200: mg"),
                                  Spacer(),
                                  Container(
                                    height: 30,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: AppColors.secondryColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                        child: Text(
                                      "Pending",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              )
                            ],
                          )),
                      height: 70,
                      decoration: BoxDecoration(
                          color: AppColors.secondryColor,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  );

                  // return Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //     height: 150,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.white.withOpacity(1)),
                  //     child: IntrinsicHeight(
                  //       child: Row(
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Container(
                  //                 height: double.infinity,
                  //                 width: 40,
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(5),
                  //                   color: Colors.deepPurpleAccent[100],
                  //                 ),
                  //                 child: Align(
                  //                     alignment: Alignment.topCenter,
                  //                     child: Padding(
                  //                       padding:
                  //                           const EdgeInsets.only(top: 8.0),
                  //                       child: Icon(Icons.add),
                  //                     ))),
                  //           ),
                  //           Padding(
                  //             padding:
                  //                 const EdgeInsets.only(top: 8.0, bottom: 8),
                  //             child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                       _getEventsForDay(_selectedDay)[pos]
                  //                           .name,
                  //                       style: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           fontSize: 16)),
                  //                   Text(_getEventsForDay(_selectedDay)[pos]
                  //                       .des),
                  //                   Spacer(),
                  //                   Text(_getEventsForDay(_selectedDay)[pos]
                  //                       .time)
                  //                 ]),
                  //           ),
                  //           Spacer(),
                  //           Align(
                  //             alignment: Alignment.topRight,
                  //             child: GestureDetector(
                  //               onTap: () {
                  //                 //     Navigator.of(context).push(MaterialPageRoute(
                  //                 //        builder: (
                  //                 //           context,
                  //                 //          ) =>
                  //                 //         PopUpAlert()));
                  //
                  //                 _showMyDialog();
                  //               },
                  //               child: Image.asset(
                  //                 "assets/images/chek_medecine.png",
                  //                 width: 40,
                  //                 height: 40,
                  //               ),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // );
                }))
      ]),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      //    barrierDismissible: false,
      // user must tap button!
      builder: (BuildContext context) {
        Future.delayed(
          Duration(seconds: 5),
          () {
            Navigator.of(context).pop(true);
          },
        );
        return AlertDialog(
          title: Image.asset(
            "assets/images/alert.png",
            width: 100,
            height: 100,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(
                    child: Text(
                  "Panadole reminder",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "If you Don't cancel the alert, the Following \n       Caregivers will be notified.",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                        backgroundImage: AssetImage("assets/images/avatar.png"),
                        maxRadius: 30),
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                        backgroundImage: AssetImage("assets/images/avatar.png"),
                        maxRadius: 30),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (
                      context,
                    ) =>
                            MedecinePage()));
                  },
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width * .1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        )
                      ],
                    ),
                    child: Center(
                      child: Image.asset("assets/images/chek.png"),
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[],
        );
      },
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _focusedDay = focusedDay;
        _selectedDay = selectedDay;
        _selectedEvents = _getEventsForDay(selectedDay);
        print(_selectedEvents);
      });
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    return selectedEvents[day] ?? [];
  }
}

class Event {
  bool isSelect;
  String name;
  String des;
  String time;
  String icone;

  Event(
      {this.isSelect = false,
      required this.name,
      required this.des,
      required this.time,
      required this.icone});
}

class DateUtils {
  // static final DateFormat _monthFormat = DateFormat('MMMM yyyy');
  // static final DateFormat _dayFormat = DateFormat('dd');
  // static final DateFormat _firstDayFormat = DateFormat('MMM dd');
  // static final DateFormat _fullDayFormat = DateFormat('EEE MMM dd, yyyy');
  // static final DateFormat _apiDayFormat = DateFormat('yyyy-MM-dd');
  //
  // static String formatMonth(DateTime d) => _monthFormat.format(d);
  //
  // static String formatDay(DateTime d) => _dayFormat.format(d);
  //
  // static String formatFirstDay(DateTime d) => _firstDayFormat.format(d);
  //
  // static String fullDayFormat(DateTime d) => _fullDayFormat.format(d);
  //
  // static String apiDayFormat(DateTime d) => _apiDayFormat.format(d);

  static const List<String> weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  static const List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  /// The list of days in a given month
  static List<DateTime> daysInMonth(DateTime month) {
    var first = firstDayOfMonth(month);
    var daysBefore = first.weekday;
    var firstToDisplay = first.subtract(Duration(days: daysBefore));
    var last = DateUtils.lastDayOfMonth(month);

    var daysAfter = 7 - last.weekday;

    // If the last day is sunday (7) the entire week must be rendered
    if (daysAfter == 0) {
      daysAfter = 7;
    }

    // var lastToDisplay = last.add(Duration(days: daysAfter));
    return daysRange(first, last).toList();
  }

  static Iterable<DateTime> daysRange(DateTime first, DateTime last) {
    var listOfDates = new List<DateTime>.generate(
        last.day, (i) => DateTime(first.year, first.month, i + 1));
    return listOfDates;
  }

  static bool isFirstDayOfMonth(DateTime day) {
    return isSameDay(firstDayOfMonth(day), day);
  }

  static bool isLastDayOfMonth(DateTime day) {
    return isSameDay(lastDayOfMonth(day), day);
  }

  static DateTime firstDayOfMonth(DateTime month) {
    return DateTime(month.year, month.month);
  }

  static DateTime firstDayOfWeek(DateTime day) {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    day = DateTime.utc(day.year, day.month, day.day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    /// This Calendar works from Sunday - Monday
    var decreaseNum = day.weekday % 7;
    return day.subtract(Duration(days: decreaseNum));
  }

  static DateTime lastDayOfWeek(DateTime day) {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    day = DateTime.utc(day.year, day.month, day.day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    /// This Calendar's Week starts on Sunday
    var increaseNum = day.weekday % 7;
    return day.add(Duration(days: 7 - increaseNum));
  }

  /// The last day of a given month
  static DateTime lastDayOfMonth(DateTime month) {
    var beginningNextMonth = (month.month < 12)
        ? DateTime(month.year, month.month + 1, 1)
        : DateTime(month.year + 1, 1, 1);
    return beginningNextMonth.subtract(Duration(days: 1));
  }

  /// Returns a [DateTime] for each day the given range.
  ///
  /// [start] inclusive
  /// [end] exclusive
  static Iterable<DateTime> daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.day <= end.day) {
      yield i;
      i = i.add(Duration(days: 1));
      var timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }

  /// Whether or not two times are on the same day.
  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static bool isSameWeek(DateTime a, DateTime b) {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    a = DateTime.utc(a.year, a.month, a.day);
    b = DateTime.utc(b.year, b.month, b.day);

    var diff = a.toUtc().difference(b.toUtc()).inDays;
    if (diff.abs() >= 7) {
      return false;
    }

    var min = a.isBefore(b) ? a : b;
    var max = a.isBefore(b) ? b : a;
    var result = max.weekday % 7 - min.weekday % 7 >= 0;
    return result;
  }

  static DateTime previousMonth(DateTime m) {
    var year = m.year;
    var month = m.month;
    if (month == 1) {
      year--;
      month = 12;
    } else {
      month--;
    }
    return DateTime(year, month);
  }

  static DateTime nextMonth(DateTime m) {
    var year = m.year;
    var month = m.month;

    if (month == 12) {
      year++;
      month = 1;
    } else {
      month++;
    }
    return DateTime(year, month);
  }

  static DateTime previousWeek(DateTime w) {
    return w.subtract(Duration(days: 7));
  }

  static DateTime nextWeek(DateTime w) {
    return w.add(Duration(days: 7));
  }
}
