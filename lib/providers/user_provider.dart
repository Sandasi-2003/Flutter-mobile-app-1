
import 'package:flutter/cupertino.dart';

import '../features/profile/domain/entities/profile_entity.dart';
import '../shared/models/mock_shop_data.dart';

class UserProvider extends ChangeNotifier {

  UserProfile get user => MockShopData.user;
}