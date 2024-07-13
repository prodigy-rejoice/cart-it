class Price {
  final List? USD;
  Price({required this.USD});
  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(USD: json["USD"]);
  }
}
