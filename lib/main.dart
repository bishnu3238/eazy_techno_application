//colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

 import 'package:eazy_techno_application/utils/utilities/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'firebase_options.dart';
import 'screens/application/application.dart';
import 'utils/utils/utils.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory());

  Bloc.observer = AppBlocObserver();

  await getItInitialize();

  runApp(const Application());
}
