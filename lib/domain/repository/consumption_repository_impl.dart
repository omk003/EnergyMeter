// consumption_repository_impl.dart
import 'package:nineti/domain/model/consumption_model.dart';
import 'package:nineti/domain/repository/consumption_repository.dart';

class ConsumptionRepositoryImpl implements ConsumptionRepository {
  @override
  Future<List<ConsumptionModel>> fetchConsumption(String filter) async {
    // Fetch data from an API or local storage
    // For now, let's mock it
    return [
      ConsumptionModel(date: DateTime.now(), value: 21),
      ConsumptionModel(
          date: DateTime.now().subtract(const Duration(days: 1)), value: 28),
    ];
  }
}
