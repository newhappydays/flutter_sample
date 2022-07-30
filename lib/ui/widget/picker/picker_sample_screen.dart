import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/widget/component/dialog_open_button.dart';

class PickerSampleScreen extends StatelessWidget {
  const PickerSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picker Sample'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DialogOpenButton(
            openDialog: () => datePickerDialog(context),
            btnName: 'DatePicker Dialog',
          ),
          DialogOpenButton(
            openDialog: () => timePickerDialog(context),
            btnName: 'TimePicker Dialog',
          ),
          DialogOpenButton(
            openDialog: () => cupertinoDatePickerDialog(context),
            btnName: 'CupertinoDatePicker Dialog',
          ),
          DialogOpenButton(
            openDialog: () => cupertinoTimerPickerDialog(context),
            btnName: 'CupertinoTimerPicker Dialog',
          ),
        ],
      ),
    );
  }

  datePickerDialog(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022, 6, 22),
      lastDate: DateTime(2022, 8, 22),
    ).then((DateTime? value) => showSnackBar(context, '$value'));
  }

  timePickerDialog(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 22, minute: 10),
    );
  }

  cupertinoTimerPickerDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return SizedBox(
            height: 300.0,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    CupertinoButton(
                      child: const Text(
                        'Done',
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                CupertinoTimerPicker(
                  onTimerDurationChanged: (value) {
                    print('value = $value');
                  },
                ),
              ],
            ),
          );
        });
  }

  cupertinoDatePickerDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 300.0,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    CupertinoButton(
                      child: const Text(
                        'Done',
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                SizedBox(
                  height: 220.0,
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    maximumDate: DateTime(2022, 12, 31),
                    minimumYear: 2021,
                    maximumYear: 2022,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime value) {},
                  ),
                ),
              ],
            ),
          );
        });

  }

  showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}


