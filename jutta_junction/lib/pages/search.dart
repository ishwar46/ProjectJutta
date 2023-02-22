import 'package:flutter/material.dart';
import 'package:jutta_junction/Dashboard/Product.dart';
import 'package:jutta_junction/pages/product_Detail/Product_Detail.dart';



class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  List<Product> _filteredProducts = [];
// Search query
  String _searchQuery = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (Product product in _filteredProducts) {
      String productName = product.title;
      String productImage = product.image;
      int productPrice = product.price;
    }
    _filteredProducts = product1;
    }
  
  @override
  Widget build(BuildContext context) {
     final Product product;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Search"),
        backgroundColor: Color.fromARGB(255, 17, 16, 16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                _searchQuery = value;
                _filterProducts(_searchQuery);
              },
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  hintText: 'Search.....',
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: _searchQuery.isEmpty
                  ? Container()
                  : _filteredProducts.length == 0
                      ? Text(
                          'No result found Please try with different items',
                          style: TextStyle(fontSize: 24),
                        )
                      : ListView.builder(
                          itemCount: _filteredProducts.length,
                          itemBuilder: (context, index) => Card(
                            elevation: 1,
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Product_Detail( product: product2[index]),
                                  ),
                                );
                              },
                              leading: CircleAvatar(
                                radius: 30.0,
                                backgroundImage: AssetImage("${_filteredProducts[index].image}"),
                                backgroundColor: Colors.transparent,
                              ),
                              title: Text(_filteredProducts[index].title),
                              subtitle: Text(
                                  'Price: ${_filteredProducts[index].price}'),
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }

  void _filterProducts(String query) {
    List<Product> filteredSingleProductData = _filteredProducts
        .where((product) =>
            product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    

    setState(() {
      _filteredProducts = filteredSingleProductData; 
          
    });
  }
}
