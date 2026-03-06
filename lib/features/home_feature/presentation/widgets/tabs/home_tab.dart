import 'package:flutter/material.dart';

import '../../../../../core/theme/dimens.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/widgets/app_title_widget.dart';
import '../../screens/categories_screen.dart';
import '../../screens/special_offers.dart';
import '../banner_slider_widget.dart';
import '../categories_list.dart';
import '../products_list.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppTitleWidget(
            onPressed: () {
              appPush(context, SpecialOffers());
            },
            title: 'Special offers',
          ),
          BannerSliderWidget(),
          AppTitleWidget(
            onPressed: () {
              appPush(context, CategoriesScreen());
            },
            title: 'Categories',
          ),
          CategoriesList(),
          ProductsList(),
          SizedBox(height: Dimens.largePadding),
        ],
      ),
    );
  }
}
