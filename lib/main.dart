import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/home_screen.dart';
import 'package:flutter_sample/ui/package/bloc/bloc_screen.dart';
import 'package:flutter_sample/ui/package/calendar/table_calendar_screen.dart';
import 'package:flutter_sample/ui/package/drift/drift_screen.dart';
import 'package:flutter_sample/ui/package/hive/hive_screen.dart';
import 'package:flutter_sample/ui/package/hive/model/hive_todo.dart';
import 'package:flutter_sample/ui/package/package_sample_screen.dart';
import 'package:flutter_sample/ui/package/provider/provider_screen.dart';
import 'package:flutter_sample/ui/package/provider/todo/edit/provider_todo_edit_screen.dart';
import 'package:flutter_sample/ui/util/routes.dart';
import 'package:flutter_sample/ui/widget/dialog/dialog_sample_screen.dart';
import 'package:flutter_sample/ui/widget/picker/picker_sample_screen.dart';
import 'package:flutter_sample/ui/widget/widget_sample_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting();

  await Hive.initFlutter();
  Hive.registerAdapter(HiveTodoAdapter());
  await Hive.openBox<HiveTodo>('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: HomeScreen(),
        initialRoute: RouteName.home,
        routes: {
          RouteName.home: (context) => const HomeScreen(),
          RouteName.widgetSampleMain : (context) => const WidgetSampleScreen(),
          RouteName.packageSampleMain : (context) => const PackageSampleScreen(),

          // package
          RouteName.tableCalendarMain: (context) => TableCalendarScreen(),
          RouteName.driftMain: (context) => DriftScreen(),
          RouteName.hiveMain: (context) => HiveScreen(),
          RouteName.blocMain: (context) => BlocScreen(),
          RouteName.providerMain: (context) => ProviderScreen(),
          RouteName.providerTodoEdit: (context) => ProviderTodoEditScreen(),

          // widget
          RouteName.dialogSampleMain: (context) => DialogSampleScreen(),
          RouteName.pickerSampleMain: (context) => PickerSampleScreen(),

        }
    );
  }
}
