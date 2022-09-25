// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pill_reminder/model/medicine.dart' as _i6;
import '../pill_reminder/screen/add_pill_page.dart' as _i2;
import '../pill_reminder/screen/pill_list_page.dart' as _i1;
import '../pill_reminder/screen/update_pill_page.dart' as _i3;

class IAppRouter extends _i4.RootStackRouter {
  IAppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    PillListRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.PillListPage(),
        transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddPillRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.AddPillPage(),
        transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UpdatePillRoute.name: (routeData) {
      final args = routeData.argsAs<UpdatePillRouteArgs>();
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.UpdatePillPage(
          key: args.key,
          medicine: args.medicine,
        ),
        transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 400,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          PillListRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          AddPillRoute.name,
          path: '/add-pill-page',
        ),
        _i4.RouteConfig(
          UpdatePillRoute.name,
          path: '/update-pill-page',
        ),
      ];
}

/// generated route for
/// [_i1.PillListPage]
class PillListRoute extends _i4.PageRouteInfo<void> {
  const PillListRoute()
      : super(
          PillListRoute.name,
          path: '/',
        );

  static const String name = 'PillListRoute';
}

/// generated route for
/// [_i2.AddPillPage]
class AddPillRoute extends _i4.PageRouteInfo<void> {
  const AddPillRoute()
      : super(
          AddPillRoute.name,
          path: '/add-pill-page',
        );

  static const String name = 'AddPillRoute';
}

/// generated route for
/// [_i3.UpdatePillPage]
class UpdatePillRoute extends _i4.PageRouteInfo<UpdatePillRouteArgs> {
  UpdatePillRoute({
    _i5.Key? key,
    required _i6.Medicine medicine,
  }) : super(
          UpdatePillRoute.name,
          path: '/update-pill-page',
          args: UpdatePillRouteArgs(
            key: key,
            medicine: medicine,
          ),
        );

  static const String name = 'UpdatePillRoute';
}

class UpdatePillRouteArgs {
  const UpdatePillRouteArgs({
    this.key,
    required this.medicine,
  });

  final _i5.Key? key;

  final _i6.Medicine medicine;

  @override
  String toString() {
    return 'UpdatePillRouteArgs{key: $key, medicine: $medicine}';
  }
}
