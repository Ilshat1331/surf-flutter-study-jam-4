// import 'dart:io';

// import 'package:surf_practice_magic_ball/features/random_reading/data/data_sources/remote/reading_api_service.dart';
// import 'package:surf_practice_magic_ball/features/random_reading/data/model/random_reading.dart';
// import 'package:surf_practice_magic_ball/features/random_reading/domain/repository/reading_repository.dart';

// final class ReadingRepositoryImpl implements IReadingRepository {
//   final ReadingApiService _api;

//   ReadingRepositoryImpl(this._api);

//   @override
//   Future<RandomReading> getRandomReading() async {
//     final response = await _api.getRandomReading();

//     try {
//       if (response.response.statusCode == HttpStatus.ok) {
//         return RandomReading.fromJson(response.data as Map<String, dynamic>);
//       }
//     } catch (e) {}
//   }
// }

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
