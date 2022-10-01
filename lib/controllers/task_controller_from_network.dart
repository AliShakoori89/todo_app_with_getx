import 'dart:convert';
import 'package:get/get.dart';
import 'package:todo_app_with_getx/model/task_model.dart';
import '../data/repository/task_repository.dart';

class TaskControllerFromNetwork extends GetxController{
  final TaskRepository taskRepository;

  TaskControllerFromNetwork({required this.taskRepository});

  List<TaskModel> _taskList = [];
  List<TaskModel> get taskList => _taskList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getAllTaskFromNetwork() async {
    final response = await taskRepository.getAllTask();
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      _taskList = List<TaskModel>.from(l.map((model)=> TaskModel.fromJson(model)));
      _isLoaded = true;
      update();
    } else {}
  }

  Future<void> addTaskToServer(TaskModel taskModel) async {
    final response = await taskRepository.addTask(taskModel);
    if (response.statusCode == 200) {
      _isLoaded = true;
      update();
    } else {}
  }

  Future<void> editTaskToServer(TaskModel taskModel) async {
    final response = await taskRepository.editTask(taskModel);
    if (response.statusCode == 200) {
      _isLoaded = true;
      update();
    } else {}
  }

  Future<void> deleteTaskToServer(TaskModel taskModel) async {
    final response = await taskRepository.deleteTask(taskModel.id!);
    print("response.statusCode   "+response.statusCode.toString());
    if (response.statusCode == 200) {
      _isLoaded = true;
      update();
    } else {
      update();
    }
  }
}