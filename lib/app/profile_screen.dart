import 'package:entropia_market_ui/core/bold_body_text.dart';
import 'package:entropia_market_ui/core/project_padding.dart';
import 'package:entropia_market_ui/product/collection_images.dart';
import 'package:flutter/material.dart';

import '../core/collection_model.dart';
import '../product/collection_items.dart';
import '../product/item_model.dart';

class ProfilePage extends StatefulWidget{
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with ProjectPadding{
  late final List<CollectionModel> _items;
  late final List<CollectionModel> _newItems = [];

  final String _appBarTitle = 'Profile';
  final String _userName = 'Ahmet Karakaya';
  final String _birthDay = '19.02.1997';
  final String _userDesc = 'Hello, I\'ve been playing for about 12 years. I have shopped many times. I have not faced any downside so far.';
  final String _bodyTitle = 'My Market';

  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
    for(CollectionModel singleItem in _items){
      if(singleItem.seller == _userName){
        _newItems.add(singleItem);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.message_outlined))
        ],
      ),
      body: _buildProfilePage(context),
    );
  }

  Padding _buildProfilePage(BuildContext context) {
    return Padding(
      padding: horizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: verticalPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildProfilePhoto(),
                _buildProfileDetail(context),
              ],
            ),
          ),
          Text(_bodyTitle,style: Theme.of(context).textTheme.titleMedium,),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _newItems.length,
              itemBuilder: (context, index){
                return ItemModel(model: _newItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildProfileDetail(BuildContext context) {
    return Expanded(
                  child: Padding(
                    padding: horizontalPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BoldBodyText(text: _userName),
                        Padding(
                          padding: verticalPadding /2,
                          child: Text(_birthDay, style: Theme.of(context).textTheme.bodySmall,),
                        ),
                        Text(_userDesc, style: Theme.of(context).textTheme.bodySmall,)
                      ],
                    ),
                  ),
                );
  }

  ClipRRect _buildProfilePhoto() {
    return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(78),
                    child: Image.asset(ProjectImages.profilePhoto,fit: BoxFit.cover,),
                  ),
                );
  }
}
