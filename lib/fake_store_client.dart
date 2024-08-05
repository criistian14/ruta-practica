import 'package:dio/dio.dart';
import 'package:fake_store_client/src/domain/controllers/controller_impl.dart';
import 'package:talker/talker.dart';

import 'src/domain/domain.dart';
import 'src/infrastructure/infrastructure.dart';

Future<void> main() async {
  final logHelper = LogHelperImpl(talker: Talker());

  // ? Init Data Sources
  final client = Dio();
  final ClientHelper clientHelper = ClientHelperImpl(client: client);

  final CategoryRemoteDataSource categoryRemoteDataSource =
      CategoryRemoteDataSourceImpl(
    clientHelper: clientHelper,
  );
  final ProductRemoteDataSource productRemoteDataSource =
      ProductRemoteDataSourceImpl(
    clientHelper: clientHelper,
  );

  // ? Init Repositories
  final NetworkHelper networkHelper = NetworkHelperImpl();

  final CategoryRepository categoryRepository = CategoryRepositoryImpl(
    remoteDataSource: categoryRemoteDataSource,
    networkHelper: networkHelper,
  );
  final ProductRepository productRepository = ProductRepositoryImpl(
    remoteDataSource: productRemoteDataSource,
    networkHelper: networkHelper,
  );

  // ? Call Endpoints
  final controller = FakeStoreController(
    logHelper: logHelper,
    categoryRepository: categoryRepository,
    productRepository: productRepository,
  );

  // * Get all available categories
  final categoriesResult = await controller.getAllCategories();
  if (categoriesResult.isLeft()) return;
  final categories = categoriesResult.getOrElse(() => []);

  logHelper.showSuccess(categories, title: 'Categories');

  // * Get all products by category
  if (categories.isEmpty) return;
  final productsByCategoryResult = await controller.getProductsByCategory(
    categories[0].name,
  );
  if (productsByCategoryResult.isLeft()) return;
  final products = productsByCategoryResult.getOrElse(() => []);

  logHelper.showSuccess(products, title: 'Products By Category');

  // * Get info about product
  if (products.isEmpty) return;
  final productResult = await controller.getProductDetail(products[0].id);
  if (productResult.isLeft()) return;
  final product = productResult.getOrElse(() => Product.empty());

  logHelper.showSuccess(product, title: 'Product Detail');
}
