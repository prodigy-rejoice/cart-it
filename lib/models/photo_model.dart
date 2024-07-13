class Photo {
  final String url;
  Photo({required this.url});
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(url: json["url"]);
  }
}



//organizationId== b3cc8c67fa7049909c9b38033787792b
//apiKey== 9713371a82c24374ab53094e6d7057cc20240713153049998114
//apiId== 97W459JCOYHKQF6