// consumption_view_model.dart
import 'package:flutter/material.dart';
import 'package:nineti/data/entity/consumption_entity.dart';
import 'package:nineti/data/repository/consumption_use_case.dart';

class ConsumptionViewModel extends ChangeNotifier {
  final ConsumptionUseCase useCase;

  List<Consumption> consumptions = [];
  int totalConsumption = 0;

  ConsumptionViewModel({required this.useCase});

  void fetchConsumption(String filter) async {
    consumptions = await useCase.getConsumption(filter: filter);
    totalConsumption = consumptions.fold(0, (sum, item) => sum + item.value);
    notifyListeners();
  }
}
