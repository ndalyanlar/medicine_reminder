import 'package:flutter/material.dart';

import '../../util/style/utils.dart';
import '../enum/day.dart';
import '../provider/pill_model_view.dart';

class DayChips extends StatelessWidget {
  const DayChips({
    Key? key,
    required this.providerPill,
  }) : super(key: key);

  final PillModelView providerPill;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 10,
        children: List.generate(
            Day.values.length,
            (index) => ActionChip(
                backgroundColor:
                    providerPill.selectedDays.contains(Day.values[index].name)
                        ? AppColor.instance.lightPrimaryColor
                        : Colors.grey.withOpacity(0.8),
                label: Text(
                  Day.values[index].name,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: AppColor.instance.white,
                      fontWeight: FontWeight.w700),
                ),
                onPressed: () {
                  providerPill.selectedDays.contains(Day.values[index].name)
                      ? providerPill.selectedDays.length == 1
                          ? null
                          : providerPill.removeDay(Day.values[index].name)
                      : providerPill.addDay(Day.values[index].name);
                })),
      ),
    );
  }
}
