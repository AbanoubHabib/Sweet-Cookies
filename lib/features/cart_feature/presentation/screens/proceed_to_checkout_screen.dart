import 'package:cookies_shop/features/cart_feature/presentation/screens/payment_methods_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_divider.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_svg_viewer.dart';
import '../../../../core/widgets/bordered_container.dart';
import '../../../../core/widgets/general_app_bar.dart';
import '../widgets/orders_list_for_checkout.dart';
import '../widgets/payment_details_item.dart';
import 'change_address_screen.dart';

class ProceedToCheckoutScreen extends StatelessWidget {
  const ProceedToCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTypography = context.theme.appTypography;
    final appColors = context.theme.appColors;
    return AppScaffold(
      appBar: GeneralAppBar(title: 'Proceed To Checkout'),
      body: SingleChildScrollView(
        child: Column(
          spacing: Dimens.largePadding,
          children: [
            SizedBox.shrink(),
            BorderedContainer(
              padding: EdgeInsets.symmetric(horizontal: Dimens.largePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimens.largePadding,
                    ),
                    child: Text(
                      'Payment details',
                      style: appTypography.bodyLarge.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  AppDivider(),
                  PaymentDetailsItem(
                    title: 'Product Price',
                    subtitle: '\$ 98.00',
                  ),
                  PaymentDetailsItem(title: 'Delivery', subtitle: '\$ 10.00'),
                  PaymentDetailsItem(title: 'Discount', subtitle: '\$ 10.00'),
                  Text(
                    ' - - - - - - - -' * 10,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(color: appColors.gray2),
                  ),
                  PaymentDetailsItem(title: 'Total Cost', subtitle: '\$ 98.00'),
                ],
              ),
            ),
            BorderedContainer(
              padding: EdgeInsets.symmetric(horizontal: Dimens.largePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Dimens.padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Destination address',
                          style: appTypography.bodyLarge.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        BorderedContainer(
                          borderColor: appColors.primary,
                          borderRadius: Dimens.smallCorners,
                          child: InkWell(
                            onTap: () {
                              appPush(context, ChangeAddressScreen());
                            },
                            borderRadius: BorderRadius.circular(
                              Dimens.smallCorners,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(Dimens.padding),
                              child: Text(
                                'Change Address',
                                style: TextStyle(color: appColors.primary),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimens.largePadding),
                  AppDivider(),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: Dimens.smallPadding,
                    ),
                    leading: AppSvgViewer(
                      Assets.icons.location,
                      color: appColors.primary,
                    ),
                    title: Text(
                      'Montgomery Street Country Street East Pkwy',
                      style: appTypography.titleSmall.copyWith(
                        color: appColors.gray4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Orders list',
                    style: appTypography.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: Dimens.largePadding),
                  AppDivider(),
                  OrdersListForCheckout(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: Dimens.largePadding,
          right: Dimens.largePadding,
          bottom: Dimens.padding,
        ),
        child: AppButton(
          onPressed: () {
            appPush(context, PaymentMethodsScreen());
          },
          title: 'Continue To Payment',
          textStyle: appTypography.bodyLarge,
          borderRadius: Dimens.corners,
          margin: EdgeInsets.symmetric(vertical: Dimens.largePadding),
        ),
      ),
    );
  }
}
