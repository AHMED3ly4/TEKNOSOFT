import 'package:e_commerce/features/favourite/domain/use_cases/add_to_favourite.dart';
import 'package:e_commerce/features/favourite/domain/use_cases/get_favourite.dart';
import 'package:e_commerce/features/favourite/domain/use_cases/remove_from_favourite.dart';
import 'package:e_commerce/features/favourite/presentation/cubit/favourite_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class FavouriteCubit extends Cubit<FavouriteStates>{
  FavouriteCubit(this.getFavouriteUC, this.addToFavouriteUC, this.removeFromFavouriteUC): super(FavouriteInitial());

  final GetFavourite getFavouriteUC;
  final AddToFavourite addToFavouriteUC;
  final RemoveFromFavourite removeFromFavouriteUC;

  Future<void> getUserFavourite()async {
    emit(FavouriteLoading());
    final result = await getFavouriteUC();
    result.fold(
            (failure) => emit(GetFavouriteError(failure.message)),
            (product) => emit(GetFavouriteSuccess(product)),
    );
  }

  Future<void> addToFavourite(String productId)async {
    emit(FavouriteLoading());
    final result = await addToFavouriteUC(productId);
    result.fold(
          (failure) => emit(AddToFavouriteError(failure.message)),
          (_) => emit(AddToFavouriteSuccess()),
    );
  }

  Future<void> removeFromFavourite(String productId)async {
    emit(FavouriteLoading());
    final result = await removeFromFavouriteUC(productId);
    result.fold(
          (failure) => emit(RemoveFromFavouriteError(failure.message)),
          (_) => emit(RemoveFromFavouriteSuccess()),
    );
  }
}