import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kostrushapp/data/enum/transaction_status_enum.dart';
import 'package:kostrushapp/presentation/components/chip/tag_chip.dart';
import 'package:kostrushapp/res/assets/image_asset_constant.dart';
import 'package:kostrushapp/utils/extensions/enum_ext.dart';

import '../../themes/color_theme.dart';
import '../../themes/typography_theme.dart';

/// Class ini digunakan untuk membuat card transaksi
class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.name,
    required this.address,
    required this.price,
    required this.status,
    this.onTap,
  });

  final String name, address;
  final Function()? onTap;
  final int price;
  final TransactionStatusEnum status;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: Image.asset(
                  ImageAssetConstant.dormPlaceholder,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TypographyTheme.labelMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(4),
                    Text(
                      address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(8),
                    UnconstrainedBox(child: _tagBuilder()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tagBuilder() {
    switch (status) {
      case TransactionStatusEnum.pending:
        return TagChip.filled(
          text: status.value,
        );
      case TransactionStatusEnum.processing:
        return TagChip.outlined(
          text: status.value,
          color: ColorsTheme.primaryColor[800],
        );
      case TransactionStatusEnum.done:
        return TagChip.filled(
          text: status.value,
          color: ColorsTheme.primaryColor,
        );
      default:
        return const SizedBox();
    }
  }
}
