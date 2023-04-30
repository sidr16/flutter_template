import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/pagination_state.dart';

class PaginationNotifier<T> extends StateNotifier<PaginationState<T>> {
  PaginationNotifier({
    required this.fetchNextItems,
    required this.itemPerBatch,
  }) : super(const PaginationState.loading());

  final Future<List<T>> Function(T? item) fetchNextItems;
  final int itemPerBatch;
  final List<T> _items = [];


  bool noMoreItems = false;

  void init() {
    if (_items.isEmpty) {
      fetchFirstBatch();
    }
  }

  void updateData(List<T> result) {
    noMoreItems = result.length < itemPerBatch;

    if (result.isEmpty) {
      state = PaginationState.data(_items);
    } else {
      state = PaginationState.data(_items..addAll(result));
    }
  }

  Future<void> fetchFirstBatch() async {
    try {
      state = const PaginationState.loading();

      final List<T> result = _items.isEmpty
          ? await fetchNextItems(null)
          : await fetchNextItems(_items.last);
      updateData(result);
    } catch (e, stk) {
      state = PaginationState.error(e, stk);
    }
  }

  Future<void> fetchNextBatch() async {
    if (noMoreItems) return;

    if (state == PaginationState<T>.onGoingLoading(_items)) {
      return;
    }

    state = PaginationState.onGoingLoading(_items);

    try {
      final result = await fetchNextItems(_items.last);
      updateData(result);
    } catch (e, stk) {
      state = PaginationState.onGoingError(_items, e, stk);
    }
  }
}
