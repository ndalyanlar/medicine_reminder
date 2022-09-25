import 'package:flutter/material.dart';
import '../../util/style/utils.dart';
import '../provider/pill_model_view.dart';

class TimeList extends StatefulWidget {
  const TimeList({
    Key? key,
    required this.providerPill,
  }) : super(key: key);

  final PillModelView providerPill;

  @override
  State<TimeList> createState() => _TimeListState();
}

class _TimeListState extends State<TimeList> {
  @override
  void didUpdateWidget(covariant TimeList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.providerPill.selectedTime24Hour !=
        widget.providerPill.selectedTime24Hour) {
      widget.providerPill.selectedTime24Hour =
          oldWidget.providerPill.selectedTime24Hour;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.providerPill.timeTextFieldList.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0 &&
            widget.providerPill.isVisibleTimeTextFieldList.contains(false)) {
          return Row(
            children: [
              Expanded(child: widget.providerPill.timeTextFieldList[index]),
              IconButton(
                  onPressed: () {
                    for (var isVisible
                        in widget.providerPill.isVisibleTimeTextFieldList) {
                      if (!isVisible) {
                        setState(() {
                          widget.providerPill.isVisibleTimeTextFieldList[widget
                              .providerPill.isVisibleTimeTextFieldList
                              .indexOf(isVisible)] = true;
                        });
                        break;
                      }
                    }
                  },
                  icon: Icon(
                    Icons.add,
                    color: AppColor.instance.orange,
                  ))
            ],
          );
        }

        return Row(children: [
          if (widget.providerPill.isVisibleTimeTextFieldList[index]) ...[
            Expanded(child: widget.providerPill.timeTextFieldList[index]),
            IconButton(
                onPressed: () {
                  for (var isVisible
                      in widget.providerPill.isVisibleTimeTextFieldList) {
                    if (isVisible) {
                      setState(() {
                        widget.providerPill.isVisibleTimeTextFieldList[index] =
                            false;
                      });
                      break;
                    }
                  }
                },
                icon: Icon(
                  Icons.delete,
                  color: AppColor.instance.red,
                ))
          ],
        ]);
      },
    );
  }
}
