import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Body extends StatefulWidget {
  @override
  ScheduleViewState createState() => ScheduleViewState();
}

class ScheduleViewState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SfCalendar(
        view: CalendarView.month,
        scheduleViewSettings: ScheduleViewSettings(
            hideEmptyScheduleWeek: true,
            monthHeaderSettings: MonthHeaderSettings(height: 70)),
        monthViewSettings: MonthViewSettings(
            dayFormat: 'EEE',
            numberOfWeeksInView: 4,
            appointmentDisplayCount: 2,
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            showAgenda: true,
            navigationDirection: MonthNavigationDirection.horizontal,
            agendaStyle: AgendaStyle(
                backgroundColor: Colors.transparent,
                appointmentTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontStyle: FontStyle.italic
                ),
                dayTextStyle: TextStyle(color: Colors.red,
                    fontSize: 13,
                    fontStyle: FontStyle.italic),
                dateTextStyle: TextStyle(color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal)
            )),
      ),
    );
  }
}
