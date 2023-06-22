import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  Product(this.name);
}

class ShoppingListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShoppingList([
      Product("Minyak"),
      Product("Gula"),
      Product("Beras"),
    ]);
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList(this.products, {super.key});

  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCartItems = <Product>{};

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.products.map((product) {
        return ShoppingListItem(
          product: product,
          isInCart: _shoppingCartItems.contains(product),
          onCartChanged: (product) {
            setState(() {
              if (_shoppingCartItems.contains(product)) {
                _shoppingCartItems.remove(product);
              } else {
                _shoppingCartItems.add(product);
              }
            });
          },
        );
      }).toList(),
    );
  }
}

typedef CartChangedCallback = Function(Product product);
class ShoppingListItem extends StatelessWidget {

  final Product product;
  final bool isInCart;
  final CartChangedCallback onCartChanged;

  const ShoppingListItem({super.key, required this.product, required this.isInCart, required this.onCartChanged});
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product);
      },
      leading: CircleAvatar(child: Text(product.name[0]), backgroundColor: _avatarBgColor(context)),
      title: Text(product.name, style: _textStyle(context))
    );
  }

  Color _avatarBgColor(BuildContext context) {
    return isInCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _textStyle(BuildContext context) {
    return isInCart ? TextStyle(decoration: TextDecoration.lineThrough, color: Colors.black54) : null;
  }
}
