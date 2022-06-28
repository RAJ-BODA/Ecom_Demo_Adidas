import 'package:get/get.dart';

class BottomBarScreenController extends GetxController{

  RxInt pageIndex = 0.obs;
  RxBool pageChange = false.obs;


  @override
  Future<void> onInit() async {
    // TODO: implement onInit


    super.onInit();
  }
  pageChangeMethode(int index){
    pageChange(true);
    pageIndex = index.obs;
    pageChange(false);
  }


}