class RouteName {
  static const home = "/";
  static const widgetSampleMain = "/widget_sample_screen";
  static const packageSampleMain = "/package_sample_screen";

  // widget
  static const dialogSampleMain = "/dialog_sample_screen";
  static const pickerSampleMain = "/picker_sample_screen";

  // package
  static const tableCalendarMain = "/table_calendar_main_screen";
  static const driftMain = "/drift_screen";
  static const hiveMain = "/hive_screen";
  static const blocMain = "/bloc_screen";
  static const providerMain = "/provider_screen";
  static const dioMain = "/dio_screen";

  // package - provider
  static const providerSampleList = "/provider_sample_list";
  static const providerCounterScreen = "/provider_counter_screen";
  static const providerTodoScreen = "/provider_todo_screen";
  static const providerTodoEdit = "/provider_todo_edit_screen";

  // package - bloc

  // static const sampleMain = "/";



}

class RouteInfo {
  final String routeTitle;
  final String routeName;

  RouteInfo({
    required this.routeTitle,
    required this.routeName,
  });
}

final List<RouteInfo> appRoutes = [
  RouteInfo(routeTitle: 'Widget', routeName: RouteName.widgetSampleMain),
  RouteInfo(routeTitle: 'Package', routeName: RouteName.packageSampleMain),
];

final List<RouteInfo> packageRoutes = [
  RouteInfo(routeTitle: 'TableCalendar', routeName: RouteName.tableCalendarMain),
  RouteInfo(routeTitle: 'Drift', routeName: RouteName.driftMain),
  RouteInfo(routeTitle: 'Hive', routeName: RouteName.hiveMain),
  RouteInfo(routeTitle: 'Bloc', routeName: RouteName.blocMain),
  RouteInfo(routeTitle: 'Provider', routeName: RouteName.providerMain),
  RouteInfo(routeTitle: 'Dio', routeName: RouteName.dioMain),
];

final List<RouteInfo> widgetRoutes = [
  RouteInfo(routeTitle: 'Dialog', routeName: RouteName.dialogSampleMain),
  RouteInfo(routeTitle: 'Picker', routeName: RouteName.pickerSampleMain),
];

final List<RouteInfo> providerRoutes = [
  RouteInfo(routeTitle: 'CounterApp', routeName: RouteName.providerCounterScreen),
  RouteInfo(routeTitle: 'TodoApp', routeName: RouteName.providerTodoScreen)
];

final List<RouteInfo> sampleRoutes = [];
