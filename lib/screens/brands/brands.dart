import 'package:eazy_techno_application/screens/widgets/image_shower.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../../package/package/package.dart';
import 'e_brands.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  BrandsCubit get cubit => getIt<BrandsCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: "Brands"),
      body: BlocBuilder<BrandsCubit, BrandsState>(
        bloc: cubit,
        builder: (context, state) {
          var brands = cubit.brandRepository.getBrands();
          return CustomScrollView(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: brands.length,
                  (context, index) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: () {
                        //TODO:show brand items
                      },
                      child: Card(
                        elevation: 5,
                        shadowColor: Colors.purpleAccent.shade100,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Card(
                              elevation: 0,
                              child: SizedBox(
                                  height: getScreenHeight(60),
                                  child:
                                      ImageShower(imageUrl: brands[index].image)
                                  // ClipRRect(
                                  //   borderRadius: BorderRadius.circular(10),
                                  //   child: Image.asset(
                                  //     brands[index].image,
                                  //     fit: BoxFit.fill,
                                  //   ),
                                  // ),
                                  ),
                            ),
                            Center(
                              child: FittedBox(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 10, 5, 12),
                                  child: Text(
                                    brands[index].brandName,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 15,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
