import 'package:hhu_sqflite/src/data/models/model.dart';

class ReadingModel extends Model {
  static String table = "readings";

  int? id;
  String customerName;
  String customerId;
  int deviceId;
  int? status;
  double? meterReading;
  String? readingDate;
  int? hasPhoto;
  String? fieldPhoto;

  // constructor
  ReadingModel({
    this.id,
    required this.customerName,
    required this.customerId,
    required this.deviceId,
    this.status,
    this.meterReading,
    this.hasPhoto,
    this.fieldPhoto,
  });

  static ReadingModel fromMap(Map<String, dynamic> json) {
    return ReadingModel(
      id: json['id'],
      customerName: json['customerName'],
      customerId: json['customerId'],
      deviceId: json['deviceId'],
      status: json['status'],
      meterReading: json['meterReading'],
      hasPhoto: json['hasPhoto'],
      fieldPhoto: json['fieldPhoto'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'customerName': customerName,
      'customerId': customerId,
      'deviceId': deviceId,
      'status': status,
      'meterReading': meterReading,
      'hasPhoto': hasPhoto,
      'fieldPhoto': fieldPhoto,
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
