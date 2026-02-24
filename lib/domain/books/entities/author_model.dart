import 'package:equatable/equatable.dart';

import '../../../data/remote_source/books/models/authors_response.dart';

class AuthorModel extends Equatable {
  final int? id;
  final String? fullName;
  final String? bio;
  final String? image;

  const AuthorModel({this.id, this.fullName, this.bio, this.image});

  factory AuthorModel.fromResponse(Author response) => AuthorModel(
    id: response.id,
    fullName: response.fullName,
    bio: response.bio,
    image: response.image,
  );

  @override
  List<Object?> get props => [id, fullName, bio, image];
}
