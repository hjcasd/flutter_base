import 'package:flutter/material.dart';
import 'package:flutter_base/components/app_bar/simple_app_bar.dart';
import 'package:flutter_base/pages/setting/picker/custom_picker_model.dart';
import 'package:flutter_base/utils/log_helper.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class PickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        "Picker",
      ),
      body: MyPicker(),
    );
  }
}

class MyPicker extends StatefulWidget {
  const MyPicker({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyPickerState();
}

class _MyPickerState extends State<MyPicker> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          TextButton(
            onPressed: () {
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(2018, 3, 5),
                maxTime: DateTime(2019, 6, 7),
                theme: DatePickerTheme(
                  headerColor: Colors.orange,
                  backgroundColor: Colors.blue,
                  itemStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  doneStyle: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onChanged: (date) {
                  LogHelper.e('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                },
                onConfirm: (date) {
                  LogHelper.e('confirm $date');
                },
                currentTime: DateTime.now(),
                locale: LocaleType.en,
              );
            },
            child: Text(
              'show date picker(custom theme &date time range)',
              style: TextStyle(color: Colors.blue,),
            ),
          ),
          TextButton(
            onPressed: () {
              DatePicker.showTimePicker(
                context,
                showTitleActions: true,
                onChanged: (date) {
                  LogHelper.e('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                },
                onConfirm: (date) {
                  LogHelper.e('confirm $date');
                },
                currentTime: DateTime.now(),
              );
            },
            child: Text(
              'show time picker',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () {
              DatePicker.showTime12hPicker(
                context,
                showTitleActions: true,
                onChanged: (date) {
                  LogHelper.e('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                },
                onConfirm: (date) {
                  LogHelper.e('confirm $date');
                },
                currentTime: DateTime.now(),
              );
            },
            child: Text(
              'show 12H time picker with AM/PM',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () {
              DatePicker.showDateTimePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(2020, 5, 5, 20, 50),
                maxTime: DateTime(2020, 6, 7, 05, 09),
                onChanged: (date) {
                  LogHelper.e('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                },
                onConfirm: (date) {
                  LogHelper.e('confirm $date');
                },
                locale: LocaleType.zh,
              );
            },
            child: Text(
              'show date time picker (Chinese)',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () {
              DatePicker.showPicker(
                context,
                showTitleActions: true,
                onChanged: (date) {
                  LogHelper.e('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                },
                onConfirm: (date) {
                  LogHelper.e('confirm $date');
                },
                pickerModel: CustomPickerModel(currentTime: DateTime.now()),
                locale: LocaleType.en,
              );
            },
            child: Text(
              'show custom time picker,\nyou can custom picker model like this',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
