import 'package:flutter/material.dart';
import 'package:news_app/Utils/app_color.dart';
import 'package:news_app/Utils/app_styles.dart';

import '../../api/api_manager.dart';

class MainErrorWidget extends StatelessWidget {

  final String errorMessage ;
  final VoidCallback onPressed ;

  const MainErrorWidget({super.key , required this.errorMessage
  , required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text( errorMessage ,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        ElevatedButton(onPressed: onPressed,
          child: Text('Try again' ,
            style: AppStyle.medium20Black,
          ),
        )
      ],
    );
  }
}
