class TaskModel{
  int? id;
  String? title;
  String? description;
  bool? done;

  TaskModel({this.id, this.title, this.description, this.done});

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'done': done
  };

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    done: json['done']
  );
}