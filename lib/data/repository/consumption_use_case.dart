// consumption_use_case.dart
import 'package:nineti/data/entity/consumption_entity.dart';

abstract class ConsumptionUseCase {
  Future<List<Consumption>> getConsumption({required String filter});
}
