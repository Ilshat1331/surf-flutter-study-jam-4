import 'package:freezed_annotation/freezed_annotation.dart';

part 'random_reading_entity.freezed.dart';
part 'random_reading_entity.g.dart';

@freezed
class RandomReadingEntity with _$RandomReadingEntity {
  const factory RandomReadingEntity({
    required String reading,
  }) = _RandomReadingEntity;

  factory RandomReadingEntity.fromJson(Map<String, Object?> json) =>
      _$RandomReadingEntityFromJson(json);
}
