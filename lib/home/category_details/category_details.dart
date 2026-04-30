import 'package:flutter/material.dart';
import 'package:news_app/Utils/app_color.dart';
import 'package:news_app/Utils/app_styles.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/category_details/sources/source_widget.dart';
import 'package:news_app/home/widget/main_error_widget.dart';
import 'package:news_app/home/widget/main_loading_widget.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/source_response.dart';

class CategoryDetails extends StatefulWidget {
final Category category ;
  const CategoryDetails({super.key , required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.category.id),
        builder:(context, snapshot) {

          //todo : loading
          if(snapshot.connectionState == ConnectionState.waiting){

            return MainLoadingWidget();

          } else if(snapshot.hasError){

            return MainErrorWidget(
                errorMessage: 'Something went wrong',
                onPressed: (){
                  ApiManager.getSources(widget.category.id);
                  setState(() {

                  });
                }
            );
          }


          //todo : server => response => success , error

          if(snapshot.data?.status != 'ok'){
            //todo : response => error
            return MainErrorWidget(
                errorMessage: snapshot.data!.message!,
                onPressed: (){
                  ApiManager.getSources(widget.category.id);
                  setState(() {

                  });
                }
            );
          }

          //todo: server => success

          List<Sources> sourceList = snapshot.data?.sources ?? [];
          return SourceWidget(sourcesList: sourceList);

        },
    );
  }
}
