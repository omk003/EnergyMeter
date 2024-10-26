import 'package:nineti/data/entity/consumption_entity.dart';
import 'package:nineti/data/repository/consumption_use_case.dart';
import 'package:nineti/domain/repository/consumption_repository.dart';

class ConsumptionUseCaseImpl implements ConsumptionUseCase {
  final ConsumptionRepository repository;

  ConsumptionUseCaseImpl(this.repository);

  @override
  Future<List<Consumption>> getConsumption({required String filter}) {
    return repository.fetchConsumption(filter);
  }
}
