import 'package:flutter/material.dart';
import 'package:social_app/core/routing/app_router.dart';
import 'package:social_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


import 'app/presentation/pages/spu_social_media.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( SPUSocialMedia(appRouter: AppRouter(),));
}

