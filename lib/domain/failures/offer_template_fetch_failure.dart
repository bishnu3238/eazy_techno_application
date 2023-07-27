class OfferTemplateFetchFailure implements Exception {
  final String message;
  OfferTemplateFetchFailure([this.message = "Offer template Fetch Failure"]);
}
