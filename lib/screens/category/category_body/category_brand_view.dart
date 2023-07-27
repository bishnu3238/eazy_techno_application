import 'package:eazy_techno_application/screens/category/e_category.dart';
import 'package:flutter/material.dart';

class CategoryBrandView extends StatelessWidget {
  final CategoryCubit cubit;
  const CategoryBrandView(this.cubit, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: show brands
    return SliverToBoxAdapter(
      child: Text(""),
    );
  }
}
