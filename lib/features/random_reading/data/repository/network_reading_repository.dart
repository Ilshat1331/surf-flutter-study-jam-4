import 'package:injectable/injectable.dart';
import 'package:surf_practice_magic_ball/features/app/data/dio_container.dart';
import 'package:surf_practice_magic_ball/features/random_reading/domain/entities/random_reading_entity.dart';
import 'package:surf_practice_magic_ball/features/random_reading/domain/repository/reading_repository.dart';

@Injectable(as: IReadingRepository)
@prod
final class NetworkReadingRepository implements IReadingRepository {
  final DioContainer dioContainer;

  NetworkReadingRepository(this.dioContainer);

  @override
  Future<RandomReadingEntity> getRandomReading() async {
    try {
      final response = await dioContainer.dio.get('/api');
      return RandomReadingEntity.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
