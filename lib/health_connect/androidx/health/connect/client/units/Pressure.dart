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

/// from: `androidx.health.connect.client.units.Pressure$Companion`
class Pressure$Companion extends jni$_.JObject {
  @jni$_.internal
  @core$_.override
  final jni$_.JObjType<Pressure$Companion> $type;

  @jni$_.internal
  Pressure$Companion.fromReference(
    jni$_.JReference reference,
  )   : $type = type,
        super.fromReference(reference);

  static final _class = jni$_.JClass.forName(
      r'androidx/health/connect/client/units/Pressure$Companion');

  /// The type which includes information such as the signature of this class.
  static const nullableType = $Pressure$Companion$NullableType();
  static const type = $Pressure$Companion$Type();
  static final _id_millimetersOfMercury = _class.instanceMethodId(
    r'millimetersOfMercury',
    r'(D)Landroidx/health/connect/client/units/Pressure;',
  );

  static final _millimetersOfMercury = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                  jni$_.Pointer<jni$_.Void>,
                  jni$_.JMethodIDPtr,
                  jni$_
                      .VarArgs<(jni$_.Double,)>)>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni$_.JniResult Function(
              jni$_.Pointer<jni$_.Void>, jni$_.JMethodIDPtr, double)>();

  /// from: `public final androidx.health.connect.client.units.Pressure millimetersOfMercury(double d)`
  /// The returned object must be released after use, by calling the [release] method.
  Pressure millimetersOfMercury(
    double d,
  ) {
    return _millimetersOfMercury(reference.pointer,
            _id_millimetersOfMercury as jni$_.JMethodIDPtr, d)
        .object<Pressure>(const $Pressure$Type());
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
  factory Pressure$Companion(
    jni$_.JObject? defaultConstructorMarker,
  ) {
    final _$defaultConstructorMarker =
        defaultConstructorMarker?.reference ?? jni$_.jNullReference;
    return Pressure$Companion.fromReference(_new$(_class.reference.pointer,
            _id_new$ as jni$_.JMethodIDPtr, _$defaultConstructorMarker.pointer)
        .reference);
  }
}

final class $Pressure$Companion$NullableType
    extends jni$_.JObjType<Pressure$Companion?> {
  @jni$_.internal
  const $Pressure$Companion$NullableType();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Landroidx/health/connect/client/units/Pressure$Companion;';

  @jni$_.internal
  @core$_.override
  Pressure$Companion? fromReference(jni$_.JReference reference) =>
      reference.isNull
          ? null
          : Pressure$Companion.fromReference(
              reference,
            );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<Pressure$Companion?> get nullableType => this;

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($Pressure$Companion$NullableType).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($Pressure$Companion$NullableType) &&
        other is $Pressure$Companion$NullableType;
  }
}

final class $Pressure$Companion$Type
    extends jni$_.JObjType<Pressure$Companion> {
  @jni$_.internal
  const $Pressure$Companion$Type();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Landroidx/health/connect/client/units/Pressure$Companion;';

  @jni$_.internal
  @core$_.override
  Pressure$Companion fromReference(jni$_.JReference reference) =>
      Pressure$Companion.fromReference(
        reference,
      );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<Pressure$Companion?> get nullableType =>
      const $Pressure$Companion$NullableType();

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($Pressure$Companion$Type).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($Pressure$Companion$Type) &&
        other is $Pressure$Companion$Type;
  }
}

/// from: `androidx.health.connect.client.units.Pressure`
class Pressure extends jni$_.JObject {
  @jni$_.internal
  @core$_.override
  final jni$_.JObjType<Pressure> $type;

  @jni$_.internal
  Pressure.fromReference(
    jni$_.JReference reference,
  )   : $type = type,
        super.fromReference(reference);

  static final _class =
      jni$_.JClass.forName(r'androidx/health/connect/client/units/Pressure');

  /// The type which includes information such as the signature of this class.
  static const nullableType = $Pressure$NullableType();
  static const type = $Pressure$Type();
  static final _id_Companion = _class.staticFieldId(
    r'Companion',
    r'Landroidx/health/connect/client/units/Pressure$Companion;',
  );

  /// from: `static public final androidx.health.connect.client.units.Pressure$Companion Companion`
  /// The returned object must be released after use, by calling the [release] method.
  static Pressure$Companion get Companion =>
      _id_Companion.get(_class, const $Pressure$Companion$Type());

  static final _id_getMillimetersOfMercury = _class.instanceMethodId(
    r'getMillimetersOfMercury',
    r'()D',
  );

  static final _getMillimetersOfMercury = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                jni$_.Pointer<jni$_.Void>,
                jni$_.JMethodIDPtr,
              )>>('globalEnv_CallDoubleMethod')
      .asFunction<
          jni$_.JniResult Function(
            jni$_.Pointer<jni$_.Void>,
            jni$_.JMethodIDPtr,
          )>();

  /// from: `public final double getMillimetersOfMercury()`
  double getMillimetersOfMercury() {
    return _getMillimetersOfMercury(reference.pointer,
            _id_getMillimetersOfMercury as jni$_.JMethodIDPtr)
        .doubleFloat;
  }

  static final _id_compareTo = _class.instanceMethodId(
    r'compareTo',
    r'(Landroidx/health/connect/client/units/Pressure;)I',
  );

  static final _compareTo = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_.VarArgs<(jni$_.Pointer<jni$_.Void>,)>)>>(
          'globalEnv_CallIntMethod')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>)>();

  /// from: `public int compareTo(androidx.health.connect.client.units.Pressure pressure)`
  int compareTo(
    Pressure pressure,
  ) {
    final _$pressure = pressure.reference;
    return _compareTo(reference.pointer, _id_compareTo as jni$_.JMethodIDPtr,
            _$pressure.pointer)
        .integer;
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

  static final _id_toString$1 = _class.instanceMethodId(
    r'toString',
    r'()Ljava/lang/String;',
  );

  static final _toString$1 = jni$_.ProtectedJniExtensions.lookup<
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

  /// from: `public java.lang.String toString()`
  /// The returned object must be released after use, by calling the [release] method.
  jni$_.JString toString$1() {
    return _toString$1(reference.pointer, _id_toString$1 as jni$_.JMethodIDPtr)
        .object<jni$_.JString>(const jni$_.JStringType());
  }

  static final _id_millimetersOfMercury = _class.staticMethodId(
    r'millimetersOfMercury',
    r'(D)Landroidx/health/connect/client/units/Pressure;',
  );

  static final _millimetersOfMercury = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr, jni$_.VarArgs<(jni$_.Double,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni$_.JniResult Function(
              jni$_.Pointer<jni$_.Void>, jni$_.JMethodIDPtr, double)>();

  /// from: `static public final androidx.health.connect.client.units.Pressure millimetersOfMercury(double d)`
  /// The returned object must be released after use, by calling the [release] method.
  static Pressure millimetersOfMercury(
    double d,
  ) {
    return _millimetersOfMercury(_class.reference.pointer,
            _id_millimetersOfMercury as jni$_.JMethodIDPtr, d)
        .object<Pressure>(const $Pressure$Type());
  }

  static final _id_new$ = _class.constructorId(
    r'(DLkotlin/jvm/internal/DefaultConstructorMarker;)V',
  );

  static final _new$ = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                  jni$_.Pointer<jni$_.Void>,
                  jni$_.JMethodIDPtr,
                  jni$_.VarArgs<
                      (
                        jni$_.Double,
                        jni$_.Pointer<jni$_.Void>
                      )>)>>('globalEnv_NewObject')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, double, jni$_.Pointer<jni$_.Void>)>();

  /// from: `synthetic public void <init>(double d, kotlin.jvm.internal.DefaultConstructorMarker defaultConstructorMarker)`
  /// The returned object must be released after use, by calling the [release] method.
  factory Pressure(
    double d,
    jni$_.JObject? defaultConstructorMarker,
  ) {
    final _$defaultConstructorMarker =
        defaultConstructorMarker?.reference ?? jni$_.jNullReference;
    return Pressure.fromReference(_new$(
            _class.reference.pointer,
            _id_new$ as jni$_.JMethodIDPtr,
            d,
            _$defaultConstructorMarker.pointer)
        .reference);
  }

  bool operator <(Pressure pressure) {
    return compareTo(pressure) < 0;
  }

  bool operator <=(Pressure pressure) {
    return compareTo(pressure) <= 0;
  }

  bool operator >(Pressure pressure) {
    return compareTo(pressure) > 0;
  }

  bool operator >=(Pressure pressure) {
    return compareTo(pressure) >= 0;
  }
}

final class $Pressure$NullableType extends jni$_.JObjType<Pressure?> {
  @jni$_.internal
  const $Pressure$NullableType();

  @jni$_.internal
  @core$_.override
  String get signature => r'Landroidx/health/connect/client/units/Pressure;';

  @jni$_.internal
  @core$_.override
  Pressure? fromReference(jni$_.JReference reference) => reference.isNull
      ? null
      : Pressure.fromReference(
          reference,
        );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectNullableType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<Pressure?> get nullableType => this;

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($Pressure$NullableType).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($Pressure$NullableType) &&
        other is $Pressure$NullableType;
  }
}

final class $Pressure$Type extends jni$_.JObjType<Pressure> {
  @jni$_.internal
  const $Pressure$Type();

  @jni$_.internal
  @core$_.override
  String get signature => r'Landroidx/health/connect/client/units/Pressure;';

  @jni$_.internal
  @core$_.override
  Pressure fromReference(jni$_.JReference reference) => Pressure.fromReference(
        reference,
      );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectNullableType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<Pressure?> get nullableType => const $Pressure$NullableType();

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($Pressure$Type).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($Pressure$Type) && other is $Pressure$Type;
  }
}
