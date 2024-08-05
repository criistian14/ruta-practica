import 'package:dartz/dartz.dart';
import 'package:fake_store_client/src/domain/domain.dart';
import 'package:fake_store_client/src/infrastructure/infrastructure.dart';

class FakeStoreController extends IFakeStoreController {
  const FakeStoreController({
    required CategoryRepository categoryRepository,
    required ProductRepository productRepository,
    required LogHelper logHelper,
  })  : _categoryRepository = categoryRepository,
        _productRepository = productRepository,
        _logHelper = logHelper;

  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;

  final LogHelper _logHelper;

  @override
  Future<Either<Exception, List<Category>>> getAllCategories() async {
    final result = await _categoryRepository.getAllCategories();

    return result.fold(
      (exception) {
        _logHelper.showError(exception);
        return Left(exception);
      },
      (r) => Right(r),
    );
  }

  @override
  Future<Either<Exception, List<Product>>> getAllProducts() async {
    final result = await _productRepository.getAllProducts();

    return result.fold(
      (exception) {
        _logHelper.showError(exception);
        return Left(exception);
      },
      (r) => Right(r),
    );
  }

  @override
  Future<Either<Exception, Product>> getProductDetail(int productId) async {
    final result = await _productRepository.getProductDetail(productId);

    return result.fold(
      (exception) {
        _logHelper.showError(exception);
        return Left(exception);
      },
      (r) => Right(r),
    );
  }

  @override
  Future<Either<Exception, List<Product>>> getProductsByCategory(
    String category,
  ) async {
    final result = await _productRepository.getProductsByCategory(category);

    return result.fold(
      (exception) {
        _logHelper.showError(exception);
        return Left(exception);
      },
      (r) => Right(r),
    );
  }
}
