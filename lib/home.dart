import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:shrine/model/product.dart';
import 'package:shrine/model/products_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);
    if (products.isEmpty) {
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return products
        .map((product) => Card(
              clipBehavior: Clip.antiAlias,
              // TODO: Adjust card heights (103)
              child: Column(
                // TODO: Center items on the card (103)
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset(
                      product.assetName,
                      package: product.assetPackage,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                      child: Column(
                        // TODO: Align labels to the bottom and center (103)
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // TODO: Change innermost Column (103)
                        children: [
                          // TODO: Handle overflowing labels (103)
                          Text(
                            'Now we will test when it will go overflow the widget', // product.name,
                            style: theme.textTheme.titleLarge,
                            // maxLines: 1,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            formatter.format(product.price),
                            style: theme.textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
        .toList();
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            debugPrint('Menu button');
          },
        ),
        title: const Text('SHRINE'),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Search button');
            },
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
          ),
          IconButton(
            onPressed: () {
              debugPrint('Filter button');
            },
            icon: const Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context), // replace
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
