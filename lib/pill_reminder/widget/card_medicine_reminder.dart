import '../../extension/string_extension.dart';

import '../../extension/context_extension.dart';
import 'package:flutter/material.dart';
import '../../init/icon/custom_icons.dart';
import '../../util/style/utils.dart';
import '../model/medicine.dart';

class CardMedicineReminder extends StatelessWidget {
  const CardMedicineReminder(
      {Key? key, required this.medicineList, required this.index})
      : super(key: key);
  final List<Medicine> medicineList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: const Color.fromARGB(255, 3, 143, 124),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: ListTile(
          trailing: FittedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  CustomIcons.pill_capsule_svgrepo_com,
                  color: AppColor.instance.orange,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  medicineList[index].getName.replaceFirst(
                      medicineList[index].getName.characters.first,
                      medicineList[index]
                          .getName
                          .characters
                          .first
                          .toUpperCase()),
                  style: AppTheme.title,
                ),
              ],
            ),
          ),
          title: SizedBox(
            height: context.getDynamicHeight(0.08),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      medicineList[index].remindTimeList.length,
                      (i) => Text(
                        "${medicineList[index].getRemindTimeList[i].toString().fromTimeOfDay()} ",
                        style: AppTheme.body1,
                      ),
                    ),
                  ),
                  if (medicineList[index].getDays.length == 7) ...[
                    const Text(
                      "Her Gün",
                      style: AppTheme.subtitle,
                    ),
                  ] else ...[
                    Row(
                      children: List.generate(
                        medicineList[index].days.length,
                        (i) => Text(
                          "${medicineList[index].days[i].toString()} ",
                          style: AppTheme.caption
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
