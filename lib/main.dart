import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/data/data_source/app_local_data_source.dart';
import 'app/presentation/pages/spu_social_media.dart';
import 'core/routing/app_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final AppLocalDataSource appLocalDataSource = AppLocalDataSourceImpl();
  final bool isLoggedIn = await appLocalDataSource.isLoggedIn;
  runApp(
    SPUSocialMedia(
      appRouter: AppRouter(isLoggedIn: isLoggedIn),
    ),
  );
}
