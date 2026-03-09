import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/books/models/author_detail_response.dart';

class AuthorDetailModel extends Equatable {
  final int? id;
  final String? fullName;
  final String? bio;
  final String? image;

    const AuthorDetailModel({this.id, this.fullName, this.bio, this.image});

  factory AuthorDetailModel.fromResponse(AuthorDetailResponse response) {
    return AuthorDetailModel(
      id: response.id,
      fullName: response.fullName,
      bio: response.bio,
      image: response.image,
    );
  }

  @override
  List<Object?> get props => [id, fullName, bio, image];
}
