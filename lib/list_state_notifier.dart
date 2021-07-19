import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListStateNotifier extends StateNotifier<List<String>> {
  ListStateNotifier(List<String> state) : super(state);
  UnmodifiableListView<String> get stateList => UnmodifiableListView(state);
}

final listStateProvider =
    StateNotifierProvider<ListStateNotifier, List<String>>(
        (ref) => ListStateNotifier([]));
