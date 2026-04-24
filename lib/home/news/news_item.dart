import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Utils/screen_utils.dart';
import 'package:news_app/home/widget/main_loading_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../model/new_response.dart';

class NewsItem extends StatelessWidget {
  final News news ;
  const NewsItem({super.key , required this.news});

  @override
  Widget build(BuildContext context) {

    var width = context.width;
    var height = context.height;

    return Container(

      margin: EdgeInsets.symmetric(
        horizontal: width*0.02,

      ),
      padding: EdgeInsets.symmetric(
        horizontal: width*0.02,
            vertical: height*0.02
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).splashColor ,
          width: 2
        )
      ),
      child: Column(
        spacing: height*0.02,
        children: [

          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage??'',
              placeholder:(context, url) => MainLoadingWidget() ,
                errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(news.title??'' , style: Theme.of(context).textTheme.labelLarge,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text('By : ${news.author}' , style: Theme.of(context).textTheme.labelSmall,)),
              Text(
                news.publishedAt != null
                    ? timeago.format(DateTime.parse(news.publishedAt!))
                    : '',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
