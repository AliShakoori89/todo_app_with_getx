import 'package:get/get.dart';
import 'package:todo_app_with_getx/view/from_data_base/all_task_from_data_base_page.dart';
import 'package:todo_app_with_getx/view/from_data_base/read_task_from_data_base_page.dart';
import 'package:todo_app_with_getx/view/from_net/all_task_from_net_page.dart';
import 'package:todo_app_with_getx/view/from_net/read_task_from_net_page.dart';

class RouteHelper{

  static const String initial = "/";
  static const String allTaskFromNetPage = "/allTaskFromNetPage";
  static const String readTaskFromNetPage = "/readTaskFromNetPage";

  static const String allTaskFromDataBasePage = "/allTaskFromDataBasePage";
  static const String readTaskFromDataBasePage = "/readTaskFromDataBasePage";

  static String getAllTakFromNet() => allTaskFromNetPage;
  static String getReadTaskFromNet() => readTaskFromNetPage;

  static String getAllTaskFromDataBase() => allTaskFromDataBasePage;
  static String getReadTaskFromDataBase() => readTaskFromDataBasePage;

  static List<GetPage> get routes => [

    GetPage(name: initial , page: ()=> const AllTaskFromNetPage(),
        transition:  Transition.fadeIn),

    GetPage(name: readTaskFromNetPage, page: (){
      var task = Get.arguments['task'];
      var isChecked = Get.arguments['isChecked'];
      return ReadTaskFromNetPage(
          task: task, isChecked: isChecked == "false" ? false : true);
    },),

    GetPage(name: initial , page: ()=> const AllTaskFromDataBasePage(),
        transition:  Transition.fadeIn),

    GetPage(name: readTaskFromDataBasePage, page: (){
      var task = Get.arguments['task'];
      var isChecked = Get.arguments['isChecked'];
      return ReadTaskFromDataBasePage(
          task: task,
          isChecked: isChecked);
    },),
  ];
}