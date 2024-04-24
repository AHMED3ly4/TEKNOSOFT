
import 'package:e_commerce/features/products/domain/use_cases/getAllProducts.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState>{
  ProductsCubit(this.getProducts) : super(ProductsInitial());
  final GetAllProducts getProducts;

  Future<void> getAllProducts()async{
    emit(GetAllProductsLoading());
    final result =await getProducts();
    result.fold(
            (failure) => emit(GetAllProductsError(failure.message)),
            (products) => emit(GetAllProductsSuccess(products)),
    );
  }
}