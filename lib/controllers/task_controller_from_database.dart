import 'package:get/get.dart';
import 'package:todo_app_with_getx/model/task_model.dart';
import 'package:todo_app_with_getx/model/task_model_for_data_base.dart';

import '../data/repository/task_repository.dart';

class TaskControllerFromDataBase extends GetxController{
  final TaskRepository taskRepository;

  TaskControllerFromDataBase({required this.taskRepository});

  List<TaskForDataBaseModel> _taskList = [];
  List<TaskForDataBaseModel> get taskList => _taskList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<List<TaskForDataBaseModel>> getAllTaskFromDataBase() async {
    _taskList = await taskRepository.getAllTaskFromDataBase();
    _isLoaded = true;
    update();
    return _taskList;
  }

  Future<List<TaskForDataBaseModel>> addTaskToDataBase(TaskForDataBaseModel taskForDataBaseModel) async {
    await taskRepository.saveTaskToDataBase(taskForDataBaseModel);
    _taskList = await taskRepository.getAllTaskFromDataBase();
    _isLoaded = true;
    update();
    return _taskList;
  }

  Future<List<TaskForDataBaseModel>> editTaskInDataBase(TaskForDataBaseModel taskForDataBaseModel) async {
    await taskRepository.updateTaskToDataBase(taskForDataBaseModel);
    _taskList = await taskRepository.getAllTaskFromDataBase();
    _isLoaded = true;
    update();
    return _taskList;

  }

  Future<List<TaskForDataBaseModel>> deleteTaskFromDataBase(int id) async {
    await taskRepository.deleteTaskFromDataBase(id);
    _taskList = await taskRepository.getAllTaskFromDataBase();
    _isLoaded = true;
    update();
    return _taskList;
  }
}