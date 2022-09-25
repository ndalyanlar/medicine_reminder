import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../extension/context_extension.dart';
import '../../extension/datetime_extension.dart';
import '../../util/style/utils.dart';
import '../provider/pill_model_view.dart';

// ignore: must_be_immutable
class TimeTextfield extends ConsumerWidget {
  const TimeTextfield({
    required this.textEditingController,
    Key? key,
  }) : super(key: key);
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerPill = ref.watch(providerPillViewModel);

    return TextField(
      onTap: () {
        showCupertinoModalPopup(
          builder: (context) => Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.instance.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: context.getDynamicHeight(0.3),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CupertinoDatePicker(
                          use24hFormat: true,
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (value) {
                            providerPill.selectedTime24Hour =
                                TimeOfDay.fromDateTime(value);
                          },
                          initialDateTime: DateTime.now()
                              .applied(providerPill.selectedTime24Hour!)),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: CupertinoButton(
                          color: AppColor.instance.lightPrimaryColor,
                          child: const Text('Tamam'),
                          onPressed: () {
                            textEditingController.text = providerPill.clockText;
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          context: context,
        );
      },
      controller: textEditingController,
      readOnly: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColor.instance.lightSecondaryColor,
                style: BorderStyle.solid)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColor.instance.white, style: BorderStyle.solid)),
        suffixIcon: Icon(
          Icons.timer_sharp,
          color: AppColor.instance.lightPrimaryColor,
        ),
      ),
    );
  }
}
