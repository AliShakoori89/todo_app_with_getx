import 'package:get/get.dart';
import 'package:todo_app_with_getx/controllers/task_controller_from_database.dart';
import 'package:todo_app_with_getx/controllers/task_controller_from_network.dart';
import 'package:todo_app_with_getx/data/api/api_cleint.dart';
import 'package:todo_app_with_getx/data/repository/task_repository.dart';

import '../utils/api_constants.dart';

Future<void> init() async{

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));


  //repos
  Get.lazyPut(() => TaskRepository(apiClient: Get.find()));


  //controllers
  Get.lazyPut(() => TaskControllerFromNetwork(taskRepository: Get.find()));

  Get.lazyPut(() => TaskControllerFromDataBase(taskRepository: Get.find()));

}