import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/presentation/controllers/medecine_controller/medecine_controller.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../app/widget/custom_button.dart';
import 'package:get/get.dart';

import '../../../controllers/seizure_controller/seizure_controller.dart';

class InsertMedecinePage extends GetView<MedecineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: controller.medecineKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      Spacer(),
                      Text("insert_medecine".tr,
                          style: TextStyle(color: Colors.white, fontSize: 21)),
                      Spacer(),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 18.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 10,
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
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              GetBuilder<SeizureController>(builder: (logic) {
                            return TableCalendar(
                              calendarBuilders: CalendarBuilders(todayBuilder:
                                  (context, _datetime, focusedDay) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: focusedDay == _datetime
                                          ? Colors.amberAccent
                                          : Theme.of(context)
                                              .scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(4.0)),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0.0),
                                  child: focusedDay == _datetime
                                      ? Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                DateUtils.weekdays[
                                                    _datetime.weekday - 1],
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  _datetime.day.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
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
                                                DateUtils.weekdays[
                                                    _datetime.weekday - 1],
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  _datetime.day.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                );
                              }, selectedBuilder:
                                  (context, _datetime, focusedDay) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.amberAccent,
                                      borderRadius: BorderRadius.circular(4.0)),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0.0),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          DateUtils
                                              .weekdays[_datetime.weekday - 1],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            _datetime.day.toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                              selectedDayPredicate: (day) {
                                return isSameDay(logic.selectedDay, day);
                              },
                              calendarStyle: const CalendarStyle(
                                canMarkersOverflow: true,
                              ),
                              onDaySelected: (selectedDay, focusedDay) {
                                logic.selectedDay = selectedDay;
                                logic.focusedDay =
                                    focusedDay; // update `_focusedDay` here as well
                                logic.update();
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
                                  decoration:
                                      BoxDecoration(color: Colors.amberAccent),
                                  weekdayStyle: TextStyle(
                                    fontSize: 10,
                                  )),
                              focusedDay: controller.selectedDay == null
                                  ? DateTime.now()
                                  : controller.selectedDay!,
                            );
                          })),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 28.0, top: 8, right: 28, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "time".tr,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        GetBuilder<MedecineController>(builder: (logic) {
                          return GestureDetector(
                            onTap: () {
                              controller.showMyTimePicker(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: Colors.black26),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "${controller.timeOfDay.hour} : ${controller.timeOfDay.minute}",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "remind_me".tr,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        GetBuilder<MedecineController>(builder: (logic) {
                          return CupertinoSwitch(
                              value: logic.reminder,
                              onChanged: (v) {
                                logic.updateReminder(v);
                              });
                        }),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, top: 8, right: 28),
                child: Text(
                  "insert_name_of_medecine".tr,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(width: 1, color: AppColors.BorderInputColor),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: TextFormField(
                    validator: (value) {
                      return controller.validator.validateName(value!);
                    },
                    controller: controller.name,
                    decoration: InputDecoration(
                      fillColor: AppColors.MedecineInput,
                      filled: true,
                      hintText: "insert_name_of_medecine".tr,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Italic",
                          fontSize: 11),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(.0))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(.0))),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 28.0, right: 28, top: 8, bottom: 8),
                child: SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("dosage".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14)),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: AppColors.BorderInputColor),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: TextFormField(
                                    validator: (value) {
                                      return controller.validator
                                          .validateDosage(value!);
                                    },
                                    keyboardType: TextInputType.number,
                                    controller: controller.dosage,
                                    decoration: InputDecoration(
                                      fillColor: AppColors.MedecineInput,
                                      filled: true,
                                      //hintText: "Insert name of Medecine",
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "Italic",
                                          fontSize: 11),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          borderSide: BorderSide(
                                              color:
                                                  Colors.grey.withOpacity(.0))),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color:
                                                  Colors.grey.withOpacity(.0))),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("quantity".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14)),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: AppColors.BorderInputColor),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: TextFormField(
                                    validator: (value) {
                                      return controller.validator
                                          .validateQuantity(value!);
                                    },
                                    keyboardType: TextInputType.number,
                                    controller: controller.quantity,
                                    decoration: InputDecoration(
                                      fillColor: AppColors.MedecineInput,
                                      filled: true,
                                      //hintText: "Insert name of Medecine",
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "Italic",
                                          fontSize: 11),
                                      // errorBorder: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.circular(
                                      //       20,
                                      //     ),
                                      //     borderSide:
                                      //         BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          borderSide: BorderSide(
                                              color:
                                                  Colors.grey.withOpacity(.0))),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color:
                                                  Colors.grey.withOpacity(.0))),
                                    ),
                                  )),
                                  // GetBuilder<MedecineController>(
                                  //     builder: (logic) {
                                  //   return DropdownButton<String>(
                                  //     hint: Text("Type"),
                                  //     value: controller.type_quantity,
                                  //     elevation: 20,
                                  //     underline: SizedBox(),
                                  //     onChanged: (String? newValue) {
                                  //       controller.type_quantity = newValue ?? "";
                                  //       logic.update();
                                  //     },
                                  //     items: <String>[
                                  //       'pilules',
                                  //       'injection',
                                  //     ].map<DropdownMenuItem<String>>(
                                  //         (String value) {
                                  //       return DropdownMenuItem<String>(
                                  //         value: value,
                                  //         child: Text(value),
                                  //       );
                                  //     }).toList(),
                                  //   );
                                  // }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: CustomButton(
                    text: 'insert_a_medecine'.tr,
                    color: AppColors.secondryColor,
                    width: MediaQuery.of(context).size.width * .7,
                    // MediaQuery.of(context).size.width*.8,
                    hight: 60,
                    onClick: () {
                      controller.validator.validationType = false;
                      if (!controller.medecineKey.currentState!.validate()) {
                        ///if client validations fails
                        ///show a snackbar to fix the client errors.
                        Get.snackbar("Oups !",
                            "Merci de corriger les erreurs ci-dessous.",
                            backgroundColor: Colors.deepOrangeAccent,
                            colorText: Colors.white);
                        return;
                      }
                      controller.validator.validationType = true;
                      //send data to server and get errors
                      if (controller.isUpdate) {
                        controller.updateMedication(context);
                      } else {
                        controller.addMedication(context);
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
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
