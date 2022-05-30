part of '../../bloc/home_cubit.dart';

// ignore: must_be_immutable
class HomeState extends Equatable {
  PostType postType;
  HomeState({this.postType = PostType.ALL});

  HomeState copyWith ({
    PostType? postType,
  }) {
    return HomeState(
      postType: postType ?? this.postType
    );
  }
  @override
  List<Object?> get props => [postType];

}