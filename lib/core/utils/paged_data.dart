import 'package:equatable/equatable.dart';

class PagedData<P, D> extends Equatable {
  final int? count;
  final P? next;
  final P? previous;
  final List<D> data;

  const PagedData({
    this.count,
    this.next,
    this.previous,
    required this.data,
  });

  PagedData<P, D> copyWith({
    int? count,
    P? next,
    P? previous,
    List<D>? data,
  }) {
    return PagedData<P, D>(
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
