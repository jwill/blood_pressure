import 'package:blood_pressure_app/src/data/persisted_signal_mixin.dart';
import 'package:signals/signals.dart';
import 'package:signals/signals_flutter.dart';

import 'key_value_store.dart';

/*abstract class PersistedSignal<T> extends FlutterSignal<T>
    with PersistedSignalMixin<T> {
  PersistedSignal(
    super.internalValue, {
    super.autoDispose,
    super.debugLabel,
    required this.key, required SharedPreferencesStore store,
  });

  @override
  final String key;

}
*/