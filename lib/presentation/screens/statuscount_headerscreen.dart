class statusCountDataHeader {
  String? status;
  List<DataCountHeader>? dataTaskCounter;

  statusCountDataHeader({this.status, this.dataTaskCounter});

  statusCountDataHeader.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      dataTaskCounter = <DataCountHeader>[];
      json['data'].forEach((v) {
        dataTaskCounter!.add( DataCountHeader.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (dataTaskCounter != null) {
      data['data'] = dataTaskCounter!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataCountHeader {
  String? sId;
  int? sum;

  DataCountHeader({this.sId, this.sum});

  DataCountHeader.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['_id'] = sId;
    data['sum'] = sum;
    return data;
  }
}
