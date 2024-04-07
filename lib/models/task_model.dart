
class TaskModel {
  String? title;
  String? description;
  bool? isComplete;

  TaskModel({this.title, this.description, this.isComplete});

  TaskModel.fromJson(Map<String, dynamic> json) {
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["isComplete"] is bool) {
      isComplete = json["isComplete"];
    }
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["description"] = description;
    _data["isComplete"] = isComplete;
    return _data;
  }
}