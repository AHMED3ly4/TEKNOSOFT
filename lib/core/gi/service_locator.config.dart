// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_commerce/features/account/data/data_source/local/account_local_data_source.dart'
    as _i3;
import 'package:e_commerce/features/account/data/data_source/local/account_shared_pref_local_data_source.dart'
    as _i4;
import 'package:e_commerce/features/account/data/data_source/remote/account_api_data_source.dart'
    as _i10;
import 'package:e_commerce/features/account/data/data_source/remote/account_remote_data_source.dart'
    as _i9;
import 'package:e_commerce/features/account/data/repository/account_repository_imp.dart'
    as _i29;
import 'package:e_commerce/features/account/domain/repository/account_repository.dart'
    as _i28;
import 'package:e_commerce/features/account/domain/use_cases/add_address.dart'
    as _i44;
import 'package:e_commerce/features/account/domain/use_cases/get_addresses.dart'
    as _i45;
import 'package:e_commerce/features/account/domain/use_cases/get_user.dart'
    as _i46;
import 'package:e_commerce/features/account/domain/use_cases/remove_address.dart'
    as _i47;
import 'package:e_commerce/features/account/presentation/cubit/account_cubit.dart'
    as _i48;
import 'package:e_commerce/features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i15;
import 'package:e_commerce/features/auth/data/data_source/local/auth_shared_pref_local_data_source.dart'
    as _i16;
import 'package:e_commerce/features/auth/data/data_source/remote/auth_remote_api_data_Source.dart'
    as _i6;
import 'package:e_commerce/features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i5;
import 'package:e_commerce/features/auth/data/repository/auth_repository_imp.dart'
    as _i20;
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart'
    as _i19;
import 'package:e_commerce/features/auth/domain/use_cases/login.dart' as _i32;
import 'package:e_commerce/features/auth/domain/use_cases/register.dart'
    as _i33;
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i42;
import 'package:e_commerce/features/cart/data/data_source/cart_api_remote_data_source.dart'
    as _i14;
import 'package:e_commerce/features/cart/data/data_source/cart_remote_data_source.dart'
    as _i13;
import 'package:e_commerce/features/cart/data/repository/cart_repository_imp.dart'
    as _i24;
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart'
    as _i23;
import 'package:e_commerce/features/cart/domain/use_cases/add_to_cart.dart'
    as _i37;
import 'package:e_commerce/features/cart/domain/use_cases/clear_cart.dart'
    as _i38;
import 'package:e_commerce/features/cart/domain/use_cases/getCart.dart' as _i39;
import 'package:e_commerce/features/cart/domain/use_cases/remove_from_cart.dart'
    as _i40;
import 'package:e_commerce/features/cart/domain/use_cases/update_product_quantity.dart'
    as _i41;
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart'
    as _i43;
import 'package:e_commerce/features/favourite/data/data_sources/favourite_remote_api_data_source.dart'
    as _i12;
import 'package:e_commerce/features/favourite/data/data_sources/favourite_remote_data_source.dart'
    as _i11;
import 'package:e_commerce/features/favourite/data/repository/favourite_repository_imp.dart'
    as _i27;
import 'package:e_commerce/features/favourite/domain/repository/favourite_repository.dart'
    as _i26;
import 'package:e_commerce/features/favourite/domain/use_cases/add_to_favourite.dart'
    as _i49;
import 'package:e_commerce/features/favourite/domain/use_cases/get_favourite.dart'
    as _i50;
import 'package:e_commerce/features/favourite/domain/use_cases/remove_from_favourite.dart'
    as _i51;
import 'package:e_commerce/features/favourite/presentation/cubit/favourite_cubit.dart'
    as _i53;
import 'package:e_commerce/features/home/data/data_sources/home_api_remote_data_source.dart'
    as _i18;
import 'package:e_commerce/features/home/data/data_sources/home_remoe_data_source.dart'
    as _i17;
import 'package:e_commerce/features/home/data/repository/home_repository_imp.dart'
    as _i31;
import 'package:e_commerce/features/home/domain/repository/home_repository.dart'
    as _i30;
import 'package:e_commerce/features/home/domain/use_cases/get_brands.dart'
    as _i34;
import 'package:e_commerce/features/home/domain/use_cases/get_categories.dart'
    as _i35;
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart'
    as _i36;
import 'package:e_commerce/features/products/data/data_source/product_api_remote_data_source.dart'
    as _i8;
import 'package:e_commerce/features/products/data/data_source/products_remote_data_source.dart'
    as _i7;
import 'package:e_commerce/features/products/data/repository/products_repository_imp.dart'
    as _i22;
import 'package:e_commerce/features/products/domain/repository/products_repository.dart'
    as _i21;
import 'package:e_commerce/features/products/domain/use_cases/getAllProducts.dart'
    as _i25;
import 'package:e_commerce/features/products/presentation/cubit/products_cubit.dart'
    as _i52;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AccountLocalDataSource>(
        () => _i4.AccountSharedPrefLocalDataSource());
    gh.singleton<_i5.AuthRemoteDataSource>(() => _i6.AuthRemoteAPIDataSource());
    gh.singleton<_i7.ProductsRemoteDataSource>(
        () => _i8.ProductsAPIRemoteDataSource());
    gh.singleton<_i9.AccountRemoteDataSource>(
        () => _i10.AccountAPIDataSource());
    gh.singleton<_i11.FavouriteRemoteDataSource>(
        () => _i12.FavouriteRemoteAPIDataSource());
    gh.singleton<_i13.CartRemoteDataSource>(
        () => _i14.CartAPIRemoteDataSource());
    gh.singleton<_i15.AuthLocalDataSource>(
        () => _i16.AuthSharedPrefLocalDataSource());
    gh.singleton<_i17.HomeRemoteDataSource>(
        () => _i18.HomeAPIRemoteDataSource());
    gh.singleton<_i19.AuthRepository>(() => _i20.AuthRepositoryImpl(
          authRemoteDataSource: gh<_i5.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i15.AuthLocalDataSource>(),
        ));
    gh.singleton<_i21.ProductRepository>(() => _i22.ProductRepositoryImp(
        remoteDataSource: gh<_i7.ProductsRemoteDataSource>()));
    gh.singleton<_i23.CartRepository>(
        () => _i24.CartRepositoryImp(gh<_i13.CartRemoteDataSource>()));
    gh.singleton<_i25.GetAllProducts>(
        () => _i25.GetAllProducts(gh<_i21.ProductRepository>()));
    gh.singleton<_i26.FavouriteRepository>(() =>
        _i27.FavouriteRepositoryImp(gh<_i11.FavouriteRemoteDataSource>()));
    gh.singleton<_i28.AccountRepository>(() => _i29.AccountRepositoryImp(
          gh<_i3.AccountLocalDataSource>(),
          gh<_i9.AccountRemoteDataSource>(),
        ));
    gh.singleton<_i30.HomeRepository>(() => _i31.HomeRepositoryImp(
        remoteDataSource: gh<_i17.HomeRemoteDataSource>()));
    gh.singleton<_i32.Login>(
        () => _i32.Login(authRepository: gh<_i19.AuthRepository>()));
    gh.singleton<_i33.Register>(
        () => _i33.Register(authRepository: gh<_i19.AuthRepository>()));
    gh.singleton<_i34.GetBrands>(
        () => _i34.GetBrands(homeRepository: gh<_i30.HomeRepository>()));
    gh.singleton<_i35.GetCategories>(
        () => _i35.GetCategories(homeRepository: gh<_i30.HomeRepository>()));
    gh.factory<_i36.HomeCubit>(() => _i36.HomeCubit(
          gh<_i35.GetCategories>(),
          gh<_i34.GetBrands>(),
        ));
    gh.singleton<_i37.AddToCart>(
        () => _i37.AddToCart(gh<_i23.CartRepository>()));
    gh.singleton<_i38.ClearCart>(
        () => _i38.ClearCart(gh<_i23.CartRepository>()));
    gh.singleton<_i39.GetCart>(() => _i39.GetCart(gh<_i23.CartRepository>()));
    gh.singleton<_i40.RemoveFromCart>(
        () => _i40.RemoveFromCart(gh<_i23.CartRepository>()));
    gh.singleton<_i41.UpdateProductQuantity>(
        () => _i41.UpdateProductQuantity(gh<_i23.CartRepository>()));
    gh.singleton<_i42.AuthCubit>(() => _i42.AuthCubit(
          gh<_i32.Login>(),
          gh<_i33.Register>(),
        ));
    gh.factory<_i43.CartCubit>(() => _i43.CartCubit(
          gh<_i39.GetCart>(),
          gh<_i37.AddToCart>(),
          gh<_i38.ClearCart>(),
          gh<_i40.RemoveFromCart>(),
          gh<_i41.UpdateProductQuantity>(),
        ));
    gh.singleton<_i44.AddAddress>(
        () => _i44.AddAddress(gh<_i28.AccountRepository>()));
    gh.singleton<_i45.GetAddresses>(
        () => _i45.GetAddresses(gh<_i28.AccountRepository>()));
    gh.singleton<_i46.GetUser>(
        () => _i46.GetUser(gh<_i28.AccountRepository>()));
    gh.singleton<_i47.RemoveAddress>(
        () => _i47.RemoveAddress(gh<_i28.AccountRepository>()));
    gh.factory<_i48.AccountCubit>(() => _i48.AccountCubit(
          gh<_i45.GetAddresses>(),
          gh<_i44.AddAddress>(),
          gh<_i46.GetUser>(),
          gh<_i47.RemoveAddress>(),
        ));
    gh.singleton<_i49.AddToFavourite>(
        () => _i49.AddToFavourite(gh<_i26.FavouriteRepository>()));
    gh.singleton<_i50.GetFavourite>(
        () => _i50.GetFavourite(gh<_i26.FavouriteRepository>()));
    gh.singleton<_i51.RemoveFromFavourite>(
        () => _i51.RemoveFromFavourite(gh<_i26.FavouriteRepository>()));
    gh.factory<_i52.ProductsCubit>(
        () => _i52.ProductsCubit(gh<_i25.GetAllProducts>()));
    gh.factory<_i53.FavouriteCubit>(() => _i53.FavouriteCubit(
          gh<_i50.GetFavourite>(),
          gh<_i49.AddToFavourite>(),
          gh<_i51.RemoveFromFavourite>(),
        ));
    return this;
  }
}
