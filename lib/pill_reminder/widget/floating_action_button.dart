import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../routing/route.gr.dart';
import '../../util/style/utils.dart';
import '../provider/pill_model_view.dart';

class SaveReminderActionButton extends ConsumerWidget {
  const SaveReminderActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: FloatingActionButton(
        backgroundColor: AppColor.instance.orange,
        onPressed: () async {
          bool checkTextField = ref
              .watch(providerPillViewModel)
              .textFieldNameKey
              .currentState!
              .validate();

          void addReminderToCache() async {
            await ref.read(providerPillViewModel).addReminder(context);
            ref.watch(providerPillViewModel).reset();
            await context.router.pop(const PillListRoute());
          }

          if (checkTextField) {
            addReminderToCache();
          }
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
