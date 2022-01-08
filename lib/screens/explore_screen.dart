import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Explorescreen build');
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        print('Explorescreen build builder');
        // TODO: Add Nested List Views
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          print('Explorescreen build builder if');
          print(recipes);
          return TodayRecipeListView(recipes: recipes);
        } else {
          print('Explorescreen build builder else');
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
