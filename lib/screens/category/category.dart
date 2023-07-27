import 'package:eazy_techno_application/app_constants/app_constant.dart';
import 'package:eazy_techno_application/domain/entities/categories.dart';
import 'package:eazy_techno_application/screens/category/e_category.dart';
import 'package:eazy_techno_application/screens/widgets/app_bottom_nav_bar.dart';
import 'package:eazy_techno_application/screens/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../package/package/package.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryCubit cubit;
  const CategoryScreen({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: cubit.state.categoryScaffoldKey,
      drawer: const AppDrawer(drawerItems: []),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          List<Categories> categories = cubit.categoryRepository.getCategory();
          return CustomScrollView(
            slivers: [
              CategoryAppBar(cubit),
              CategoryListView(cubit),
              CategoryBrandView(cubit),
            ],
          );
        },
      ),
      bottomNavigationBar: AppBottomNavigationBar((index) {
        cubit.navigator.context = context;
        return cubit.handelNavigateFromBottomNavBar(index);
      }),
    );
  }
}
