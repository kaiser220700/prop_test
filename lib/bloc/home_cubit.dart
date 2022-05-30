import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_propcom_home/model/post.dart';
import 'package:flutter_propcom_home/model/post_type.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  void onSlectType(PostType postType) {
    emit(state.copyWith(postType: postType));
  }
}

