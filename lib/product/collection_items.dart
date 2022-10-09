import 'package:entropia_market_ui/product/collection_images.dart';

import '../core/collection_model.dart';

class CollectionItems{
  late final List<CollectionModel> items;
  final String _redScorpion = 'Ancient Red Scorpion';
  final String _combustiveAttack = 'Combustive Attack Chip 1(L)';
  final String _animalMuscleOil = 'Animal Muscle Oil';

  CollectionItems(){
    items = [
      CollectionModel(
          imagePath: ProjectImages.redScorpion,
          title: _redScorpion,
          text: '\nTT Price: 4500 PED\n\n'
              'Tier: 4.35\n\n'
              'Tier Rate: 167/200\n',
          seller: 'Ahmet Karakaya',
          isSelling: true,
      ),
      CollectionModel(
          imagePath: ProjectImages.combustiveAttack,
          title: _combustiveAttack,
          text: '\nSell Price: TT + %110\n',
        seller: 'Ahmet Karakaya',
        isSelling: true,
      ),
      CollectionModel(
          imagePath: ProjectImages.animalMuscleOil,
          title: _animalMuscleOil,
          text: '\nSell Price: %105\n',
        seller: 'John Steinbeck',
        isSelling: true,
      ),
      CollectionModel(
        imagePath: ProjectImages.animalMuscleOil,
        title: _animalMuscleOil,
        text: '\nSell Price: %107\n',
        seller: 'Mark Williams',
        isSelling: true,
      ),
      CollectionModel(
        imagePath: ProjectImages.combustiveAttack,
        title: _combustiveAttack,
        text: '\nBuy Price: %100.1\n',
        seller: 'Thomas Payne',
        isSelling: false,
      ),
      CollectionModel(
        imagePath: ProjectImages.animalMuscleOil,
        title: _animalMuscleOil,
        text: '\nTT Price: 1000 PED\n',
        seller: 'Thomas Payne',
        isSelling: true,
      ),
      CollectionModel(
        imagePath: ProjectImages.animalMuscleOil,
        title: _animalMuscleOil,
        text: '\nTT Price: 1200 PED\n',
        seller: 'Marie Currie',
        isSelling: true,
      ),
      CollectionModel(
        imagePath: ProjectImages.animalMuscleOil,
        title: _animalMuscleOil,
        text: '\nBuy Price: 1000 PED\n',
        seller: 'Ahmet Karakaya',
        isSelling: false,
      ),
    ];
  }
}
