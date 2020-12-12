class DeepLinkPayload {
  final int id;

  DeepLinkPayload.home() : id = null;

  DeepLinkPayload.details(this.id);

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;

  @override
  String toString() {
    return "issa deep link: ${id.toString()}";
  }
}