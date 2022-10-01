import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_app_with_getx/component/add_floating_action_button.dart';
import 'package:todo_app_with_getx/controllers/task_controller_from_network.dart';
import 'package:todo_app_with_getx/routes/route_he;per.dart';
import 'package:todo_app_with_getx/utils/dimensions.dart';

class AllTaskFromNetPage extends StatefulWidget {
  const AllTaskFromNetPage({Key? key}) : super(key: key);

  @override
  State<AllTaskFromNetPage> createState() => _AllTaskFromNetPageState();
}

class _AllTaskFromNetPageState extends State<AllTaskFromNetPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<TaskControllerFromNetwork>().getAllTaskFromNetwork();
  }

  bool? isChecked;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: const MyFloatingActionButton(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            left: Dimensions.paddingWith_20,
            right: Dimensions.paddingWith_20,
            top: Dimensions.paddingHeight_30
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pageTitle(),
            SizedBox(
              height: Dimensions.paddingHeight_20,
            ),
            tasksCard()
          ],
        ),
        )
      ),
    );
  }

  Expanded tasksCard() {

    return Expanded(
            child: GetBuilder<TaskControllerFromNetwork>(builder: (allTask){

              return  allTask.isLoaded
              ? ListView.builder(
                shrinkWrap: true,
                itemCount: allTask.taskList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: Dimensions.paddingHeight_10),
                    child: Slidable(
                      key: const ValueKey(0),
                      endActionPane: ActionPane(
                        extentRatio: 0.2,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) =>
                                showDialog<String>(
                                  context: context,
                                  builder: (context) =>
                                      AlertDialog(
                                        title: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Icon(Icons.delete,
                                              color: Colors.red,
                                              size: Dimensions.iconMiddleSize,
                                            ),
                                            SizedBox(height: Dimensions
                                                .paddingHeight_40,),
                                            const Text('Are You Sure?!',
                                                textAlign: TextAlign.center),
                                          ],
                                        ),
                                        actionsAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Get.find<TaskControllerFromNetwork>().deleteTaskToServer(allTask.taskList[index]);
                                              Navigator.pop(context, 'Delete');
                                              Get.find<TaskControllerFromNetwork>().getAllTaskFromNetwork();
                                              Get.toNamed(RouteHelper.allTaskFromNetPage);
                                            },
                                            child: const Text('Delete',
                                              style: TextStyle(
                                                  color: Colors.red),),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(
                                                    context, 'Cancel'),
                                            child: const Text('Cancel',
                                              style: TextStyle(
                                                  color: Colors.black),),
                                          ),
                                        ],
                                      ),
                                ),
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getReadTaskFromNet(),
                              arguments: {
                                'task': allTask.taskList[index],
                                'isChecked': allTask.taskList[index].done
                              });
                        },
                        child: Container(
                          width: double.infinity,
                          height: Dimensions.paddingHeight_40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.smallRadius),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.paddingWith_10,
                                right: Dimensions.paddingWith_10),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${allTask.taskList[index].title}'),
                                Checkbox(
                                  fillColor:
                                  MaterialStateProperty.resolveWith(
                                      getColor),
                                  checkColor: Colors.white,
                                  value: allTask.taskList[index].done,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                      allTask.taskList[index].done = isChecked;
                                      Get.find<TaskControllerFromNetwork>().editTaskToServer(
                                          allTask.taskList[index]
                                      );
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              )
                  : Center(child: CircularProgressIndicator());
            }));
  }
  Text pageTitle() {
    return Text(
            "All Tasks",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: Dimensions.fontSmallSize),
          );
  }
}