// ignore_for_file: deprecated_member_use

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:emp_apnagodam/Data/Models/HolidaysModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Domain/Attendance/AttendanceService.dart';
import '../../Constants/ColorConstant.dart';

class Listofholidaysscreen extends ConsumerStatefulWidget {
  const Listofholidaysscreen({super.key});

  @override
  ConsumerState<Listofholidaysscreen> createState() =>
      _ListofholidaysscreenState();
}

class _ListofholidaysscreenState extends ConsumerState<Listofholidaysscreen> {
  var monthGlobalKey = GlobalKey<MonthViewState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Of Holidays',
        ),
      ),
      body: listofHolidaysLayout(),
    );
  }

  listofHolidaysLayout() => ref.watch(listOfHolidaysProvider).when(
      data: (holidaysData) {
        List<Datum> approachingHolidays = [];
        holidaysData.data?.forEach((e) {
          final event = CalendarEventData(
            date: DateTime.parse(e.date.toString()),
            event: "${e.reason}",
            title: "${e.reason}",
          );

          if (DateTime.now().month == DateTime.parse(e.date.toString()).month) {
            approachingHolidays.add(e);
          }

          CalendarControllerProvider.of(context).controller.add(event);
        });

        return ListView(
          children: [
            Padding(
              padding: const Pad(all: 10),
              child: Text(
                "Holidays in Current Month",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: Adaptive.sp(18)),
              ),
            ),
            approachingHolidays.isEmpty
                ? Padding(
                    padding: const Pad(all: 10),
                    child: Text(
                      "No Holidays in Current Month",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Adaptive.sp(18)),
                    ),
                  )
                : Container(
                    color: primaryColorDark,
                    padding: const Pad(all: 10),
                    child: IntrinsicHeight(
                      child: Row(children: [
                        Expanded(
                            child: Text(
                          "Date",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: Adaptive.sp(14)),
                        )),
                        const VerticalDivider(),
                        Expanded(
                            child: Text(
                          "Type of Holiday",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: Adaptive.sp(14)),
                        )),
                      ]),
                    ),
                  ),
            ListView.builder(
              itemCount: approachingHolidays.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                color: index % 2 == 0
                    ? Colors.grey.withOpacity(0.2)
                    : Colors.white,
                padding: const Pad(all: 10),
                child: IntrinsicHeight(
                  child: Row(children: [
                    Expanded(
                        child: Text.rich(
                      TextSpan(
                        text:
                            "${DateTime.parse(approachingHolidays[index].date.toString()).day}/${DateTime.parse(approachingHolidays[index].date.toString()).month}/${DateTime.parse(approachingHolidays[index].date.toString()).year}",
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Adaptive.sp(14)),
                    )),
                    const VerticalDivider(),
                    Expanded(
                        child: Text(
                      "${approachingHolidays[index].reason}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: Adaptive.sp(14)),
                    )),
                  ]),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const Pad(all: 10),
              child: Text(
                "Holiday Calendar",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: Adaptive.sp(18)),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: MonthView(
                key: monthGlobalKey,
                minMonth: DateTime(DateTime.now().year),
                maxMonth: DateTime(DateTime.now().year + 5),
                initialMonth: DateTime.now(),
                cellAspectRatio: 1,
                onPageChange: (date, pageIndex) => print("$date, $pageIndex"),
                onCellTap: (events, date) {
                  print(events);
                },
                startDay: WeekDays.sunday,
                onEventTap: (event, date) => print(event),
                onEventDoubleTap: (events, date) => print(events),
                onEventLongTap: (event, date) => print(event),
                onDateLongPress: (date) => print(date),
                showWeekTileBorder: false,
                cellBuilder:
                    (date, event, isToday, isInMonth, hideDaysNotInMonth) =>
                        Stack(
                  fit: StackFit.loose,
                  children: [
                    Container(
                      color: isInMonth
                          ? const Color.fromRGBO(255, 255, 255, 1)
                          : Colors.grey.withOpacity(0.2),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${date.day}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: Adaptive.sp(16),
                              fontWeight: FontWeight.bold,
                              color: isInMonth
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.1)),
                        ),
                        if (event.isNotEmpty && isInMonth)
                          Column(
                            children: event
                                .map((e) => Text(
                                      e.title,
                                      style: TextStyle(color: primaryColor),
                                    ))
                                .toList(),
                          ),
                      ],
                    )
                  ],
                ),
                headerBuilder: (dateTIme) => Container(
                    alignment: Alignment.center,
                    padding: Pad(all: 10),
                    color: primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            monthGlobalKey.currentState?.animateToPage(
                                (monthGlobalKey.currentState?.currentPage ??
                                        1) -
                                    1);
                          },
                        ),
                        Text(
                          "${DateFormat("MMMM dd, yyyy").format(dateTIme)} ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            monthGlobalKey.currentState?.animateToPage(
                                (monthGlobalKey.currentState?.currentPage ??
                                        1) +
                                    1);
                          },
                        ),
                      ],
                    )),
                hideDaysNotInMonth: false,
              ),
            )
          ],
        );
      },
      error: (e, s) => Container(),
      loading: () => Container(
            height: Adaptive.h(100),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ));
}
