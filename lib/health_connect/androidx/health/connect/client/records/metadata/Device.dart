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

/// from: `androidx.health.connect.client.records.metadata.Device$Companion`
class Device$Companion extends jni$_.JObject {
  @jni$_.internal
  @core$_.override
  final jni$_.JObjType<Device$Companion> $type;

  @jni$_.internal
  Device$Companion.fromReference(
    jni$_.JReference reference,
  )   : $type = type,
        super.fromReference(reference);

  static final _class = jni$_.JClass.forName(
      r'androidx/health/connect/client/records/metadata/Device$Companion');

  /// The type which includes information such as the signature of this class.
  static const nullableType = $Device$Companion$NullableType();
  static const type = $Device$Companion$Type();
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
  factory Device$Companion(
    jni$_.JObject? defaultConstructorMarker,
  ) {
    final _$defaultConstructorMarker =
        defaultConstructorMarker?.reference ?? jni$_.jNullReference;
    return Device$Companion.fromReference(_new$(_class.reference.pointer,
            _id_new$ as jni$_.JMethodIDPtr, _$defaultConstructorMarker.pointer)
        .reference);
  }
}

final class $Device$Companion$NullableType
    extends jni$_.JObjType<Device$Companion?> {
  @jni$_.internal
  const $Device$Companion$NullableType();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Landroidx/health/connect/client/records/metadata/Device$Companion;';

  @jni$_.internal
  @core$_.override
  Device$Companion? fromReference(jni$_.JReference reference) =>
      reference.isNull
          ? null
          : Device$Companion.fromReference(
              reference,
            );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<Device$Companion?> get nullableType => this;

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($Device$Companion$NullableType).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($Device$Companion$NullableType) &&
        other is $Device$Companion$NullableType;
  }
}

final class $Device$Companion$Type extends jni$_.JObjType<Device$Companion> {
  @jni$_.internal
  const $Device$Companion$Type();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Landroidx/health/connect/client/records/metadata/Device$Companion;';

  @jni$_.internal
  @core$_.override
  Device$Companion fromReference(jni$_.JReference reference) =>
      Device$Companion.fromReference(
        reference,
      );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<Device$Companion?> get nullableType =>
      const $Device$Companion$NullableType();

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($Device$Companion$Type).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($Device$Companion$Type) &&
        other is $Device$Companion$Type;
  }
}

/// from: `androidx.health.connect.client.records.metadata.Device$DeviceType`
class Device$DeviceType extends jni$_.JObject {
  @jni$_.internal
  @core$_.override
  final jni$_.JObjType<Device$DeviceType> $type;

  @jni$_.internal
  Device$DeviceType.fromReference(
    jni$_.JReference reference,
  )   : $type = type,
        super.fromReference(reference);

  static final _class = jni$_.JClass.forName(
      r'androidx/health/connect/client/records/metadata/Device$DeviceType');

  /// The type which includes information such as the signature of this class.
  static const nullableType = $Device$DeviceType$NullableType();
  static const type = $Device$DeviceType$Type();

  /// Maps a specific port to the implemented interface.
  static final core$_.Map<int, $Device$DeviceType> _$impls = {};
  static jni$_.JObjectPtr _$invoke(
    int port,
    jni$_.JObjectPtr descriptor,
    jni$_.JObjectPtr args,
  ) {
    return _$invokeMethod(
      port,
      jni$_.MethodInvocation.fromAddresses(
        0,
        descriptor.address,
        args.address,
      ),
    );
  }

  static final jni$_.Pointer<
          jni$_.NativeFunction<
              jni$_.JObjectPtr Function(
                  jni$_.Int64, jni$_.JObjectPtr, jni$_.JObjectPtr)>>
      _$invokePointer = jni$_.Pointer.fromFunction(_$invoke);

  static jni$_.Pointer<jni$_.Void> _$invokeMethod(
    int $p,
    jni$_.MethodInvocation $i,
  ) {
    try {
      final $d = $i.methodDescriptor.toDartString(releaseOriginal: true);
      final $a = $i.args;
    } catch (e) {
      return jni$_.ProtectedJniExtensions.newDartException(e);
    }
    return jni$_.nullptr;
  }

  static void implementIn(
    jni$_.JImplementer implementer,
    $Device$DeviceType $impl,
  ) {
    late final jni$_.RawReceivePort $p;
    $p = jni$_.RawReceivePort(($m) {
      if ($m == null) {
        _$impls.remove($p.sendPort.nativePort);
        $p.close();
        return;
      }
      final $i = jni$_.MethodInvocation.fromMessage($m);
      final $r = _$invokeMethod($p.sendPort.nativePort, $i);
      jni$_.ProtectedJniExtensions.returnResult($i.result, $r);
    });
    implementer.add(
      r'androidx.health.connect.client.records.metadata.Device$DeviceType',
      $p,
      _$invokePointer,
      [],
    );
    final $a = $p.sendPort.nativePort;
    _$impls[$a] = $impl;
  }

  factory Device$DeviceType.implement(
    $Device$DeviceType $impl,
  ) {
    final $i = jni$_.JImplementer();
    implementIn($i, $impl);
    return Device$DeviceType.fromReference(
      $i.implementReference(),
    );
  }
}

abstract base mixin class $Device$DeviceType {
  factory $Device$DeviceType() = _$Device$DeviceType;
}

final class _$Device$DeviceType with $Device$DeviceType {
  _$Device$DeviceType();
}

final class $Device$DeviceType$NullableType
    extends jni$_.JObjType<Device$DeviceType?> {
  @jni$_.internal
  const $Device$DeviceType$NullableType();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Landroidx/health/connect/client/records/metadata/Device$DeviceType;';

  @jni$_.internal
  @core$_.override
  Device$DeviceType? fromReference(jni$_.JReference reference) =>
      reference.isNull
          ? null
          : Device$DeviceType.fromReference(
              reference,
            );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectNullableType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<Device$DeviceType?> get nullableType => this;

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($Device$DeviceType$NullableType).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($Device$DeviceType$NullableType) &&
        other is $Device$DeviceType$NullableType;
  }
}

final class $Device$DeviceType$Type extends jni$_.JObjType<Device$DeviceType> {
  @jni$_.internal
  const $Device$DeviceType$Type();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Landroidx/health/connect/client/records/metadata/Device$DeviceType;';

  @jni$_.internal
  @core$_.override
  Device$DeviceType fromReference(jni$_.JReference reference) =>
      Device$DeviceType.fromReference(
        reference,
      );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectNullableType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<Device$DeviceType?> get nullableType =>
      const $Device$DeviceType$NullableType();

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($Device$DeviceType$Type).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($Device$DeviceType$Type) &&
        other is $Device$DeviceType$Type;
  }
}

/// from: `androidx.health.connect.client.records.metadata.Device`
class Device extends jni$_.JObject {
  @jni$_.internal
  @core$_.override
  final jni$_.JObjType<Device> $type;

  @jni$_.internal
  Device.fromReference(
    jni$_.JReference reference,
  )   : $type = type,
        super.fromReference(reference);

  static final _class = jni$_.JClass.forName(
      r'androidx/health/connect/client/records/metadata/Device');

  /// The type which includes information such as the signature of this class.
  static const nullableType = $Device$NullableType();
  static const type = $Device$Type();
  static final _id_Companion = _class.staticFieldId(
    r'Companion',
    r'Landroidx/health/connect/client/records/metadata/Device$Companion;',
  );

  /// from: `static public final androidx.health.connect.client.records.metadata.Device$Companion Companion`
  /// The returned object must be released after use, by calling the [release] method.
  static Device$Companion get Companion =>
      _id_Companion.get(_class, const $Device$Companion$Type());

  /// from: `static public final int TYPE_UNKNOWN`
  static const TYPE_UNKNOWN = 0;

  /// from: `static public final int TYPE_WATCH`
  static const TYPE_WATCH = 1;

  /// from: `static public final int TYPE_PHONE`
  static const TYPE_PHONE = 2;

  /// from: `static public final int TYPE_SCALE`
  static const TYPE_SCALE = 3;

  /// from: `static public final int TYPE_RING`
  static const TYPE_RING = 4;

  /// from: `static public final int TYPE_HEAD_MOUNTED`
  static const TYPE_HEAD_MOUNTED = 5;

  /// from: `static public final int TYPE_FITNESS_BAND`
  static const TYPE_FITNESS_BAND = 6;

  /// from: `static public final int TYPE_CHEST_STRAP`
  static const TYPE_CHEST_STRAP = 7;

  /// from: `static public final int TYPE_SMART_DISPLAY`
  static const TYPE_SMART_DISPLAY = 8;
  static final _id_new$ = _class.constructorId(
    r'(ILjava/lang/String;Ljava/lang/String;)V',
  );

  static final _new$ = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                  jni$_.Pointer<jni$_.Void>,
                  jni$_.JMethodIDPtr,
                  jni$_.VarArgs<
                      (
                        jni$_.Int32,
                        jni$_.Pointer<jni$_.Void>,
                        jni$_.Pointer<jni$_.Void>
                      )>)>>('globalEnv_NewObject')
      .asFunction<
          jni$_.JniResult Function(
              jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr,
              int,
              jni$_.Pointer<jni$_.Void>,
              jni$_.Pointer<jni$_.Void>)>();

  /// from: `public void <init>(int i, java.lang.String string, java.lang.String string1)`
  /// The returned object must be released after use, by calling the [release] method.
  factory Device(
    int i,
    jni$_.JString? string,
    jni$_.JString? string1,
  ) {
    final _$string = string?.reference ?? jni$_.jNullReference;
    final _$string1 = string1?.reference ?? jni$_.jNullReference;
    return Device.fromReference(_new$(
            _class.reference.pointer,
            _id_new$ as jni$_.JMethodIDPtr,
            i,
            _$string.pointer,
            _$string1.pointer)
        .reference);
  }

  static final _id_new$1 = _class.constructorId(
    r'(ILjava/lang/String;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V',
  );

  static final _new$1 = jni$_.ProtectedJniExtensions.lookup<
          jni$_.NativeFunction<
              jni$_.JniResult Function(
                  jni$_.Pointer<jni$_.Void>,
                  jni$_.JMethodIDPtr,
                  jni$_.VarArgs<
                      (
                        jni$_.Int32,
                        jni$_.Pointer<jni$_.Void>,
                        jni$_.Pointer<jni$_.Void>,
                        jni$_.Int32,
                        jni$_.Pointer<jni$_.Void>
                      )>)>>('globalEnv_NewObject')
      .asFunction<
          jni$_.JniResult Function(
              jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr,
              int,
              jni$_.Pointer<jni$_.Void>,
              jni$_.Pointer<jni$_.Void>,
              int,
              jni$_.Pointer<jni$_.Void>)>();

  /// from: `synthetic public void <init>(int i, java.lang.String string, java.lang.String string1, int i1, kotlin.jvm.internal.DefaultConstructorMarker defaultConstructorMarker)`
  /// The returned object must be released after use, by calling the [release] method.
  factory Device.new$1(
    int i,
    jni$_.JString? string,
    jni$_.JString? string1,
    int i1,
    jni$_.JObject? defaultConstructorMarker,
  ) {
    final _$string = string?.reference ?? jni$_.jNullReference;
    final _$string1 = string1?.reference ?? jni$_.jNullReference;
    final _$defaultConstructorMarker =
        defaultConstructorMarker?.reference ?? jni$_.jNullReference;
    return Device.fromReference(_new$1(
            _class.reference.pointer,
            _id_new$1 as jni$_.JMethodIDPtr,
            i,
            _$string.pointer,
            _$string1.pointer,
            i1,
            _$defaultConstructorMarker.pointer)
        .reference);
  }

  static final _id_getType = _class.instanceMethodId(
    r'getType',
    r'()I',
  );

  static final _getType = jni$_.ProtectedJniExtensions.lookup<
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

  /// from: `public final int getType()`
  int getType() {
    return _getType(reference.pointer, _id_getType as jni$_.JMethodIDPtr)
        .integer;
  }

  static final _id_getManufacturer = _class.instanceMethodId(
    r'getManufacturer',
    r'()Ljava/lang/String;',
  );

  static final _getManufacturer = jni$_.ProtectedJniExtensions.lookup<
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

  /// from: `public final java.lang.String getManufacturer()`
  /// The returned object must be released after use, by calling the [release] method.
  jni$_.JString? getManufacturer() {
    return _getManufacturer(
            reference.pointer, _id_getManufacturer as jni$_.JMethodIDPtr)
        .object<jni$_.JString?>(const jni$_.JStringNullableType());
  }

  static final _id_getModel = _class.instanceMethodId(
    r'getModel',
    r'()Ljava/lang/String;',
  );

  static final _getModel = jni$_.ProtectedJniExtensions.lookup<
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

  /// from: `public final java.lang.String getModel()`
  /// The returned object must be released after use, by calling the [release] method.
  jni$_.JString? getModel() {
    return _getModel(reference.pointer, _id_getModel as jni$_.JMethodIDPtr)
        .object<jni$_.JString?>(const jni$_.JStringNullableType());
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
}

final class $Device$NullableType extends jni$_.JObjType<Device?> {
  @jni$_.internal
  const $Device$NullableType();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Landroidx/health/connect/client/records/metadata/Device;';

  @jni$_.internal
  @core$_.override
  Device? fromReference(jni$_.JReference reference) => reference.isNull
      ? null
      : Device.fromReference(
          reference,
        );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<Device?> get nullableType => this;

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($Device$NullableType).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($Device$NullableType) &&
        other is $Device$NullableType;
  }
}

final class $Device$Type extends jni$_.JObjType<Device> {
  @jni$_.internal
  const $Device$Type();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Landroidx/health/connect/client/records/metadata/Device;';

  @jni$_.internal
  @core$_.override
  Device fromReference(jni$_.JReference reference) => Device.fromReference(
        reference,
      );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<Device?> get nullableType => const $Device$NullableType();

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($Device$Type).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($Device$Type) && other is $Device$Type;
  }
}
