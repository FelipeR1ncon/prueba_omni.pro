import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo(this.title, this.url, this.thumbnailUrl);

  @override
  List<Object?> get props => [title, url, thumbnailUrl];
}
