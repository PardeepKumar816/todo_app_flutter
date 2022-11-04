import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/styles/button_style.dart';
import 'package:flutter_todo_app/presentation/styles/colors.dart';
import 'package:flutter_todo_app/presentation/widgets/circular_button.dart';
import 'package:intl/intl.dart';

import 'welcome_screen.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);

  String month = DateFormat.MMMM().format(DateTime.now());
  String date = DateFormat.d().format(DateTime.now());
  // String weekday = DateFormat.E().format(DateTime.now());

  // final birthday = DateTime(
  //     DateTime.now().year, DateTime.now().month, DateTime.now().weekday);
  // final DateTime date2 = DateTime.now();
  // final difference = date2.difference(birthday).inDays;

  @override
  Widget build(BuildContext context) {
    //print(DateFormat.E().format(DateTime(date2.difference(birthday).inDays)));
    //print(DateTime.now().weekday + 5);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppColors.white,
                      foregroundImage: AssetImage('assets/icons/profile1.png'),
                      radius: 32,
                    ),
                    Text(
                      'Hello Shahzad Khan',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      width: WelcomeScreen.size.width * 0.02,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings),
                      iconSize: 32,
                    ),
                  ],
                ),
                SizedBox(
                  height: WelcomeScreen.size.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$month, $date',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: WelcomeScreen.size.width * 0.07),
                    ),
                    CircularButton(
                      style: MyButtonStyle.style.copyWith(
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                          ),
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                            horizontal: WelcomeScreen.size.width / 12,
                            vertical: WelcomeScreen.size.width * 0.04,
                          ),
                        ),
                      ),
                      label: '+ Add Task',
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: WelcomeScreen.size.height / 20,
                ),
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColors.purple,
                  height: WelcomeScreen.size.height / 5.5,
                  width: WelcomeScreen.size.width / 4,
                  dateTextStyle:
                      TextStyle(fontSize: WelcomeScreen.size.width * 0.07),
                  monthTextStyle:
                      TextStyle(fontSize: WelcomeScreen.size.width * 0.05),
                  dayTextStyle:
                      TextStyle(fontSize: WelcomeScreen.size.width * 0.05),
                  onDateChange: (date) {},
                ),
                SizedBox(
                  height: WelcomeScreen.size.height / 20,
                ),
                Column(
                  children: [
                    Container(
                      width: WelcomeScreen.size.width,
                      height: WelcomeScreen.size.height / 3,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/clipboard.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: WelcomeScreen.size.width * 0.05,
                    ),
                    Text(
                      'There is no Task',
                      style: TextStyle(
                          fontSize: WelcomeScreen.size.width * 0.065,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // ListView.builder(
                //     itemBuilder: (BuildContext context, int index) {
                //   return Container(
                //     width: WelcomeScreen.size.width / 4,
                //     height: WelcomeScreen.size.height / 5.5,
                //     decoration: const BoxDecoration(
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(12),
                //         ),
                //         color: AppColors.purple),
                //     child: Column(
                //       children: [],
                //     ),
                //   );
                // }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class Calender {
//   final String date;
//   final String month;
//   final String day;
//
//   Calender({required this.date, required this.month, required this.day});
//
//   List<Calender> _list() {
//     String month = DateFormat.MMMM().format(DateTime.now());
//     String date = DateFormat.d().format(DateTime.now());
//     String weekday = DateFormat.E().format(DateTime.now());
//     list.add(Calender(date: date, month: month, day: weekday));
//     //List l = list.where((element) {}).toList();
//
//     //String month = DateFormat.
//
//     for (int i = 0; i < 20; i++) {
//       list.add(Calender(date: date, month: month, day: day));
//     }
//   }
// }
//
// List<Calender> list = [];
