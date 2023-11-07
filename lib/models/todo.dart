
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ToDo extends Equatable{
  String? item;
  String? uuid;
  String? description;
  DateTime? createdAt;
  bool? completed;
  bool? deleted;


  ToDo({this.item, this.uuid, this.description, this.createdAt,
      this.completed, this.deleted}){
    completed = completed ?? false;
    deleted = deleted ?? false;
  }


  formatTheDate(DateTime date){
    var formattedDate = DateFormat("dd-MM-yyyy").format(date);
    return formattedDate;
  }

  ToDo copyWith({
    String? item,
    String? uuid,
    String? description,
    DateTime? createdAt,
    bool? completed,
    bool? deleted,
}) {
    return ToDo(
      item: item ?? this.item,
      uuid: uuid ?? this.uuid,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      createdAt: createdAt ?? this.createdAt,
      deleted: deleted ?? this.deleted
    );
  }

  ToDo.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    item = json['item'];
    description = json['description'];
    createdAt = json['created_at'] ==  null ? null : DateTime.parse(json['created_at']);
    completed = json['completed'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson(){
    return {
      'item': item,
      'uuid': uuid,
      'description': description,
      'created_at': createdAt!.toIso8601String(),
      'completed': completed,
      'deleted': deleted,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    item, description, createdAt, completed, deleted, uuid
  ];
}