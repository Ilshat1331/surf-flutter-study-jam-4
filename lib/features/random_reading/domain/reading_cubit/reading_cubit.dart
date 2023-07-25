import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:surf_practice_magic_ball/features/random_reading/domain/entities/random_reading_entity.dart';
import 'package:surf_practice_magic_ball/features/random_reading/domain/repository/reading_repository.dart';

part 'reading_state.dart';

@Singleton()
@test
@prod
class ReadingCubit extends Cubit<ReadingState> {
  ReadingCubit(this.repository) : super(ReadingStateInitial());
  final IReadingRepository repository;

  Future<void> getRandomReading() async {
    emit(ReadingStateLoading());
    try {
      final RandomReadingEntity reading = await repository.getRandomReading();
      emit(ReadingStateDone(reading: reading));
    } catch (e) {
      emit(ReadingStateError());
      rethrow;
    }
  }
}
