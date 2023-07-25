part of 'reading_cubit.dart';

sealed class ReadingState {}

final class ReadingStateInitial extends ReadingState {}

final class ReadingStateLoading extends ReadingState {}

final class ReadingStateError extends ReadingState {}

class ReadingStateDone extends ReadingState {
  ReadingStateDone({required this.reading});
  final RandomReadingEntity reading;
}
