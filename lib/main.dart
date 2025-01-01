import 'package:e_commerce/data/repository/category_repo_impl.dart';
import 'package:e_commerce/features/onboarding/on_boarding_view.dart';
import 'package:e_commerce/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  
  final url = dotenv.env['URL'] ?? '';
  final anonKey = dotenv.env['ANON_KEY'] ?? '';
  await Supabase.initialize(
    url: url,
    anonKey: anonKey,
  );
  final repo = CategoryRepoImpl(Supabase.instance);
  repo.getCategories().then((onValue){print(onValue);});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const Scaffold(
        body: OnBoardingView(),
      ),
    );
  }
}
