// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'random_reading_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RandomReadingEntity _$RandomReadingEntityFromJson(Map<String, dynamic> json) {
  return _RandomReadingEntity.fromJson(json);
}

/// @nodoc
mixin _$RandomReadingEntity {
  String get reading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RandomReadingEntityCopyWith<RandomReadingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RandomReadingEntityCopyWith<$Res> {
  factory $RandomReadingEntityCopyWith(
          RandomReadingEntity value, $Res Function(RandomReadingEntity) then) =
      _$RandomReadingEntityCopyWithImpl<$Res, RandomReadingEntity>;
  @useResult
  $Res call({String reading});
}

/// @nodoc
class _$RandomReadingEntityCopyWithImpl<$Res, $Val extends RandomReadingEntity>
    implements $RandomReadingEntityCopyWith<$Res> {
  _$RandomReadingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reading = null,
  }) {
    return _then(_value.copyWith(
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RandomReadingEntityCopyWith<$Res>
    implements $RandomReadingEntityCopyWith<$Res> {
  factory _$$_RandomReadingEntityCopyWith(_$_RandomReadingEntity value,
          $Res Function(_$_RandomReadingEntity) then) =
      __$$_RandomReadingEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reading});
}

/// @nodoc
class __$$_RandomReadingEntityCopyWithImpl<$Res>
    extends _$RandomReadingEntityCopyWithImpl<$Res, _$_RandomReadingEntity>
    implements _$$_RandomReadingEntityCopyWith<$Res> {
  __$$_RandomReadingEntityCopyWithImpl(_$_RandomReadingEntity _value,
      $Res Function(_$_RandomReadingEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reading = null,
  }) {
    return _then(_$_RandomReadingEntity(
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RandomReadingEntity implements _RandomReadingEntity {
  const _$_RandomReadingEntity({required this.reading});

  factory _$_RandomReadingEntity.fromJson(Map<String, dynamic> json) =>
      _$$_RandomReadingEntityFromJson(json);

  @override
  final String reading;

  @override
  String toString() {
    return 'RandomReadingEntity(reading: $reading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RandomReadingEntity &&
            (identical(other.reading, reading) || other.reading == reading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RandomReadingEntityCopyWith<_$_RandomReadingEntity> get copyWith =>
      __$$_RandomReadingEntityCopyWithImpl<_$_RandomReadingEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RandomReadingEntityToJson(
      this,
    );
  }
}

abstract class _RandomReadingEntity implements RandomReadingEntity {
  const factory _RandomReadingEntity({required final String reading}) =
      _$_RandomReadingEntity;

  factory _RandomReadingEntity.fromJson(Map<String, dynamic> json) =
      _$_RandomReadingEntity.fromJson;

  @override
  String get reading;
  @override
  @JsonKey(ignore: true)
  _$$_RandomReadingEntityCopyWith<_$_RandomReadingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
