import 'package:flutter/material.dart';

import '../../../../core/widgets/app_text_field.dart';

class CouponInput extends StatelessWidget {
  const CouponInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppTextField(hint: 'Promo Code');
  }
}
