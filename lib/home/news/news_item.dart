import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Utils/app_color.dart';
import 'package:news_app/Utils/screen_utils.dart';
import 'package:news_app/home/widget/main_loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

import '../../model/new_response.dart';
import '../../providers/theme_provider.dart';

class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) {
            return Container(
              height: height * 0.35,
              decoration: BoxDecoration(
                color: themeProvider.isDark
                    ? AppColors.blackColor
                    : AppColors.whiteColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 🔽 IMAGE
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                      vertical: height * 0.015,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: height * 0.18,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: news.urlToImage ?? '',
                          placeholder: (context, url) =>
                          const MainLoadingWidget(),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),

                  /// 🔽 TITLE
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: Text(
                      news.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.isDark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// 🔽 BUTTON
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeProvider.isDark
                              ? Colors.white
                              : Colors.black,
                          foregroundColor: themeProvider.isDark
                              ? Colors.black
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (news.url != null && news.url!.isNotEmpty) {
                            _launchUrl(news.url!);
                          }
                        },
                        child: const Text("View More Item"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },

      ///  CARD ITEM
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.02),
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).splashColor,
            width: 2,
          ),
        ),
        child: Column(
          spacing: height * 0.02,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) => const MainLoadingWidget(),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),

            Text(
              news.title ?? '',
              style: Theme.of(context).textTheme.labelLarge,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'By : ${news.author}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
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
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}