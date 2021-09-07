import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/webview/webView_Screen.dart';

Widget buildArticleItem(article, context)=> InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        Container(
  
          width: 120.0,height: 120.0,
  
          decoration: BoxDecoration(
  
            borderRadius: BorderRadius.circular(10.0),
  
            image:DecorationImage( image:NetworkImage(
  
              '${article['urlToImage']}',
  
            ),
  
              fit: BoxFit.cover,
  
            ),
  
          ),
  
  
  
  
  
        ),
  
        SizedBox(width: 20.0),
  
        Expanded(
  
          child: Container(
  
            height: 120.0,
  
            child: Column(
  
              mainAxisAlignment: MainAxisAlignment.start,
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              mainAxisSize: MainAxisSize.min,
  
              children: [
  
                Expanded(child: Text(
  
                  '${article['title']}',style: Theme.of(context).textTheme.bodyText1,
  
                  maxLines: 3,
  
                  overflow: TextOverflow.ellipsis,
  
                ),
  
                ),
  
                Text('${article['publishedAt']}',style: TextStyle(color: Colors.grey),),
  
              ],
  
            ),
  
          ),
  
        )
  
  
  
      ],
  
    ),
  
  ),
);

Widget myDivider()=>Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget articleBuilder(list,context)=>ConditionalBuilder(condition: list.length>0 ,
  builder: (context)=>ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder:(context,index)=>buildArticleItem(list[index],context),
      separatorBuilder: (context, index)=>myDivider(),
      itemCount: 20),
  fallback: (context)=>Center(child: CircularProgressIndicator()),);

Widget defaultTextForm({
  @required TextEditingController controller,
  @required TextInputType type,
  @required String Label,
  @required Function validate,
  @required IconData prefix,
  bool isPassword = false,
  IconData suffix,
  Function suffixPressed,
  Function onSubmit,
  Function onChange,
  Function onTape,
  //bool isClickable = true,


})=> TextFormField
      (
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTape,
      validator: validate,
      //  enabled: isClickable,
      decoration: InputDecoration(
        labelText: Label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix!= null ?IconButton(onPressed: suffixPressed,icon: Icon(suffix)):null,
        border:OutlineInputBorder(),
      ),
    );

void navigateTo (context,Widget)=> Navigator.push(context,
    MaterialPageRoute(
        builder: (context)=>Widget
        )
    );