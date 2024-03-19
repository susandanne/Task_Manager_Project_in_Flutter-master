import '../../data/task_item.dart';

class liststatutusNew {
  String? status;
  List<taskData>? dataNewStatus;

  liststatutusNew({this.status, this.dataNewStatus});

  liststatutusNew.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      dataNewStatus = <taskData>[];
      json['data'].forEach((v) {
        dataNewStatus!.add(taskData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = status;
    if (dataNewStatus != null) {
      data['data'] = dataNewStatus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


