import 'dart:convert';

class PageFilter {
  String? queryText;
  int pageNumber;
  int pageSize;
  PageFilter({
    this.queryText,
    required this.pageNumber,
    required this.pageSize,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'queryText': queryText,
      'pageNumber': pageNumber,
      'pageSize': pageSize,
    };
  }

  factory PageFilter.fromMap(Map<String, dynamic> map) {
    return PageFilter(
      queryText: map['queryText'] != null ? map['queryText'] as String : null,
      pageNumber: map['pageNumber'] as int,
      pageSize: map['pageSize'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PageFilter.fromJson(String source) => PageFilter.fromMap(json.decode(source) as Map<String, dynamic>);
}
