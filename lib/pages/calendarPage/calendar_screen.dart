import 'package:flutest/components/navbar/custom_bottom_navbar.dart';
import 'package:flutest/components/navbar/custom_top_navbar.dart';
import 'package:flutest/components/utils%20widget/button_back.dart';
import 'package:flutest/pages/calendarPage/components/body_calendar.dart';
import 'package:flutest/state/enums.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Navbar(
          text: "Calendrier",
          back: BackButtonNavNone(),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: BodyCalendar(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.calendar),
    );
  }
}
