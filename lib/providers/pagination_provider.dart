import 'package:flutter/material.dart';
import 'package:ticketmaster/utils/logger.dart';

/// A base provider for handling paginated data fetching.
///
/// This class handles the logic for loading items page by page. Subclasses must
/// implement [fetchItems] to fetch data from their respective sources.
abstract class PaginationProvider<T> extends ChangeNotifier {
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 0;
  final List<T> _items = [];

  /// The list of items fetched so far.
  List<T> get items => _items;

  /// Whether a data fetch is currently in progress.
  bool get isLoading => _isLoading;

  /// Whether there is more data available for fetching.
  bool get hasMore => _hasMore;

  /// Fetches a page of items.
  ///
  /// The [page] parameter specifies which page of data to load.
  /// Returns a [Future] that resolves with the list of items for that page.
  Future<List<T>> fetchItems({required int page});

  /// Loads more items from the data source.
  ///
  /// If [reset] is true, the current page and items list will be cleared before
  /// fetching new data. Notifies listeners before and after the load operation.
  Future<void> loadMore({bool reset = false}) async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    if (reset) {
      _currentPage = 0;
      _items.clear();
      _hasMore = true;
    }

    try {
      final newItems = await fetchItems(page: _currentPage);
      if (newItems.isEmpty) {
        _hasMore = false;
      } else {
        _currentPage++;
        _items.addAll(newItems);
      }
    } catch (e) {
      log.e(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
