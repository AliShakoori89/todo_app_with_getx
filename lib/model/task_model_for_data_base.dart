class TaskForDataBaseModel{
  int? id;
  String? title;
  String? description;
  String? done;

  TaskForDataBaseModel({this.id, this.title, this.description, this.done});

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'done': done
  };

  factory TaskForDataBaseModel.fromJson(Map<String, dynamic> json) => TaskForDataBaseModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      done: json['done']
  );
}