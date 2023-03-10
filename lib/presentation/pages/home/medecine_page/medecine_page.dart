import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowplesy/presentation/controllers/medecine_controller/medecine_controller.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../app/util/app_colors.dart';
import '../../../../app/widget/custom_button.dart';
import 'insert_medecine.dart';
import 'package:get/get.dart';

class MedecinePage extends GetView<MedecineController> {
  DateTime _selectedDay = DateTime.now();

  DateTime? _focusedDay;
  List<Event> _selectedEvents = [];
  Map<DateTime, List<Event>> selectedEvents = {};

  @override
  Widget build(BuildContext context) {
    controller.getMedecation();
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
            child: Text("medecine".tr,
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
                    child: Text("schedule".tr,
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
                                      color: Colors.white, fontSize: 12),
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
                      _selectedDay = selectedDay;
                      _focusedDay =
                          focusedDay; // update `_focusedDay` here as well
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
                      text: 'insert_a_medecine'.tr,
                      color: AppColors.secondryColor,
                      width: MediaQuery.of(context).size.width * .6,
                      // MediaQuery.of(context).size.width*.8,
                      hight: 50,
                      onClick: () {
                        controller.isUpdate = false;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (
                          context,
                        ) =>
                                InsertMedecinePage()));
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
                child: Text("medecine".tr,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("today".tr,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(child: GetBuilder<MedecineController>(builder: (logic) {
          return logic.getMedecationJson == null
              // ? Center(
              //     child: CircularProgressIndicator(),
              //   )
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),

                      Image.asset(
                        "assets/images/icon_piles.png",
                        height: 30,
                        width: 30,
                      ),
                      const Align(
                        alignment: Alignment.topCenter,
                        child: Text("You have not added any medicine",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey)),
                      ),

                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: logic.getMedecationJson?.data?.length,
                  itemBuilder: (context, pos) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          logic.getAllData(
                              logic.getMedecationJson!.data![pos].id!, context);
                          logic.idMedecine =
                              logic.getMedecationJson!.data![pos].id!;
                          logic.isUpdate = true;
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15))),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                        "${logic.getMedecationJson?.data?[pos].name}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      Image.asset(
                                        "assets/images/icon_time.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      Text(
                                        "${logic.getMedecationJson?.data?[pos].time}",
                                      ),
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
                                      Row(
                                        children: [
                                          Text(
                                            "${logic.getMedecationJson?.data?[pos].dosage}",
                                            style: TextStyle(),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text("Mg")
                                        ],
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
                                      Row(
                                        children: [
                                          Text(
                                              "${logic.getMedecationJson?.data?[pos].quantity}"),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text("/Jour"),
                                        ],
                                      ),
                                      Spacer(),
                                      GetBuilder<MedecineController>(
                                          builder: (logic) {
                                        return GestureDetector(
                                          onTap: () {
                                            print(logic.getMedecationJson!
                                                .data![pos].id
                                                .toString());
                                            logic.addStateMedecation(
                                                medication_id: logic
                                                    .getMedecationJson!
                                                    .data![pos]
                                                    .id
                                                    .toString());
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                color: logic
                                                            .getMedecationJson!
                                                            .data![pos]
                                                            .stateMedication ==
                                                        0
                                                    ? AppColors.secondryColor
                                                    : Colors.deepPurpleAccent,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                                child: logic
                                                            .getMedecationJson!
                                                            .data![pos]
                                                            .stateMedication ==
                                                        1
                                                    ? Text(
                                                        "taken".tr,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    : Text(
                                                        "Pendding".tr,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )),
                                          ),
                                        );
                                      }),
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
                      ),
                    );
                  });
        })),
        SizedBox(
          height: 8,
        ),
        // Align(
        //   alignment: Alignment.centerLeft,
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 2.0, left: 18),
        //     child: Text("tomorrow".tr,
        //         style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
        //   ),
        // ),
        // SizedBox(
        //   height: 8,
        // ),
        // Expanded(
        //     child: ListView.builder(
        //         itemCount: _getEventsForDay(_selectedDay).length,
        //         itemBuilder: (context, pos) {
        //           return Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Container(
        //               padding: EdgeInsets.only(left: 10),
        //               child: Container(
        //                   decoration: BoxDecoration(
        //                       color: Colors.white,
        //                       borderRadius: BorderRadius.only(
        //                           topRight: Radius.circular(15),
        //                           bottomRight: Radius.circular(15))),
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                     children: [
        //                       Row(
        //                         children: [
        //                           SizedBox(
        //                             width: 8,
        //                           ),
        //                           Image.asset(
        //                             "assets/images/icon_piles.png",
        //                             color: AppColors.secondryColor,
        //                             height: 20,
        //                             width: 20,
        //                           ),
        //                           SizedBox(
        //                             width: 4,
        //                           ),
        //                           Text(
        //                             "tegretol".tr,
        //                             style:
        //                                 TextStyle(fontWeight: FontWeight.bold),
        //                           ),
        //                           Spacer(),
        //                           Image.asset(
        //                             "assets/images/icon_time.png",
        //                             height: 20,
        //                             width: 20,
        //                           ),
        //                           Text("12:23"),
        //                           SizedBox(
        //                             width: 8,
        //                           ),
        //                         ],
        //                       ),
        //                       Row(
        //                         children: [
        //                           SizedBox(
        //                             width: 8,
        //                           ),
        //                           Image.asset(
        //                             "assets/images/icon_medecine.png",
        //                             height: 20,
        //                             width: 20,
        //                           ),
        //                           Text(
        //                             "2 piles",
        //                             style: TextStyle(),
        //                           ),
        //                           Spacer(),
        //                           Image.asset(
        //                             "assets/images/icon_dosage.png",
        //                             height: 20,
        //                             width: 20,
        //                           ),
        //                           SizedBox(
        //                             width: 4,
        //                           ),
        //                           Text("200: mg"),
        //                           Spacer(),
        //                           Container(
        //                             height: 30,
        //                             width: 70,
        //                             decoration: BoxDecoration(
        //                                 color: AppColors.secondryColor,
        //                                 borderRadius:
        //                                     BorderRadius.circular(15)),
        //                             child: Center(
        //                                 child: Text(
        //                               "pending".tr,
        //                               style: TextStyle(color: Colors.white),
        //                             )),
        //                           ),
        //                           SizedBox(
        //                             width: 8,
        //                           ),
        //                         ],
        //                       )
        //                     ],
        //                   )),
        //               height: 70,
        //               decoration: BoxDecoration(
        //                   color: AppColors.secondryColor,
        //                   borderRadius: BorderRadius.circular(15)),
        //             ),
        //           );
        //         }))
      ]),
    );
  }

  Future<void> _showMyDialog(context) async {
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
                  "if_you_dont_cancel_the_alert_the_following_caregivers_will_be_notified"
                      .tr,
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
      _focusedDay = focusedDay;
      _selectedDay = selectedDay;
      _selectedEvents = _getEventsForDay(selectedDay);
      print(_selectedEvents);
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
