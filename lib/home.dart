import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
      (int index) => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset('assets/diamond.png'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Title'),
                  SizedBox(height: 8.0),
                  Text('Secondary Text'),
                ],
              ),
            )
          ],
        ),
      ),
    );
    return cards;
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
            if (kDebugMode) {
              print('Menu button');
            }
          },
        ),
        title: const Text('SHRINE'),
        actions: [
          IconButton(
            onPressed: () {
              if (kDebugMode) {
                print('Search button');
              }
            },
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
          ),
          IconButton(
            onPressed: () {
              if (kDebugMode) {
                print('Filter button');
              }
            },
            icon: const Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
          ),
        ],
      ),
      // TODO: Add a grid view (102)
      body: const Center(
        child: Text('You did it!'),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
