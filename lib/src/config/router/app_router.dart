import 'package:go_router/go_router.dart';

import '../../presentation/views/home_view/home_view.dart';

final GoRouter appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'HomeView',
    builder: (context, state) {
      return const HomeView();
    },
  )
]);
