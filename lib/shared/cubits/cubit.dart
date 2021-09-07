import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/shared/cubits/states.dart';




class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;


  bool isDark =false;
  void changeAppMode({bool fromShared}){
    if(fromShared!= null){
      isDark= fromShared;
      emit(NewsAppChangeModeState());
    }

    else{
      isDark=! isDark;
      CacheHelper.putBoolean('isDark', isDark).then((value) {
        emit(NewsAppChangeModeState());
      });
    }

  }

}