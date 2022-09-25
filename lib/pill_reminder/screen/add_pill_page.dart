import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_reminder/extension/extensions.dart';

import '../../util/style/app_theme.dart';
import '../enum/period.dart';
import '../provider/pill_model_view.dart';
import '../widget/day_chips.dart';
import '../widget/floating_action_button.dart';
import '../widget/time_list.dart';
import '../widget/type_dropdown.dart';

class AddPillPage extends ConsumerStatefulWidget {
  const AddPillPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AddPillPage> createState() => _AddPillPageState();
}

class _AddPillPageState extends ConsumerState<AddPillPage> {
  late final List<DropdownMenuItem<String>> options;
  @override
  void initState() {
    options = List.generate(
        Period.values.length,
        (index) => DropdownMenuItem(
              value: index.toString(),
              child: Text(
                Period.values[index].name,
              ),
            ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerPill = ref.watch<PillModelView>(providerPillViewModel);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text("İlaç Ekle"),
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
                          key: providerPill.textFieldNameKey,
                          child: TextFormField(
                            validator: (value) {
                              return value!.isEmpty
                                  ? "Lütfen ilaç ismini giriniz."
                                  : null;
                            },
                            controller: providerPill.pillNameFieldController,
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
                        if (providerPill.selectedType == Period.SomeDays) ...[
                          DayChips(providerPill: providerPill),
                        ],
                        SizedBox(
                          height: context.getDynamicHeight(0.05),
                        ),
                        TimeList(providerPill: providerPill),
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
