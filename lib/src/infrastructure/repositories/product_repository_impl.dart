import 'package:dartz/dartz.dart';
import 'package:fake_store_client/src/domain/domain.dart';
import 'package:fake_store_client/src/infrastructure/infrastructure.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({
    required ProductRemoteDataSource remoteDataSource,
    required NetworkHelper networkHelper,
  })  : _remoteDataSource = remoteDataSource,
        _networkHelper = networkHelper;

  final ProductRemoteDataSource _remoteDataSource;
  final NetworkHelper _networkHelper;

  @override
  Future<Either<Exception, List<Product>>> getAllProducts() async {
    if (!await _networkHelper.isConnected) {
      return const Left(NoInternetConnectionError());
    }

    try {
      final products = await _remoteDataSource.getAllProducts();
      return Right(products);

      // * Errors management
    } on ConnectionTimeoutError catch (e) {
      return Left(e);
    } on EndPointError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, Product>> getProductDetail(int productId) async {
    if (!await _networkHelper.isConnected) {
      return const Left(NoInternetConnectionError());
    }

    try {
      final product = await _remoteDataSource.getProductDetail(productId);
      return Right(product);

      // * Errors management
    } on ConnectionTimeoutError catch (e) {
      return Left(e);
    } on EndPointError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, List<Product>>> getProductsByCategory(
    String category,
  ) async {
    if (!await _networkHelper.isConnected) {
      return const Left(NoInternetConnectionError());
    }

    try {
      final products = await _remoteDataSource.getProductsByCategory(category);
      return Right(products);

      // * Errors management
    } on ConnectionTimeoutError catch (e) {
      return Left(e);
    } on EndPointError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
