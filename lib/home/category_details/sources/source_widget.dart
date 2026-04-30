import 'package:flutter/material.dart';
import 'package:news_app/Utils/app_color.dart';
import 'package:news_app/home/category_details/sources/source_name.dart';
import 'package:news_app/home/news/news_widget.dart';
import 'package:news_app/model/source_response.dart';

import '../../../Utils/screen_utils.dart';

class SourceWidget extends StatefulWidget {

  final List<Sources> sourcesList ;


   SourceWidget({super.key , required this.sourcesList});

  @override
  State<SourceWidget> createState() => _SourceWidgetState();
}

class _SourceWidgetState extends State<SourceWidget> {
  int selectedIndex = 0 ;



  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          spacing: height*0.02,
          children: [
            TabBar
              (
              isScrollable: true,
                onTap: (index){

                selectedIndex = index ;
                setState(() {

                });

                },
                tabAlignment: TabAlignment.start,
                dividerColor: AppColors.transparentColor,
                indicatorColor: Theme.of(context).splashColor,
                tabs: widget.sourcesList.map( (source) {

              return SourceName(
                  source: source,
                  isSelected: selectedIndex == widget.sourcesList.indexOf(source)
              );

            },).toList()),
            Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex]))
          ],
        ),
    );
  }
}
