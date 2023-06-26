class MainModel {
  Map data;

  MainModel({required this.data});

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      data: json,
    );
  }
}

class Membermodel {
  Map member;

  Membermodel({required this.member});

  factory Membermodel.fromJson(Map<String, dynamic> json) {
    return Membermodel(
      member: json,
    );
  }
}
