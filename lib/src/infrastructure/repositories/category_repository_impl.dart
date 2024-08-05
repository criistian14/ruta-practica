import 'package:dartz/dartz.dart';
import 'package:fake_store_client/src/domain/domain.dart';
import 'package:fake_store_client/src/infrastructure/infrastructure.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({
    required CategoryRemoteDataSource remoteDataSource,
    required NetworkHelper networkHelper,
  })  : _remoteDataSource = remoteDataSource,
        _networkHelper = networkHelper;

  final CategoryRemoteDataSource _remoteDataSource;
  final NetworkHelper _networkHelper;

  @override
  Future<Either<Exception, List<Category>>> getAllCategories() async {
    if (!await _networkHelper.isConnected) {
      return const Left(NoInternetConnectionError());
    }

    try {
      final categories = await _remoteDataSource.getAllCategories();
      return Right(categories);

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
