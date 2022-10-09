import 'package:banner_listtile/banner_listtile.dart';
import 'package:entropia_market_ui/app/profile_screen.dart';
import 'package:entropia_market_ui/core/box_decoration.dart';
import 'package:entropia_market_ui/core/color_scheme.dart';
import 'package:entropia_market_ui/core/project_padding.dart';
import 'package:entropia_market_ui/core/bold_body_text.dart';
import 'package:flutter/material.dart';

import '../core/category_model.dart';
import '../core/collection_model.dart';
import '../product/category_items.dart';
import '../product/collection_items.dart';
import '../product/item_model.dart';

class MarketPlacePage extends StatefulWidget {
  const MarketPlacePage({Key? key}) : super(key: key);

  @override
  State<MarketPlacePage> createState() => _MarketPlacePageState();
}

class _MarketPlacePageState extends State<MarketPlacePage> with ProjectPadding{
  final String _appBarTitle = 'Market Place';

  late final List<CollectionModel> _items;
  late final List<CategoryModel> _categories;

  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
    _categories = CategoryItems().categories;

  }

  Future _showModalBottomSheet(BuildContext context, EdgeInsets padding){
    String searchingText = '';
    final _searchController = TextEditingController();

    return showModalBottomSheet(
        backgroundColor: Colors.white,
        enableDrag: true,
        elevation: 4,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24))),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Padding(
                  padding: padding,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 400,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: colorSheme.midnightBlue,
                              borderRadius:
                              BorderRadius.all(Radius.circular(24)),
                            ),
                          ),
                          Padding(
                            padding: generalPadding,
                            child: TextFormField(
                              controller: _searchController,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.indigo),
                                hintText: 'Item Name',
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.indigo,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.indigo, width: 100),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                              onChanged: (String? text) {
                                setState(() {
                                  searchingText = _searchController.text.toLowerCase();
                                });
                              },
                            ),
                          ),
                          buildSearch(context,searchingText),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }

  Widget buildSearch(BuildContext context, String? searchingText) {
    late final List<CollectionModel> _newItems = [];

    if(searchingText != '' && searchingText != null){
      for(CollectionModel singleItem in _items){
        if(singleItem.title.toLowerCase().contains(searchingText)){
          _newItems.add(singleItem);
        }else{
          _newItems.remove(singleItem);
        }
      }
    }

    if(_newItems.isNotEmpty){
      return Expanded(
        child: ListView.builder(
          itemCount: _newItems.length,
          itemBuilder: (context, index){
            return ItemModel(model: _newItems[index]);
          },
        ),
      );
    }else{
      return Container();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
        actions: [
          IconButton(onPressed: (){
            _showModalBottomSheet(context, generalPadding);
          }, icon: const Icon(Icons.search_outlined)),
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
          }, icon: const Icon(Icons.person))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
                itemBuilder: (context, index){
                  return _CategoryModel(model: _categories[index]);
                },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
                itemBuilder: (context, index){
                  return ItemModel(model: _items[index]);
                },
            ),
          ),
        ],
      ),
    );
  }
}


class _CategoryModel extends StatelessWidget with ProjectPadding{
  _CategoryModel({super.key,
    required CategoryModel model,
  }) : _model = model;

  final CategoryModel _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: verticalPadding + leftPadding,
      child: InkWell(
        onTap: (){},
        child: SizedBox(
          width: 100,
          child: Card(
            shadowColor: colorSheme.darkBlue,
            shape: const RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(18))),
            elevation: 2,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: topPadding+bottomPadding,
                  child: Icon(_model.icon,color: colorSheme.darkBlue,size: 24,),
                ),
                Padding(
                  padding: horizontalPadding ,
                  child: BoldBodyText(text: _model.title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

