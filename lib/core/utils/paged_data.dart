import 'package:equatable/equatable.dart';

class PagedData<T> extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<T> data;

  int nextPage() {
    if (next == null) return 1;
    final uri = Uri.parse(next!);
    final page = uri.queryParameters['page'];
    return int.tryParse(page ?? '') ?? 1;
  }

  int previousPage() {
    if (previous == null) return 1;
    final uri = Uri.parse(previous!);
    final page = uri.queryParameters['page'];
    return int.tryParse(page ?? '') ?? 1;
  }

  const PagedData({
    this.count,
    this.next,
    this.previous,
    required this.data,
  });

  PagedData<T> copyWith({
    int? count,
    String? next,
    String? previous,
    List<T>? data,
  }) {
    return PagedData<T>(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
    count,
    next,
    previous,
    data,
  ];
}
