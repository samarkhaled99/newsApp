import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_app/cubit/cubit.dart';
import 'package:news_app/layouts/news_app/cubit/states.dart';
import 'package:news_app/shared/components/component.dart';

class BusinessScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder: (context,state){
        var list= NewsCubit.get(context).business;
        return articleBuilder(list,context);
      },
    ) ;
  }
}
//f53a9bcc7972416e83689e8890fadbb9

//GET https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY

//https://newsapi.org/docs
