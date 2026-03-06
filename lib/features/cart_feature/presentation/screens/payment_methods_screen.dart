import 'package:flutter/material.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/utils/check_theme_status.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_divider.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/general_app_bar.dart';
import '../widgets/payment_item_widget.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTypography = context.theme.appTypography;
    return AppScaffold(
      appBar: GeneralAppBar(title: 'Payment methods'),
      body: SingleChildScrollView(
        child: Column(
          spacing: Dimens.largePadding,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentItemWidget(
              onTap: () {},
              title: 'Cash',
              iconPath: Assets.icons.money3,
            ),
            PaymentItemWidget(
              onTap: () {},
              title: 'Wallet',
              iconPath: Assets.icons.wallet,
            ),
            SizedBox.shrink(),
            Text('Add a credit card', style: appTypography.bodyLarge),
            PaymentItemWidget(
              onTap: () {},
              title: 'Add card',
              iconPath: Assets.icons.card,
              showRadio: false,
            ),
            SizedBox.shrink(),
            Text('More payment options', style: appTypography.bodyLarge),
            Column(
              children: [
                PaymentItemWidget(
                  onTap: () {},
                  title: 'PayPal',
                  logoPath:
                      checkDarkMode(context) ? null : Assets.icons.paypalLogo,
                  showBorder: false,
                ),
                AppDivider(),
                PaymentItemWidget(
                  onTap: () {},
                  title: 'Apple Pay',
                  logoPath:
                      checkDarkMode(context) ? null : Assets.icons.appleLogo,
                  showBorder: false,
                ),
                AppDivider(),
                PaymentItemWidget(
                  onTap: () {},
                  title: 'Google Pay',
                  logoPath:
                      checkDarkMode(context) ? null : Assets.icons.googleLogo,
                  showBorder: false,
                ),
              ],
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
          onPressed: () {},
          title: 'Payment confirmation',
          textStyle: appTypography.bodyLarge,
          borderRadius: Dimens.corners,
          margin: EdgeInsets.symmetric(vertical: Dimens.largePadding),
        ),
      ),
    );
  }
}
