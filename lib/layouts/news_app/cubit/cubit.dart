import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_app/cubit/states.dart';
import 'package:news_app/modules/business/business_Screen.dart';
import 'package:news_app/modules/science/science_Screen.dart';
import 'package:news_app/modules/setting/setting_Screen.dart';
import 'package:news_app/modules/sports/sports_Screen.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit({NewsStates state}) : super(NewsInitialState());

  static NewsCubit get(context)=> BlocProvider.of(context);
int currentIndex=0;
List<BottomNavigationBarItem> bottomItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.business),
    label:'Business',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.sports),
    label:'Sports',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.science),
    label:'Science',
  ),

];
List<Widget>screens=[
  BusinessScreen(),
SportsScreen(),
  ScienceScreen(),


  ];

void changeBottomNavBar(int index){
  currentIndex = index;
  if(index==1)
    getSports();
  if(index==2)
    getScience();
  emit(NewsBottomNavState());
}
List<dynamic>business=[];
void getBusiness(){
  emit(NewsGetBusinessLoadingState());
  DioHelper.getData(url: 'v2/top-headlines',
      query: {
        'country': 'eg' ,
        'category': 'business',
        'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
      }).then((value) {

    business=value.data['articles'];
    print(business[0]['title']);
    emit(NewsGetBusinessSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(NewsGetBusinessErrorState(error.toString()));
  });


}

  List<dynamic>sports=[];
  void getSports(){
    emit(NewsGetSportsLoadingState());
    if (sports.length==0)
      {

        DioHelper.getData(url: 'v2/top-headlines',
            query: {
              'country': 'eg' ,
              'category': 'sports',
              'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
            }).then((value) {

          sports=value.data['articles'];
          print(sports[0]['title']);
          emit(NewsGetSportsSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));
        });
      } else{
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic>science=[];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    if (science.length==0){
      DioHelper.getData(url: 'v2/top-headlines',
          query: {
            'country': 'eg' ,
            'category': 'science',
            'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
          }).then((value) {

        science=value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else{
      emit(NewsGetScienceSuccessState());
    }
  }


  List<dynamic>search=[];
  void getSearch(String value){
    emit(NewsGetSearchLoadingState());
    search =[];
    DioHelper.getData(url: 'v2/everything',
        query: {
          'q': '$value',
          'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
        }).then((value) {

      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

}}