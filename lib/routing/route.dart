import 'package:auto_route/auto_route.dart';

import '../../pill_reminder/screen/add_pill_page.dart';
import '../../pill_reminder/screen/pill_list_page.dart';
import '../../pill_reminder/screen/update_pill_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(
      initial: true,
      page: PillListPage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      page: AddPillPage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 400,
    ),
    CustomRoute(
      page: UpdatePillPage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 400,
    ),
  ],
)
class $IAppRouter {}
