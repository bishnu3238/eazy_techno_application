class CategoryFetchFailure implements Exception {
  final String message;
  CategoryFetchFailure([this.message = "Category Fetch Failure"]);
}
