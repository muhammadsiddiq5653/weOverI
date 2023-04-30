import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../export.dart';

class TimelineBar extends StatelessWidget {
  final int daysInMonth;
  final int currentDay;

  TimelineBar({required this.daysInMonth, required this.currentDay});

  double x = 0;
  double y = 0;
  double z = 0;
  List<List<int>> section = [
    [1, 2, 3, 4],
    [5, 6, 7, 8, 9, 10, 11, 12],
    [13, 14, 15, 16, 17, 18, 19],
    [20, 21, 22, 23, 24],
    [26, 27, 28, 29, 30, 31]
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '0',
          style: textStyles.euclidRegular.copyWith(
              fontSize: sizes.fontRatio * 11,
              color: Colors.white.withOpacity(0.3)),
        ).paddingOnly(top: 12),
        Expanded(
          child: SizedBox(
            height: 30,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 18),
                        height: 8,
                        width: sizes.width / 6.8,
                        transform: Matrix4(
                          1,
                          0,
                          0,
                          0,
                          1,
                          1,
                          0,
                          0,
                          0,
                          0,
                          1,
                          0,
                          0,
                          0,
                          0,
                          1,
                        )
                          ..rotateX(x)
                          ..rotateY(y)
                          ..rotateZ(z),
                        alignment: FractionalOffset.center,
                        color: getColor(index),
                      ),
                      Positioned(
                        left: 40,
                        child: getDayIndicator(index),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 2,
                  );
                },
                itemCount: section.length),
          ),
        ),
        horizontalSpacer(8),
        Text(
          daysInMonth.toString(),
          style: textStyles.euclidRegular
              .copyWith(fontSize: sizes.fontRatio * 11, color: Colors.grey),
        ).paddingOnly(top: 12),
      ],
    );
  }

  getColor(int index) {
    if (section[index].contains(currentDay)) {
      return Colors.white;
    }
    return Colors.grey;
  }

  getDayIndicator(index) {
    if (section[index].contains(currentDay)) {
      return Column(
        children: [
          Text(
            currentDay.toString(),
            style: textStyles.euclidRegular
                .copyWith(fontSize: sizes.fontRatio * 11, color: Colors.grey),
          ),
          Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.black, blurRadius: 8, spreadRadius: 1)
                ]),
          ),
        ],
      );
    }
    return SizedBox.shrink();
  }
}
