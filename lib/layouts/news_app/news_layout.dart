import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_app/cubit/cubit.dart';
import 'package:news_app/layouts/news_app/cubit/states.dart';
import 'package:news_app/modules/search/search_Screen.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/components/component.dart';
import 'package:news_app/shared/cubits/cubit.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
var cubit= NewsCubit.get(context);
return Scaffold(
  appBar:AppBar(
    title: Text('News App'),
    actions: [IconButton(onPressed:() {
    navigateTo(context, SearchScreen());
    },
      icon: Icon(Icons.search)),
    IconButton(onPressed:() {
      AppCubit.get(context).changeAppMode();
    },
        icon: Icon(Icons.brightness_4_outlined))
    ],
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: (){
    //GET https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
     //api key= //f53a9bcc7972416e83689e8890fadbb9
    //search  https://newsapi.org/v2/everything?q=tesla&apiKey=f53a9bcc7972416e83689e8890fadbb9
    },
    child: Icon(Icons.add),

  ),
  body: cubit.screens[cubit.currentIndex],
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: cubit.currentIndex,
    onTap: (index){
cubit.changeBottomNavBar(index);
    },
    items: cubit.bottomItems ,
  ),
);
      },
    );
  }
}
