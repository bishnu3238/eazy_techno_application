import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../domain/repositories/repository.dart';
import 'e_brands.dart';

class BrandsCubit extends Cubit<BrandsState>{

  final BrandRepository brandRepository;
  BrandsCubit(this.brandRepository): super(BrandsInitialState());

}