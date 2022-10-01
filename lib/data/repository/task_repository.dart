import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo_app_with_getx/data/api/api_cleint.dart';
import 'package:todo_app_with_getx/database/database.dart';
import 'package:todo_app_with_getx/model/task_model.dart';
import 'package:todo_app_with_getx/model/task_model_for_data_base.dart';
import 'package:todo_app_with_getx/utils/api_constants.dart';

class TaskRepository extends GetxService{

  final DataBaseHelper _dataBaseHelper = DataBaseHelper();


  final ApiClient apiClient;
  TaskRepository({required this.apiClient});

  Future<dynamic> getAllTask() async{
    var task = await apiClient.getTask(AppConstants.taskList);
    return task;
  }

  Future<dynamic> addTask(TaskModel taskModel) async {

    var body = jsonEncode({'title': taskModel.title, 'description': taskModel.description});

    var task = await apiClient.addTask(AppConstants.addTask, body);

    return task;
    // TaskForDataBaseModel taskForDataBaseModel = TaskForDataBaseModel();
    // taskForDataBaseModel.id = taskModel.id;
    // taskForDataBaseModel.title = taskModel.title;
    // taskForDataBaseModel.description = taskModel.description;
    // taskForDataBaseModel.done = taskModel.done.toString();
    //
    // await _dataBaseHelper.saveTaskToDataBase(taskForDataBaseModel);
    // if(response.statusCode == 200 || response.statusCode == 201){
    //   return "success";
    // }
    // var parsedJson = json.decode(response.body);
    // String message = parsedJson.values.elementAt(0);
    // return message;
  }

  Future<dynamic> editTask(TaskModel taskModel) async {

    var task = await apiClient.editTask(AppConstants.editTask, taskModel.id!, taskModel.done!);
    return task;

    // TaskForDataBaseModel taskForDataBaseModel = TaskForDataBaseModel();
    // taskForDataBaseModel.id = taskModel.id;
    // taskForDataBaseModel.title = taskModel.title;
    // taskForDataBaseModel.description = taskModel.description;
    // taskForDataBaseModel.done = taskModel.done.toString();
    //
    // await _dataBaseHelper.updateTaskStatus(taskForDataBaseModel);
    //
    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   return 'success';
    // }
    // var parsedJson = json.decode(response.body);
    // String message = parsedJson.values.elementAt(0);
    //
    // return message;
  }

  Future<dynamic> deleteTask(int id) async{

    var task = await apiClient.deleteTask(AppConstants.deleteTask, id);
    return task;
  }

  Future<List<TaskForDataBaseModel>> getAllTaskFromDataBase() async {
    return await _dataBaseHelper.getAllTasks();
  }

  Future<bool> saveTaskToDataBase(TaskForDataBaseModel taskForDataBaseModel) async {
    return await _dataBaseHelper.saveTaskToDataBase(taskForDataBaseModel);
  }

  Future updateTaskToDataBase(TaskForDataBaseModel taskForDataBaseModel) async {
    return await _dataBaseHelper.updateTaskStatus(taskForDataBaseModel);
  }

  Future<int> deleteTaskFromDataBase(int id) async {
    return await _dataBaseHelper.deleteTask(id);
  }
  // Future<String> addTask(TaskModel taskModel) async {
  //
  //   var body = jsonEncode({'title': taskModel.title, 'description': taskModel.description});
  //
  //   final response = await _apiBaseHelper.post("/api/Task/CreateTask/", body);
  //
  //   TaskForDataBaseModel taskForDataBaseModel = TaskForDataBaseModel();
  //   taskForDataBaseModel.id = taskModel.id;
  //   taskForDataBaseModel.title = taskModel.title;
  //   taskForDataBaseModel.description = taskModel.description;
  //   taskForDataBaseModel.done = taskModel.done.toString();
  //
  //   await _dataBaseHelper.saveTaskToDataBase(taskForDataBaseModel);
  //   if(response.statusCode == 200 || response.statusCode == 201){
  //     return "success";
  //   }
  //   var parsedJson = json.decode(response.body);
  //   String message = parsedJson.values.elementAt(0);
  //   return message;
  // }
  //
  // Future<String> editTask(TaskModel taskModel) async {
  //
  //   final response = await _apiBaseHelper.put("/api/Task/ChangeTaskStatus", taskModel.id! , taskModel.done!);
  //
  //   TaskForDataBaseModel taskForDataBaseModel = TaskForDataBaseModel();
  //   taskForDataBaseModel.id = taskModel.id;
  //   taskForDataBaseModel.title = taskModel.title;
  //   taskForDataBaseModel.description = taskModel.description;
  //   taskForDataBaseModel.done = taskModel.done.toString();
  //
  //   await _dataBaseHelper.updateTaskStatus(taskForDataBaseModel);
  //
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return 'success';
  //   }
  //   var parsedJson = json.decode(response.body);
  //   String message = parsedJson.values.elementAt(0);
  //
  //   return message;
  // }
  //
  // Future<String> deleteTask(int id) async{
  //   final response = await _apiBaseHelper.delete("/api/Task", id);
  //
  //   await _dataBaseHelper.deleteTask(id);
  //
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return 'success';
  //   }
  //   var parsedJson = json.decode(response.body);
  //   String message = parsedJson.values.elementAt(0);
  //
  //   return message;
  // }
  //
  // Future<List<TaskForDataBaseModel>> getAllTaskFromDataBase() async {
  //   return await _dataBaseHelper.getAllTasks();
  // }
  //
  // Future<bool> saveTaskToDataBase(TaskForDataBaseModel taskForDataBaseModel) async {
  //   return await _dataBaseHelper.saveTaskToDataBase(taskForDataBaseModel);
  // }
  //
  // Future updateTaskToDataBase(TaskForDataBaseModel taskForDataBaseModel) async {
  //   return await _dataBaseHelper.updateTaskStatus(taskForDataBaseModel);
  // }
  //
  // Future<int> deleteTaskFromDataBase(int id) async {
  //   return await _dataBaseHelper.deleteTask(id);
  // }
}