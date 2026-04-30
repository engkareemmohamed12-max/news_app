import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  List articles = [];

  bool loading = false;
  bool isLoadingMore = false;

  int page = 1;
  final int pageSize = 10;

  String currentQuery = "";

  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200 &&
          !isLoadingMore &&
          !loading) {
        loadMore();
      }
    });
  }

  ///  First Load
  Future<void> searchNews(String keyword) async {
    if (keyword.isEmpty) {
      setState(() {
        articles = [];
      });
      return;
    }

    setState(() {
      loading = true;
      page = 1;
      currentQuery = keyword;
    });

    final url = Uri.https(
      "newsapi.org",
      "/v2/everything",
      {
        "q": keyword,
        "page": page.toString(),
        "pageSize": pageSize.toString(),
        "apiKey": "2b2d1f41ba634974b8ee9ba0c0ad689b",
      },
    );

    final response = await http.get(url);
    final data = jsonDecode(response.body);

    setState(() {
      articles = data["articles"] ?? [];
      loading = false;
    });
  }

  ///  Load More
  Future<void> loadMore() async {
    if (currentQuery.isEmpty) return;

    setState(() => isLoadingMore = true);

    page++;

    final url = Uri.https(
      "newsapi.org",
      "/v2/everything",
      {
        "q": currentQuery,
        "page": page.toString(),
        "pageSize": pageSize.toString(),
        "apiKey": "YOUR_API_KEY",
      },
    );

    final response = await http.get(url);
    final data = jsonDecode(response.body);

    setState(() {
      articles.addAll(data["articles"] ?? []);
      isLoadingMore = false;
    });
  }

  ///  Debounce
  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchNews(value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("Search News")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ///  Search
            TextField(
              controller: controller,
              onChanged: onSearchChanged,
              decoration: InputDecoration(
                hintText: "Search news...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 16),

            ///  Results
            Expanded(
              child: loading
                  ? const Center(child: CircularProgressIndicator())
                  : articles.isEmpty
                  ? const Center(child: Text("No results"))
                  : ListView.builder(
                controller: scrollController,
                itemCount:
                articles.length + (isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == articles.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                          child: CircularProgressIndicator()),
                    );
                  }

                  final news = articles[index];

                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * 0.02,
                        vertical: height * 0.01),
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
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                          BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl:
                            news["urlToImage"] ?? '',
                            height: height * 0.22,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          news["title"] ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge,
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'By : ${news["author"] ?? "Unknown"}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall,
                              ),
                            ),
                            Text(
                              news["publishedAt"] != null
                                  ? timeago.format(
                                  DateTime.parse(
                                      news["publishedAt"]))
                                  : '',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}