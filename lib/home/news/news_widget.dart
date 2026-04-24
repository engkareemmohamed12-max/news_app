import 'package:flutter/material.dart';
import 'package:news_app/Utils/app_styles.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/home/widget/main_error_widget.dart';
import 'package:news_app/home/widget/main_loading_widget.dart';
import 'package:news_app/model/new_response.dart';
import 'package:news_app/model/source_response.dart';

import '../../Utils/screen_utils.dart';

class NewsWidget extends StatefulWidget {

  final Sources source ;
  const NewsWidget({super.key , required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {

    var width = context.width;
    var height = context.height;

    return FutureBuilder<NewResponse>(
        future: ApiManager.getNewsBySourceID(widget.source.id??''),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return MainLoadingWidget();
          }else if(snapshot.hasError){
            return MainErrorWidget(
                errorMessage: 'Something went wrong',
                onPressed: (){
                  ApiManager.getNewsBySourceID(widget.source.id?? '');
                }
            );
          }
          else if(snapshot.data?.status == 'error'){
            return MainErrorWidget(
                errorMessage: snapshot.data!.message!,
                onPressed: (){
                  ApiManager.getNewsBySourceID(widget.source.id?? '');
                  setState(() {

                  });
                }
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return newsList.isEmpty ? 
            Center(child: Text('No News Found' , style: Theme.of(context).textTheme.labelLarge,) )
          : ListView.separated(
              itemBuilder: (context, index) {
                return NewsItem(news: newsList[index]);
              },
                separatorBuilder: (context, index) {
                return SizedBox(height: height*0.02,);

                } ,
              itemCount: newsList.length,

          );
        },
    );
  }
}
