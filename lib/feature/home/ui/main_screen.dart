import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:radio_app/core/DI/dependancy_injection.dart';
import 'package:radio_app/feature/home/logic/station_cubit.dart';

import '../../../generated/l10n.dart';
import '../../favorite/ui/favorite_screen.dart';
import '../../settings/ui/settings_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    BlocProvider(create: (_) => getIt<StationCubit>(), child: HomeScreen()),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    S string = S.of(context);

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Bootstrap.house),
            selectedIcon: Icon(Bootstrap.house_fill),
            label: string.navigationBarTitleMain,
          ),
          NavigationDestination(
            icon: Icon(Bootstrap.heart),
            selectedIcon: Icon(Bootstrap.heart_fill),
            label: string.navigationBarTitleFavorites,
          ),
          NavigationDestination(
            icon: Icon(Bootstrap.gear),
            selectedIcon: Icon(Bootstrap.gear_fill),
            label: string.navigationBarTitleSettings,
          ),
        ],
      ),
    );
  }
}
