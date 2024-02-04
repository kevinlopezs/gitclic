import 'package:get/get.dart';

import '../../data/models/repos_model.dart';

class ReposController extends GetxController {
  //Obx variable for currentRepo or current repo selected by user
  final Rx<ReposModel> currentRepo = Rx(Get.arguments);
}
