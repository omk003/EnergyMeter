// consumption_model.dart
import 'package:nineti/data/entity/consumption_entity.dart';

class ConsumptionModel extends Consumption {
  ConsumptionModel({required super.date, required super.value});

  factory ConsumptionModel.fromJson(Map<String, dynamic> json) {
    return ConsumptionModel(
      date: DateTime.parse(json['date']),
      value: json['value'],
    );
  }
}
