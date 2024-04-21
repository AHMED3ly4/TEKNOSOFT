import 'package:e_commerce/features/home/domain/use_cases/get_brands.dart';
import 'package:e_commerce/features/home/domain/use_cases/get_categories.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeCubit extends Cubit<HomeStates>{
  final GetCategories categories ;
  final GetBrands brands;
  HomeCubit(this.categories, this.brands):super(HomeInitial());

  Future<void> getCategories()async{
    emit(GetCategoriesLoading());
    final result = await categories();
    result.fold(
            (failure) => emit(GetCategoriesError(errorMessage: failure.message)),
            (categories) => emit(GetCategoriesSuccess(categories: categories)),
    );
  }

  Future<void> getBrands()async{
    emit(GetBrandsLoading());
    final result = await brands();
    result.fold(
            (failure) => emit(GetBrandsError(errorMessage: failure.message)),
            (brands) => emit(GetBrandsSuccess(brands: brands)),
    );
  }

}