import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/date_row.dart';
import '../widgets/home_screen_top_header.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87.withOpacity(0.9),
      body: const SafeArea(
        child: Column(
          children: [
            HomeScreenTopHeader(),
            DateRow(),

          ],
        ),
      ),
    );
  }
}
