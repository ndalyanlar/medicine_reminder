import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/day.dart';
import '../enum/period.dart';
import '../provider/pill_model_view.dart';

class TypeDropdown extends ConsumerWidget {
  const TypeDropdown({Key? key, required this.options}) : super(key: key);

  final List<DropdownMenuItem<String>> options;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton<String>(
        borderRadius: BorderRadius.circular(20),
        isExpanded: true,
        value: ref
            .watch<PillModelView>(providerPillViewModel)
            .selectedType
            .index
            .toString(),
        items: options,
        onChanged: (value) {
          if (value! == Period.EveryDay.index.toString()) {
            for (var day in Day.values) {
              ref.watch(providerPillViewModel).addDay(day.name);
            }
          }

          ref
              .watch(providerPillViewModel)
              .changeDaysView(Period.values[int.parse(value)]);
        });
  }
}
