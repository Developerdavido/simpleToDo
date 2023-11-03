
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ToDo {
  num? id;
  String? item;
  String? uuid;
  String? description;
  DateTime? createdAt;
  bool? completed;


  ToDo({this.id, this.item, this.uuid, this.description, this.createdAt,
      this.completed});

  static List<ToDo> myToDos = [
    ToDo(
      id: 1,
      item: "Go to the market",
      uuid: Uuid().v4().toString(),
      description: "Buy ingredients necessary for the preparation of egusi stew",
      createdAt: DateTime.now(),
      completed: false
    ),
    ToDo(
        id: 2,
        item: "Buy a new laptop",
        uuid: Uuid().v4().toString(),
        description: "Buy a new laptop to help me with work",
        createdAt: DateTime.now(),
        completed: true
    ),
    ToDo(
        id: 3,
        item: "Go visit my uncle",
        uuid: Uuid().v4().toString(),
        description: "Go visit my uncle next two weeks",
        createdAt: DateTime.now(),
        completed: false
    )
  ];

  formatTheDate(DateTime date){
    var formattedDate = DateFormat("dd-MM-yyyy").format(date);
    return formattedDate;
  }

  ToDo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    item = json['item'];
    description = json['description'];
    createdAt = json['created_at'] ==  null ? null : DateTime.parse(json['created_at']);
    completed = json['completed'] == 1 ? true : false;
  }

  Map<String, dynamic> toJson(){
    return {
      'item': item,
      'uuid': uuid,
      'description': description,
      'created_at': createdAt!.toIso8601String(),
      'completed': completed == true ? 1 : 0
    };
  }
}