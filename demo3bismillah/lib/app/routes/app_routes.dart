import 'package:go_router/go_router.dart';
import 'package:demo3bismillah/app/modules/home/home_binding.dart';
import 'package:demo3bismillah/app/modules/home/home_screen.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          // Mengikat controller ke view menggunakan GetX Binding
          HomeBinding().dependencies();
          return const HomeScreen();
        },
      ),
    ],
  );
}