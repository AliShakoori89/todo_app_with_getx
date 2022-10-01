import 'package:flutter/material.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';
import 'package:get/get.dart';
import 'package:todo_app_with_getx/controllers/task_controller_from_database.dart';
import 'package:todo_app_with_getx/controllers/task_controller_from_network.dart';
import 'package:todo_app_with_getx/view/from_data_base/all_task_from_data_base_page.dart';
import 'routes/route_he;per.dart';
import 'view/from_net/all_task_from_net_page.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  _loadResource() async{
    await Get.find<TaskControllerFromNetwork>().getAllTaskFromNetwork();
    await Get.find<TaskControllerFromDataBase>().getAllTaskFromDataBase();
  }
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadResource();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskControllerFromNetwork>(builder: (_){
      return InternetWidget(
        online: GetBuilder<TaskControllerFromDataBase>(builder: (_){
          print("online");
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
          defaultTransition: Transition.fade,
          getPages: RouteHelper.routes,
          initialRoute: RouteHelper.initial,
          home: const AllTaskFromNetPage(),
        );}),
        offline: GetBuilder<TaskControllerFromDataBase>(builder: (_){
          print("offline");
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.fade,
            getPages: RouteHelper.routes,
            initialRoute: RouteHelper.initial,
            home: const AllTaskFromDataBasePage(),
          );
        },),
      );
    });
  }
}