// AUTO GENERATED BY JNIGEN 0.14.2. DO NOT EDIT!

// ignore_for_file: annotate_overrides
// ignore_for_file: argument_type_not_assignable
// ignore_for_file: camel_case_extensions
// ignore_for_file: camel_case_types
// ignore_for_file: constant_identifier_names
// ignore_for_file: doc_directive_unknown
// ignore_for_file: file_names
// ignore_for_file: inference_failure_on_untyped_parameter
// ignore_for_file: invalid_internal_annotation
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: library_prefixes
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: no_leading_underscores_for_library_prefixes
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: only_throw_errors
// ignore_for_file: overridden_fields
// ignore_for_file: prefer_double_quotes
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unnecessary_cast
// ignore_for_file: unnecessary_non_null_assertion
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: use_super_parameters

import 'dart:core' show Object, String, bool, double, int;
import 'dart:core' as core$_;

import 'package:jni/_internal.dart' as jni$_;
import 'package:jni/jni.dart' as jni$_;

import '../../../../../java/time/Instant.dart' as instant$_;

/// from: `androidx.health.connect.client.time.TimeRangeFilter$Companion`
class TimeRangeFilter$Companion extends jni$_.JObject {
  @jni$_.internal
  @core$_.override
  final jni$_.JObjType<TimeRangeFilter$Companion> $type;

  @jni$_.internal
  TimeRangeFilter$Companion.fromReference(
    jni$_.JReference reference,
  )   : $type = type,
        super.fromReference(reference);

  static final _class = jni$_.JClass.forName(
      r'androidx/health/connect/client/time/TimeRangeFilter$Companion');

  /// The type which includes information such as the signature of this class.
  static const nullableType = $TimeRangeFilter$Companion$NullableType();
  static const type = $TimeRangeFilter$Companion$Type();
  static final _id_between = _class.instanceMethodId(
    r'between',
    r'(Ljava/time/Instant;Ljava/time/Instant;)Landroidx/health/connect/client/time/TimeRangeFilter;',
  );

  static final _between = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                  jni$_.Pointer<jni$_.Void>,
                  jni$_.JMethodIDPtr,
                  jni$_.VarArgs<
                      (
                        jni$_.Pointer<jni$_.Void>,
                        jni$_.Pointer<jni$_.Void>
                      )>)>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni$_.JniResult Function(
              jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr,
              jni$_.Pointer<jni$_.Void>,
              jni$_.Pointer<jni$_.Void>)>();

  /// from: `public final androidx.health.connect.client.time.TimeRangeFilter between(java.time.Instant instant, java.time.Instant instant1)`
  /// The returned object must be released after use, by calling the [release] method.
  TimeRangeFilter between(
    instant$_.Instant instant,
    instant$_.Instant instant1,
  ) {
    final _$instant = instant.reference;
    final _$instant1 = instant1.reference;
    return _between(reference.pointer, _id_between as jni$_.JMethodIDPtr,
            _$instant.pointer, _$instant1.pointer)
        .object<TimeRangeFilter>(const $TimeRangeFilter$Type());
  }

  static final _id_between$1 = _class.instanceMethodId(
    r'between',
    r'(Ljava/time/LocalDateTime;Ljava/time/LocalDateTime;)Landroidx/health/connect/client/time/TimeRangeFilter;',
  );

  static final _between$1 = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                  jni$_.Pointer<jni$_.Void>,
                  jni$_.JMethodIDPtr,
                  jni$_.VarArgs<
                      (
                        jni$_.Pointer<jni$_.Void>,
                        jni$_.Pointer<jni$_.Void>
                      )>)>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni$_.JniResult Function(
              jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr,
              jni$_.Pointer<jni$_.Void>,
              jni$_.Pointer<jni$_.Void>)>();

  /// from: `public final androidx.health.connect.client.time.TimeRangeFilter between(java.time.LocalDateTime localDateTime, java.time.LocalDateTime localDateTime1)`
  /// The returned object must be released after use, by calling the [release] method.
  TimeRangeFilter between$1(
    jni$_.JObject localDateTime,
    jni$_.JObject localDateTime1,
  ) {
    final _$localDateTime = localDateTime.reference;
    final _$localDateTime1 = localDateTime1.reference;
    return _between$1(reference.pointer, _id_between$1 as jni$_.JMethodIDPtr,
            _$localDateTime.pointer, _$localDateTime1.pointer)
        .object<TimeRangeFilter>(const $TimeRangeFilter$Type());
  }

  static final _id_before = _class.instanceMethodId(
    r'before',
    r'(Ljava/time/Instant;)Landroidx/health/connect/client/time/TimeRangeFilter;',
  );

  static final _before = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_.VarArgs<(jni$_.Pointer<jni$_.Void>,)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>)>();

  /// from: `public final androidx.health.connect.client.time.TimeRangeFilter before(java.time.Instant instant)`
  /// The returned object must be released after use, by calling the [release] method.
  TimeRangeFilter before(
    instant$_.Instant instant,
  ) {
    final _$instant = instant.reference;
    return _before(reference.pointer, _id_before as jni$_.JMethodIDPtr,
            _$instant.pointer)
        .object<TimeRangeFilter>(const $TimeRangeFilter$Type());
  }

  static final _id_before$1 = _class.instanceMethodId(
    r'before',
    r'(Ljava/time/LocalDateTime;)Landroidx/health/connect/client/time/TimeRangeFilter;',
  );

  static final _before$1 = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_.VarArgs<(jni$_.Pointer<jni$_.Void>,)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>)>();

  /// from: `public final androidx.health.connect.client.time.TimeRangeFilter before(java.time.LocalDateTime localDateTime)`
  /// The returned object must be released after use, by calling the [release] method.
  TimeRangeFilter before$1(
    jni$_.JObject localDateTime,
  ) {
    final _$localDateTime = localDateTime.reference;
    return _before$1(reference.pointer, _id_before$1 as jni$_.JMethodIDPtr,
            _$localDateTime.pointer)
        .object<TimeRangeFilter>(const $TimeRangeFilter$Type());
  }

  static final _id_after = _class.instanceMethodId(
    r'after',
    r'(Ljava/time/Instant;)Landroidx/health/connect/client/time/TimeRangeFilter;',
  );

  static final _after = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_.VarArgs<(jni$_.Pointer<jni$_.Void>,)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>)>();

  /// from: `public final androidx.health.connect.client.time.TimeRangeFilter after(java.time.Instant instant)`
  /// The returned object must be released after use, by calling the [release] method.
  TimeRangeFilter after(
    instant$_.Instant instant,
  ) {
    final _$instant = instant.reference;
    return _after(reference.pointer, _id_after as jni$_.JMethodIDPtr,
            _$instant.pointer)
        .object<TimeRangeFilter>(const $TimeRangeFilter$Type());
  }

  static final _id_after$1 = _class.instanceMethodId(
    r'after',
    r'(Ljava/time/LocalDateTime;)Landroidx/health/connect/client/time/TimeRangeFilter;',
  );

  static final _after$1 = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_.VarArgs<(jni$_.Pointer<jni$_.Void>,)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>)>();

  /// from: `public final androidx.health.connect.client.time.TimeRangeFilter after(java.time.LocalDateTime localDateTime)`
  /// The returned object must be released after use, by calling the [release] method.
  TimeRangeFilter after$1(
    jni$_.JObject localDateTime,
  ) {
    final _$localDateTime = localDateTime.reference;
    return _after$1(reference.pointer, _id_after$1 as jni$_.JMethodIDPtr,
            _$localDateTime.pointer)
        .object<TimeRangeFilter>(const $TimeRangeFilter$Type());
  }

  static final _id_new$ = _class.constructorId(
    r'(Lkotlin/jvm/internal/DefaultConstructorMarker;)V',
  );

  static final _new$ = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_.VarArgs<(jni$_.Pointer<jni$_.Void>,)>)>>(
          'globalEnv_NewObject')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>)>();

  /// from: `synthetic public void <init>(kotlin.jvm.internal.DefaultConstructorMarker defaultConstructorMarker)`
  /// The returned object must be released after use, by calling the [release] method.
  factory TimeRangeFilter$Companion(
    jni$_.JObject? defaultConstructorMarker,
  ) {
    final _$defaultConstructorMarker =
        defaultConstructorMarker?.reference ?? jni$_.jNullReference;
    return TimeRangeFilter$Companion.fromReference(_new$(
            _class.reference.pointer,
            _id_new$ as jni$_.JMethodIDPtr,
            _$defaultConstructorMarker.pointer)
        .reference);
  }
}

final class $TimeRangeFilter$Companion$NullableType
    extends jni$_.JObjType<TimeRangeFilter$Companion?> {
  @jni$_.internal
  const $TimeRangeFilter$Companion$NullableType();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Landroidx/health/connect/client/time/TimeRangeFilter$Companion;';

  @jni$_.internal
  @core$_.override
  TimeRangeFilter$Companion? fromReference(jni$_.JReference reference) =>
      reference.isNull
          ? null
          : TimeRangeFilter$Companion.fromReference(
              reference,
            );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<TimeRangeFilter$Companion?> get nullableType => this;

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($TimeRangeFilter$Companion$NullableType).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($TimeRangeFilter$Companion$NullableType) &&
        other is $TimeRangeFilter$Companion$NullableType;
  }
}

final class $TimeRangeFilter$Companion$Type
    extends jni$_.JObjType<TimeRangeFilter$Companion> {
  @jni$_.internal
  const $TimeRangeFilter$Companion$Type();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Landroidx/health/connect/client/time/TimeRangeFilter$Companion;';

  @jni$_.internal
  @core$_.override
  TimeRangeFilter$Companion fromReference(jni$_.JReference reference) =>
      TimeRangeFilter$Companion.fromReference(
        reference,
      );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<TimeRangeFilter$Companion?> get nullableType =>
      const $TimeRangeFilter$Companion$NullableType();

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($TimeRangeFilter$Companion$Type).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($TimeRangeFilter$Companion$Type) &&
        other is $TimeRangeFilter$Companion$Type;
  }
}

/// from: `androidx.health.connect.client.time.TimeRangeFilter`
class TimeRangeFilter extends jni$_.JObject {
  @jni$_.internal
  @core$_.override
  final jni$_.JObjType<TimeRangeFilter> $type;

  @jni$_.internal
  TimeRangeFilter.fromReference(
    jni$_.JReference reference,
  )   : $type = type,
        super.fromReference(reference);

  static final _class = jni$_.JClass.forName(
      r'androidx/health/connect/client/time/TimeRangeFilter');

  /// The type which includes information such as the signature of this class.
  static const nullableType = $TimeRangeFilter$NullableType();
  static const type = $TimeRangeFilter$Type();
  static final _id_Companion = _class.staticFieldId(
    r'Companion',
    r'Landroidx/health/connect/client/time/TimeRangeFilter$Companion;',
  );

  /// from: `static public final androidx.health.connect.client.time.TimeRangeFilter$Companion Companion`
  /// The returned object must be released after use, by calling the [release] method.
  static TimeRangeFilter$Companion get Companion =>
      _id_Companion.get(_class, const $TimeRangeFilter$Companion$Type());

  static final _id_new$ = _class.constructorId(
    r'(Ljava/time/Instant;Ljava/time/Instant;Ljava/time/LocalDateTime;Ljava/time/LocalDateTime;)V',
  );

  static final _new$ = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                  jni$_.Pointer<jni$_.Void>,
                  jni$_.JMethodIDPtr,
                  jni$_.VarArgs<
                      (
                        jni$_.Pointer<jni$_.Void>,
                        jni$_.Pointer<jni$_.Void>,
                        jni$_.Pointer<jni$_.Void>,
                        jni$_.Pointer<jni$_.Void>
                      )>)>>('globalEnv_NewObject')
      .asFunction<
          jni$_.JniResult Function(
              jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr,
              jni$_.Pointer<jni$_.Void>,
              jni$_.Pointer<jni$_.Void>,
              jni$_.Pointer<jni$_.Void>,
              jni$_.Pointer<jni$_.Void>)>();

  /// from: `public void <init>(java.time.Instant instant, java.time.Instant instant1, java.time.LocalDateTime localDateTime, java.time.LocalDateTime localDateTime1)`
  /// The returned object must be released after use, by calling the [release] method.
  factory TimeRangeFilter(
    instant$_.Instant? instant,
    instant$_.Instant? instant1,
    jni$_.JObject? localDateTime,
    jni$_.JObject? localDateTime1,
  ) {
    final _$instant = instant?.reference ?? jni$_.jNullReference;
    final _$instant1 = instant1?.reference ?? jni$_.jNullReference;
    final _$localDateTime = localDateTime?.reference ?? jni$_.jNullReference;
    final _$localDateTime1 = localDateTime1?.reference ?? jni$_.jNullReference;
    return TimeRangeFilter.fromReference(_new$(
            _class.reference.pointer,
            _id_new$ as jni$_.JMethodIDPtr,
            _$instant.pointer,
            _$instant1.pointer,
            _$localDateTime.pointer,
            _$localDateTime1.pointer)
        .reference);
  }

  static final _id_new$1 = _class.constructorId(
    r'(Ljava/time/Instant;Ljava/time/Instant;Ljava/time/LocalDateTime;Ljava/time/LocalDateTime;ILkotlin/jvm/internal/DefaultConstructorMarker;)V',
  );

  static final _new$1 = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                  jni$_.Pointer<jni$_.Void>,
                  jni$_.JMethodIDPtr,
                  jni$_.VarArgs<
                      (
                        jni$_.Pointer<jni$_.Void>,
                        jni$_.Pointer<jni$_.Void>,
                        jni$_.Pointer<jni$_.Void>,
                        jni$_.Pointer<jni$_.Void>,
                        jni$_.Int32,
                        jni$_.Pointer<jni$_.Void>
                      )>)>>('globalEnv_NewObject')
      .asFunction<
          jni$_.JniResult Function(
              jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr,
              jni$_.Pointer<jni$_.Void>,
              jni$_.Pointer<jni$_.Void>,
              jni$_.Pointer<jni$_.Void>,
              jni$_.Pointer<jni$_.Void>,
              int,
              jni$_.Pointer<jni$_.Void>)>();

  /// from: `synthetic public void <init>(java.time.Instant instant, java.time.Instant instant1, java.time.LocalDateTime localDateTime, java.time.LocalDateTime localDateTime1, int i, kotlin.jvm.internal.DefaultConstructorMarker defaultConstructorMarker)`
  /// The returned object must be released after use, by calling the [release] method.
  factory TimeRangeFilter.new$1(
    instant$_.Instant? instant,
    instant$_.Instant? instant1,
    jni$_.JObject? localDateTime,
    jni$_.JObject? localDateTime1,
    int i,
    jni$_.JObject? defaultConstructorMarker,
  ) {
    final _$instant = instant?.reference ?? jni$_.jNullReference;
    final _$instant1 = instant1?.reference ?? jni$_.jNullReference;
    final _$localDateTime = localDateTime?.reference ?? jni$_.jNullReference;
    final _$localDateTime1 = localDateTime1?.reference ?? jni$_.jNullReference;
    final _$defaultConstructorMarker =
        defaultConstructorMarker?.reference ?? jni$_.jNullReference;
    return TimeRangeFilter.fromReference(_new$1(
            _class.reference.pointer,
            _id_new$1 as jni$_.JMethodIDPtr,
            _$instant.pointer,
            _$instant1.pointer,
            _$localDateTime.pointer,
            _$localDateTime1.pointer,
            i,
            _$defaultConstructorMarker.pointer)
        .reference);
  }

  static final _id_getStartTime = _class.instanceMethodId(
    r'getStartTime',
    r'()Ljava/time/Instant;',
  );

  static final _getStartTime = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                jni$_.Pointer<jni$_.Void>,
                jni$_.JMethodIDPtr,
              )>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni$_.JniResult Function(
            jni$_.Pointer<jni$_.Void>,
            jni$_.JMethodIDPtr,
          )>();

  /// from: `public final java.time.Instant getStartTime()`
  /// The returned object must be released after use, by calling the [release] method.
  instant$_.Instant? getStartTime() {
    return _getStartTime(
            reference.pointer, _id_getStartTime as jni$_.JMethodIDPtr)
        .object<instant$_.Instant?>(const instant$_.$Instant$NullableType());
  }

  static final _id_getEndTime = _class.instanceMethodId(
    r'getEndTime',
    r'()Ljava/time/Instant;',
  );

  static final _getEndTime = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                jni$_.Pointer<jni$_.Void>,
                jni$_.JMethodIDPtr,
              )>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni$_.JniResult Function(
            jni$_.Pointer<jni$_.Void>,
            jni$_.JMethodIDPtr,
          )>();

  /// from: `public final java.time.Instant getEndTime()`
  /// The returned object must be released after use, by calling the [release] method.
  instant$_.Instant? getEndTime() {
    return _getEndTime(reference.pointer, _id_getEndTime as jni$_.JMethodIDPtr)
        .object<instant$_.Instant?>(const instant$_.$Instant$NullableType());
  }

  static final _id_getLocalStartTime = _class.instanceMethodId(
    r'getLocalStartTime',
    r'()Ljava/time/LocalDateTime;',
  );

  static final _getLocalStartTime = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                jni$_.Pointer<jni$_.Void>,
                jni$_.JMethodIDPtr,
              )>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni$_.JniResult Function(
            jni$_.Pointer<jni$_.Void>,
            jni$_.JMethodIDPtr,
          )>();

  /// from: `public final java.time.LocalDateTime getLocalStartTime()`
  /// The returned object must be released after use, by calling the [release] method.
  jni$_.JObject? getLocalStartTime() {
    return _getLocalStartTime(
            reference.pointer, _id_getLocalStartTime as jni$_.JMethodIDPtr)
        .object<jni$_.JObject?>(const jni$_.JObjectNullableType());
  }

  static final _id_getLocalEndTime = _class.instanceMethodId(
    r'getLocalEndTime',
    r'()Ljava/time/LocalDateTime;',
  );

  static final _getLocalEndTime = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                jni$_.Pointer<jni$_.Void>,
                jni$_.JMethodIDPtr,
              )>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni$_.JniResult Function(
            jni$_.Pointer<jni$_.Void>,
            jni$_.JMethodIDPtr,
          )>();

  /// from: `public final java.time.LocalDateTime getLocalEndTime()`
  /// The returned object must be released after use, by calling the [release] method.
  jni$_.JObject? getLocalEndTime() {
    return _getLocalEndTime(
            reference.pointer, _id_getLocalEndTime as jni$_.JMethodIDPtr)
        .object<jni$_.JObject?>(const jni$_.JObjectNullableType());
  }

  static final _id_equals = _class.instanceMethodId(
    r'equals',
    r'(Ljava/lang/Object;)Z',
  );

  static final _equals = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_.VarArgs<(jni$_.Pointer<jni$_.Void>,)>)>>(
          'globalEnv_CallBooleanMethod')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>)>();

  /// from: `public boolean equals(java.lang.Object object)`
  bool equals(
    jni$_.JObject? object,
  ) {
    final _$object = object?.reference ?? jni$_.jNullReference;
    return _equals(reference.pointer, _id_equals as jni$_.JMethodIDPtr,
            _$object.pointer)
        .boolean;
  }

  static final _id_hashCode$1 = _class.instanceMethodId(
    r'hashCode',
    r'()I',
  );

  static final _hashCode$1 = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                jni$_.Pointer<jni$_.Void>,
                jni$_.JMethodIDPtr,
              )>>('globalEnv_CallIntMethod')
      .asFunction<
          jni$_.JniResult Function(
            jni$_.Pointer<jni$_.Void>,
            jni$_.JMethodIDPtr,
          )>();

  /// from: `public int hashCode()`
  int hashCode$1() {
    return _hashCode$1(reference.pointer, _id_hashCode$1 as jni$_.JMethodIDPtr)
        .integer;
  }

  static final _id_new$2 = _class.constructorId(
    r'()V',
  );

  static final _new$2 = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                jni$_.Pointer<jni$_.Void>,
                jni$_.JMethodIDPtr,
              )>>('globalEnv_NewObject')
      .asFunction<
          jni$_.JniResult Function(
            jni$_.Pointer<jni$_.Void>,
            jni$_.JMethodIDPtr,
          )>();

  /// from: `public void <init>()`
  /// The returned object must be released after use, by calling the [release] method.
  factory TimeRangeFilter.new$2() {
    return TimeRangeFilter.fromReference(
        _new$2(_class.reference.pointer, _id_new$2 as jni$_.JMethodIDPtr)
            .reference);
  }

  static final _id_between = _class.staticMethodId(
    r'between',
    r'(Ljava/time/Instant;Ljava/time/Instant;)Landroidx/health/connect/client/time/TimeRangeFilter;',
  );

  static final _between = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                  jni$_.Pointer<jni$_.Void>,
                  jni$_.JMethodIDPtr,
                  jni$_.VarArgs<
                      (
                        jni$_.Pointer<jni$_.Void>,
                        jni$_.Pointer<jni$_.Void>
                      )>)>>('globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni$_.JniResult Function(
              jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr,
              jni$_.Pointer<jni$_.Void>,
              jni$_.Pointer<jni$_.Void>)>();

  /// from: `static public final androidx.health.connect.client.time.TimeRangeFilter between(java.time.Instant instant, java.time.Instant instant1)`
  /// The returned object must be released after use, by calling the [release] method.
  static TimeRangeFilter between(
    instant$_.Instant instant,
    instant$_.Instant instant1,
  ) {
    final _$instant = instant.reference;
    final _$instant1 = instant1.reference;
    return _between(_class.reference.pointer, _id_between as jni$_.JMethodIDPtr,
            _$instant.pointer, _$instant1.pointer)
        .object<TimeRangeFilter>(const $TimeRangeFilter$Type());
  }

  static final _id_between$1 = _class.staticMethodId(
    r'between',
    r'(Ljava/time/LocalDateTime;Ljava/time/LocalDateTime;)Landroidx/health/connect/client/time/TimeRangeFilter;',
  );

  static final _between$1 = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                  jni$_.Pointer<jni$_.Void>,
                  jni$_.JMethodIDPtr,
                  jni$_.VarArgs<
                      (
                        jni$_.Pointer<jni$_.Void>,
                        jni$_.Pointer<jni$_.Void>
                      )>)>>('globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni$_.JniResult Function(
              jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr,
              jni$_.Pointer<jni$_.Void>,
              jni$_.Pointer<jni$_.Void>)>();

  /// from: `static public final androidx.health.connect.client.time.TimeRangeFilter between(java.time.LocalDateTime localDateTime, java.time.LocalDateTime localDateTime1)`
  /// The returned object must be released after use, by calling the [release] method.
  static TimeRangeFilter between$1(
    jni$_.JObject localDateTime,
    jni$_.JObject localDateTime1,
  ) {
    final _$localDateTime = localDateTime.reference;
    final _$localDateTime1 = localDateTime1.reference;
    return _between$1(
            _class.reference.pointer,
            _id_between$1 as jni$_.JMethodIDPtr,
            _$localDateTime.pointer,
            _$localDateTime1.pointer)
        .object<TimeRangeFilter>(const $TimeRangeFilter$Type());
  }

  static final _id_before = _class.staticMethodId(
    r'before',
    r'(Ljava/time/Instant;)Landroidx/health/connect/client/time/TimeRangeFilter;',
  );

  static final _before = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_.VarArgs<(jni$_.Pointer<jni$_.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>)>();

  /// from: `static public final androidx.health.connect.client.time.TimeRangeFilter before(java.time.Instant instant)`
  /// The returned object must be released after use, by calling the [release] method.
  static TimeRangeFilter before(
    instant$_.Instant instant,
  ) {
    final _$instant = instant.reference;
    return _before(_class.reference.pointer, _id_before as jni$_.JMethodIDPtr,
            _$instant.pointer)
        .object<TimeRangeFilter>(const $TimeRangeFilter$Type());
  }

  static final _id_before$1 = _class.staticMethodId(
    r'before',
    r'(Ljava/time/LocalDateTime;)Landroidx/health/connect/client/time/TimeRangeFilter;',
  );

  static final _before$1 = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_.VarArgs<(jni$_.Pointer<jni$_.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>)>();

  /// from: `static public final androidx.health.connect.client.time.TimeRangeFilter before(java.time.LocalDateTime localDateTime)`
  /// The returned object must be released after use, by calling the [release] method.
  static TimeRangeFilter before$1(
    jni$_.JObject localDateTime,
  ) {
    final _$localDateTime = localDateTime.reference;
    return _before$1(_class.reference.pointer,
            _id_before$1 as jni$_.JMethodIDPtr, _$localDateTime.pointer)
        .object<TimeRangeFilter>(const $TimeRangeFilter$Type());
  }

  static final _id_after = _class.staticMethodId(
    r'after',
    r'(Ljava/time/Instant;)Landroidx/health/connect/client/time/TimeRangeFilter;',
  );

  static final _after = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_.VarArgs<(jni$_.Pointer<jni$_.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>)>();

  /// from: `static public final androidx.health.connect.client.time.TimeRangeFilter after(java.time.Instant instant)`
  /// The returned object must be released after use, by calling the [release] method.
  static TimeRangeFilter after(
    instant$_.Instant instant,
  ) {
    final _$instant = instant.reference;
    return _after(_class.reference.pointer, _id_after as jni$_.JMethodIDPtr,
            _$instant.pointer)
        .object<TimeRangeFilter>(const $TimeRangeFilter$Type());
  }

  static final _id_after$1 = _class.staticMethodId(
    r'after',
    r'(Ljava/time/LocalDateTime;)Landroidx/health/connect/client/time/TimeRangeFilter;',
  );

  static final _after$1 = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_.VarArgs<(jni$_.Pointer<jni$_.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>)>();

  /// from: `static public final androidx.health.connect.client.time.TimeRangeFilter after(java.time.LocalDateTime localDateTime)`
  /// The returned object must be released after use, by calling the [release] method.
  static TimeRangeFilter after$1(
    jni$_.JObject localDateTime,
  ) {
    final _$localDateTime = localDateTime.reference;
    return _after$1(_class.reference.pointer, _id_after$1 as jni$_.JMethodIDPtr,
            _$localDateTime.pointer)
        .object<TimeRangeFilter>(const $TimeRangeFilter$Type());
  }
}

final class $TimeRangeFilter$NullableType
    extends jni$_.JObjType<TimeRangeFilter?> {
  @jni$_.internal
  const $TimeRangeFilter$NullableType();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Landroidx/health/connect/client/time/TimeRangeFilter;';

  @jni$_.internal
  @core$_.override
  TimeRangeFilter? fromReference(jni$_.JReference reference) => reference.isNull
      ? null
      : TimeRangeFilter.fromReference(
          reference,
        );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<TimeRangeFilter?> get nullableType => this;

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($TimeRangeFilter$NullableType).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($TimeRangeFilter$NullableType) &&
        other is $TimeRangeFilter$NullableType;
  }
}

final class $TimeRangeFilter$Type extends jni$_.JObjType<TimeRangeFilter> {
  @jni$_.internal
  const $TimeRangeFilter$Type();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Landroidx/health/connect/client/time/TimeRangeFilter;';

  @jni$_.internal
  @core$_.override
  TimeRangeFilter fromReference(jni$_.JReference reference) =>
      TimeRangeFilter.fromReference(
        reference,
      );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<TimeRangeFilter?> get nullableType =>
      const $TimeRangeFilter$NullableType();

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($TimeRangeFilter$Type).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($TimeRangeFilter$Type) &&
        other is $TimeRangeFilter$Type;
  }
}
