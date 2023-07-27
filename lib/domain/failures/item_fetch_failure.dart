class ItemFetchFailure implements Exception {
  final String message;
  ItemFetchFailure([this.message = "Item Fetch Failure!"]);
}
