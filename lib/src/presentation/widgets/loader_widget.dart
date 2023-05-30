import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../config/themes/app_colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitSpinningLines(
      color: AppColors.blue,
      size: 100,
      lineWidth: 4,
      itemCount: 8,
    );
  }
}
