class Result<T> {
  final T data;
  final int? statusCode;
  final String? message;

  const Result({
    required this.statusCode,
    required this.data,
    required this.message,
  });
}

typedef JsonConverter<T> = T Function(Map<String, dynamic> json);

extension ListToModelExtension on List {
  List<K> toListModel<K>(JsonConverter<K> converter) {
    return map((e) => converter(e as Map<String, dynamic>)).toList();
  }
}
