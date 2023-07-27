import 'package:auto_size_text/auto_size_text.dart';
import 'package:eazy_techno_application/domain/entities/entities.dart';
import 'package:eazy_techno_application/screens/home/e_home.dart';
import 'package:eazy_techno_application/screens/widgets/image_shower.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../package/package/package.dart';

class HomeShowOurProducts extends StatelessWidget {
  final HomeBloc _bloc;

  const HomeShowOurProducts(this._bloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          List<Items> items = _bloc.itemRepository.getItems();

          List<GridViewModel> children =
              items.map((e) => e.toGridViewModel()).toList();
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                HeadLine(
                  headline: "Our Products",
                  button: ViewAllButton(onTap: () {}),
                ),
                CardGridViewBuilder(
                  crossAxisCount: 2,
                  mainAxisPadding: 1,
                  crossAxisPadding: 0,
                  childAspectRatio: 0.5,
                  children: children,
                  builder: (BuildContext context, int index) => Stack(
                    children: [
                      CardGridViewWithDetails(items: children[index]),
                      const Positioned(
                        top: 5,
                        right: 5,
                        child: FavIcon(icon: FontAwesomeIcons.cartPlus),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
