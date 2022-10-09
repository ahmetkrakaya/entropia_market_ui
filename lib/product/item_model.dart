import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';

import '../core/collection_model.dart';
import '../core/project_padding.dart';

class ItemModel extends StatefulWidget with ProjectPadding{
  ItemModel({
    super.key,
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  State<ItemModel> createState() => _ItemModelState();
}

class _ItemModelState extends State<ItemModel> with ProjectPadding{
  late final CollectionModel _model;
  bool isTap = false;

  @override
  void initState() {
    super.initState();
    _model = widget._model;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: horizontalPadding + topPadding,
      child: BannerListTile(
        onTap: () {
          if(isTap){
            setState(() {
              isTap = false;
            });
          }else{
            setState(() {
              isTap = true;
            });
          }
        },
        bannerText: _model.isSelling? 'Selling' : 'Buying',
        bannerColor: _model.isSelling? Colors.redAccent : Colors.blue,
        borderRadius: BorderRadius.circular(18),
        borderside: const BorderSide(width: 2,color: Colors.blueGrey),
        imageContainer:
        Image.asset(_model.imagePath),
        title: Text(_model.title,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
        subtitle: isTap ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_model.text,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white)),
            Text(_model.seller,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white)),
          ],
        ): Container(),
      ),
    );
  }
}
