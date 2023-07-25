import 'package:injectable/injectable.dart';
import 'package:surf_practice_magic_ball/features/random_reading/domain/entities/random_reading_entity.dart';
import 'package:surf_practice_magic_ball/features/random_reading/domain/repository/reading_repository.dart';

@Injectable(as: IReadingRepository)
@test
final class MockReadingRepository implements IReadingRepository {
  @override
  Future<RandomReadingEntity> getRandomReading() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const RandomReadingEntity(reading: 'Весьма сомнительно');
      },
    );
  }
}
