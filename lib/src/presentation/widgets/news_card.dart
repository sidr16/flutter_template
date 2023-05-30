import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../config/themes/app_colors.dart';
import '../../config/themes/app_styles.dart';
import '../../domain/models/news_model/news_model.dart';
import '../../utils/formatter.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;

  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
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
            style: AppStyles.s20w600.copyWith(
              color: AppColors.blueAccent,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            news.content,
            style: AppStyles.s16w500,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
