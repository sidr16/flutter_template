import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/models/news_model/news_model.dart';
import '../../../utils/formatter.dart';
import '../../providers/news_provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appleNewsProviderState = ref.watch(appleNewsProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 60,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        title: const Text(
          'Apple news',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: appleNewsProviderState.when(
          data: (data) {
            return _buildNewsList(context, newsList: data);
          },
          error: (error, stackTrace) {
            return ErrorWidget(error);
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget _buildNewsList(BuildContext context,
      {required List<NewsModel> newsList}) {
    return ListView.builder(
      itemCount: newsList.length,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 120,
        bottom: 20,
      ),
      itemBuilder: (context, index) {
        return _buildNewsCard(
          context,
          news: newsList[index],
        );
      },
    );
  }

  Widget _buildNewsCard(BuildContext context, {required NewsModel news}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage,
              width: double.infinity,
              height: 200 * (1 / 375 * MediaQuery.of(context).size.width),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(news.author),
              Text(
                TimeFormatter.handleData(
                  news.publishedAt,
                  DateFormat('hh:mm, d.MM.y'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            news.title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            news.content,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
