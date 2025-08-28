import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:radio_app/core/helper/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/l10n.dart';

Future<void> openLink(String url, BuildContext context) async {
  final uri = Uri.parse(url);
  try {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (e) {
    context.showAppSnackBar(
      S.of(context).failedToLoadConnection,
      backgroundColor: context.colorScheme.error,
      icon: FontAwesomeIcons.triangleExclamation,
      duration: const Duration(seconds: 2),
    );
    print(e.toString());
  }
}
