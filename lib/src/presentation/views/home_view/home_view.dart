import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../config/themes/app_colors.dart';
import '../../../config/themes/app_styles.dart';
import '../../../domain/models/news_model/news_model.dart';
import '../../providers/news_provider.dart';
import '../../widgets/loader_widget.dart';
import '../../widgets/news_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Container(
            color: AppColors.blue,
          ),
        ),
        title: Text(
          LocaleKeys.title.tr(),
          style: AppStyles.s24w500.copyWith(
            color: AppColors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final appleNewsProviderState = ref.watch(appleNewsProvider);

          return Container(
            child: appleNewsProviderState.when(
              data: (data) {
                return _buildNewsList(context, newsList: data);
              },
              error: (error, stackTrace) {
                return ErrorWidget(error);
              },
              loading: () => const Center(
                child: LoaderWidget(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNewsList(BuildContext context,
      {required List<NewsModel> newsList}) {
    return ListView.builder(
      itemCount: newsList.length,
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        return NewsCard(news: newsList[index]);
      },
    );
  }
}
