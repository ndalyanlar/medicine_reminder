import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medicine_reminder/extension/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routing/route.gr.dart';
import '../../util/style/utils.dart';
import '../constant/share_preferences.dart';
import '../model/medicine.dart';
import '../provider/pill_model_view.dart';
import '../widget/card_medicine_reminder.dart';

class PillListPage extends StatefulWidget {
  const PillListPage({Key? key}) : super(key: key);

  @override
  State<PillListPage> createState() => _PillListPageState();
}

class _PillListPageState extends State<PillListPage>
    with TickerProviderStateMixin {
  double opacityLevel = 1.0;

  Future<bool?> _showConfirmationDialog(
      BuildContext context, String action, int index) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Uyarı'),
        content: Text('$action ?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Hayır'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Evet'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.instance.lightPrimaryColor,
      appBar: AppBar(
        // backgroundColor: AppColor.instance.lightPrimaryColor,
        title: const Text(
          "İlaç Hatırlatıcısı",
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: context.getDynamicWidth(),
          child: Consumer(
            builder: (context, ref, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 0),
                    width: context.getDynamicWidth(0.84),
                    height: context.getDynamicHeight(0.8),
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: AnimatedOpacity(
                        duration: const Duration(seconds: 2),
                        opacity: opacityLevel,
                        child: _buildFutureBuilder(ref)),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  Widget _buildFutureBuilder(WidgetRef ref) {
    return FutureBuilder<List<Medicine>?>(
      future: ref.watch<PillModelView>(providerPillViewModel).fetchAllDatas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<Medicine> medicineList = snapshot.data ?? [];

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 8.0,
            ),
            child: Stack(
              children: [
                if (snapshot.data != null) _buildListView(medicineList),
                Positioned(
                  bottom: 30,
                  right: 8,
                  child: FloatingActionButton(
                    backgroundColor: AppColor.instance.orange,
                    onPressed: () {
                      context.navigateTo(const AddPillRoute());
                    },
                    child: const Icon(Icons.add),
                  ),
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildListView(List<Medicine> medicineList) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: medicineList.length,
      itemBuilder: (BuildContext context, int index) {
        if (medicineList.length == index) {
          return SizedBox(height: MediaQuery.of(context).padding.bottom + 80);
        }

        return Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.2,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                flex: 1,
                onPressed: (context) async {
                  await _showConfirmationDialog(context, "Sil", index)
                      .then((value) async {
                    await _buildActionConfirmDelete(value, medicineList, index);
                  });
                },
                backgroundColor: AppColor.instance.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Sil',
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              context
                  .navigateTo(UpdatePillRoute(medicine: medicineList[index]));
            },
            child:
                CardMedicineReminder(medicineList: medicineList, index: index),
          ),
        );
      },
    );
  }

  Future<void> _buildActionConfirmDelete(
      bool? value, List<Medicine> medicineList, int index) async {
    {
      if (value!) {
        List<String> oldList;

        SharedPreferences preferences = await SharedPreferences.getInstance();

        await preferences.remove(medicineList[index].medicineName);

        oldList = preferences
            .getStringList(ConstantSharedPreferences.keyPillNameList)!;

        oldList.remove(medicineList[index].medicineName);

        await preferences.setStringList(
            ConstantSharedPreferences.keyPillNameList, oldList);

        setState(() {});
      }
    }
  }
}
