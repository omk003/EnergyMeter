// consumption_repository.dart
import 'package:nineti/domain/model/consumption_model.dart';

abstract class ConsumptionRepository {
  Future<List<ConsumptionModel>> fetchConsumption(String filter);
}
