import 'package:eazy_techno_application/package/package/package.dart';
import 'package:eazy_techno_application/screens/category/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../domain/entities/categories.dart';
import '../../widgets/widget.dart';

class CategoryListView extends StatelessWidget {
  final CategoryCubit cubit;
  const CategoryListView(this.cubit, {super.key});

  List<Categories> get categories => cubit.categoryRepository.getCategory();
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: categories.length,
        (context, index) {
          var category = categories[index];
          return ListTile(
              onTap: () {},
              leading: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ImageShower(
                  imageUrl: category.image,
                  height: 40,
                  width: 40,
                ),
              ),
              title: Text(
                category.categoryName,
              ),
              trailing: FavIcon(
                icon: FontAwesomeIcons.angleRight,
                size: 15,
                onTap: () {},
              ));
        },
      ),
    );
  }
}
