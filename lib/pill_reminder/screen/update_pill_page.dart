import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_reminder/extension/extensions.dart';

import '../../util/style/utils.dart';
import '../enum/period.dart';
import '../model/medicine.dart';
import '../provider/pill_model_view.dart';
import '../widget/day_chips.dart';
import '../widget/floating_action_button.dart';
import '../widget/time_list.dart';
import '../widget/type_dropdown.dart';

class UpdatePillPage extends ConsumerStatefulWidget {
  const UpdatePillPage({Key? key, required this.medicine}) : super(key: key);
  final Medicine medicine;

  @override
  ConsumerState<UpdatePillPage> createState() => _UpdatePillPageState();
}

class _UpdatePillPageState extends ConsumerState<UpdatePillPage> {
  late final List<DropdownMenuItem<String>> options;

  @override
  void initState() {
    final provider = ref.read(providerPillViewModel);

    options = List.generate(
      Period.values.length,
      (index) => DropdownMenuItem(
        value: index.toString(),
        child: Text(
          Period.values[index].name,
        ),
      ),
    );
    provider.pillNameFieldController.text = widget.medicine.medicineName;
    provider.selectedDays = widget.medicine.getDays.cast<String>();
    widget.medicine.getDays.length == 7
        ? provider.selectedType = Period.EveryDay
        : provider.selectedType = Period.SomeDays;

    for (int i = 0; i < widget.medicine.getRemindTimeList.length; i++) {
      provider.isVisibleTimeTextFieldList[i] = true;

      provider.timeTextFieldControllerList[i].text =
          widget.medicine.getRemindTimeList[i].toString().fromTimeOfDay();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerWatch = ref.watch<PillModelView>(providerPillViewModel);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text("İlaç Güncelle"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.getDynamicWidth(),
          height: context.getDynamicHeight(),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: context.getDynamicWidth(0.84),
              height: context.getDynamicHeight(0.9),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          key: providerWatch.textFieldNameKey,
                          child: TextFormField(
                            validator: (value) {
                              return value!.isEmpty
                                  ? "Lütfen ilaç ismini giriniz."
                                  : null;
                            },
                            controller: providerWatch.pillNameFieldController,
                            decoration: const InputDecoration(
                              label: Text(
                                "İlaç ismini giriniz",
                                style: AppTheme.body1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: context.getDynamicHeight(0.05),
                        ),
                        const Text(
                          "Günleri Seçin",
                          style: AppTheme.title,
                        ),
                        TypeDropdown(options: options),
                        if (providerWatch.selectedType == Period.SomeDays) ...[
                          DayChips(providerPill: providerWatch),
                        ],
                        SizedBox(
                          height: context.getDynamicHeight(0.05),
                        ),
                        TimeList(providerPill: providerWatch),
                        SizedBox(
                          height: context.getDynamicHeight(0.05),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                      top: 8, right: 8, child: SaveReminderActionButton())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
