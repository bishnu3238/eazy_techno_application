import 'package:eazy_techno_application/domain/entities/entities.dart';
import 'package:eazy_techno_application/package/custom_button/view_all_button.dart';
import 'package:eazy_techno_application/screens/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../package/package/package.dart';

class HomeShowBestSeller extends StatelessWidget {
  final HomeBloc _bloc;
  const HomeShowBestSeller(this._bloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          List<Items> items = _bloc.itemRepository.getBestSellerItems();
          List<GridViewModel> children =
              items.map((e) => e.toGridViewModel()).take(4).toList();
          return Column(
            children: [
              HeadLine(
                headline: "Best Seller",
                button: ViewAllButton(onTap: () {}),
              ),
              SizedBox(
                height: getScreenHeight(400),
                child: CardGridViewBuilder(
                  crossAxisCount: 2,
                  children: children,
                  builder: (BuildContext context, int index) =>
                      CardGridViewTile(info: children[index]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
