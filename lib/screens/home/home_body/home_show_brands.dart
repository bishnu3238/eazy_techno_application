import 'package:eazy_techno_application/domain/entities/brands.dart';
import 'package:eazy_techno_application/package/custom_button/view_all_button.dart';
import 'package:eazy_techno_application/screens/brands/brands_initial_params.dart';
import 'package:eazy_techno_application/screens/home/home_bloc.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../package/package/package.dart';

class HomeShowBrands extends StatelessWidget {
  final HomeBloc _bloc;
  const HomeShowBrands(this._bloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          List<Brands> brands = _bloc.brandRepository.getBrands();
          return Column(
            children: [
              HeadLine(
                headline: "Brands",
                button: ViewAllButton(
                    onTap: () =>
                        _bloc.navigator.openBrands(BrandsInitialParams())),
              ),
              SizedBox(
                height: getScreenHeight(120),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: brands.length,
                  itemBuilder: (ctx, index) {
                    var brand = brands[index];
                    return CardImgWithTitle(
                      brand: brand,
                      onTap: () {
                        'hello'.log();
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
