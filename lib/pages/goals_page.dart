import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../style/my_colors.dart';
import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/items/goal_item.dart';

// ignore: must_be_immutable
class GoalsPage extends StatelessWidget {
  final List<Map<String, dynamic>> tempGoals = [
    {
      'text': 'Első cél',
      'isDone': true,
    },
    {
      'text': 'Második, de már hosszabb cél',
      'isDone': true,
    },
    {
      'text': 'Harmadik, de még az előzőnél is hosszabb cél tesztelni',
      'isDone': false,
    },
    {
      'text':
          'Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. ',
      'isDone': false,
    },
    {
      'text': 'Valami szöveg 5',
      'isDone': true,
    },
    {
      'text': 'Valami szöveg 6',
      'isDone': false,
    },
    {
      'text': 'Valami szöveg 7',
      'isDone': false,
    },
    {
      'text': 'Valami szöveg 8',
      'isDone': false,
    },
    {
      'text': 'Valami szöveg 9',
      'isDone': true,
    },
    {
      'text': 'Valami szöveg 10',
      'isDone': false,
    },
  ];
  int numberOfDone = 0;

  GoalsPage({super.key}) {
    numberOfDone = tempGoals.where((goal) => goal['isDone']).length;
  }
  @override
  Widget build(BuildContext context) {
    return BasicPageContainer(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  const Expanded(
                    child: MyTitleText(text: 'Goals'),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: SleekCircularSlider(
                        min: 0,
                        max: tempGoals.length.toDouble(),
                        initialValue: numberOfDone.toDouble(),
                        appearance: CircularSliderAppearance(
                          size: MediaQuery.of(context).size.width * 0.20,
                          angleRange: 360,
                          startAngle: 270,
                          animDurationMultiplier: 2,
                          customWidths: CustomSliderWidths(
                            progressBarWidth: 6,
                            trackWidth: 6,
                            handlerSize: 8,
                          ),
                          customColors: CustomSliderColors(
                            hideShadow: true,
                            trackColor: MyColors.grey,
                            progressBarColor: MyColors.tertiaryBlue,
                            dotColor: MyColors.tertiaryBlue,
                          ),
                        ),
                        innerWidget: ((_) {
                          return Align(
                            alignment: Alignment.center,
                            child: Text(
                              '$numberOfDone / ${tempGoals.length}',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: MyColors.dark,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) => Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: GoalItem(
                  text: tempGoals[index]['text'],
                  isDone: tempGoals[index]['isDone'],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
