import 'package:flutter/material.dart';
import 'package:ecom_adidas_demo/controllers/product_details_controller.dart';
import 'package:get/get.dart';
import '../Utils/utils.dart';
import '../data.dart';
import '../widgets/product_details_widgets.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({Key? key}) : super(key: key);
  final ProductDetailsController productDetailsController = Get.put(ProductDetailsController()); 

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF696D77), Color(0xFF292C36)], begin: Alignment.topCenter, end: Alignment.bottomCenter, tileMode: TileMode.clamp)),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: screenAwareSize(20.0, context),
                  ),
                  onPressed: () {},
                ),
                title: Text("Adidas Energy Cloud",
                    style: TextStyle(color: Colors.white, fontSize: screenAwareSize(18.0, context), fontFamily: "Montserrat-Bold")),
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      size: screenAwareSize(20.0, context),
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    topPart(context),
                    bottomPart(context),
                  ],
                ),
              ))),
    );
  }

  Widget topPart(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: screenAwareSize(245.0, context),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset("assets/adidas.png", width: double.infinity, height: double.infinity, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, right: 35.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: screenAwareSize(50.0, context),
                    height: screenAwareSize(50.0, context),
                    decoration: const BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
                    child: Image.asset("assets/360.png"),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: screenAwareSize(18.0, context),
            bottom: screenAwareSize(15.0, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Rating",
                    style: TextStyle(color: const Color(0xFF949598), fontSize: screenAwareSize(10.0, context), fontFamily: "Montserrat-SemiBold")),
                SizedBox(
                  height: screenAwareSize(8.0, context),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Icon(Icons.star, color: Color(0xFFFFE600)),
                    SizedBox(
                      width: screenAwareSize(5.0, context),
                    ),
                    const Text("4.5", style: TextStyle(color: Color(0xFFFFE600))),
                    SizedBox(
                      width: screenAwareSize(5.0, context),
                    ),
                    const Text("(378 People)", style: TextStyle(color: Colors.white, fontSize: 14.0))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bottomPart(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
            child: Text(
              "Product Description",
              style: TextStyle(color: const Color(0xFF949598), fontSize: screenAwareSize(10.0, context), fontFamily: "Montserrat-SemiBold"),
            ),
          ),
          SizedBox(
            height: screenAwareSize(8.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(26.0, context), right: screenAwareSize(18.0, context)),
            child: AnimatedCrossFade(
              firstChild: Text(
                desc,
                maxLines: 2,
                style: TextStyle(color: Colors.white, fontSize: screenAwareSize(10.0, context), fontFamily: "Montserrat-Medium"),
              ),
              secondChild: Text(
                desc,
                style: TextStyle(color: Colors.white, fontSize: screenAwareSize(10.0, context), fontFamily: "Montserrat-Medium"),
              ),
              crossFadeState: productDetailsController.isExpanded.value ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(26.0, context), right: screenAwareSize(18.0, context)),
            child: GestureDetector(
                onTap: productDetailsController.expand,
                child: Text(
                  productDetailsController.isExpanded.value ? "less" : "more..",
                  style: const TextStyle(color: Color(0xFFFB382F), fontWeight: FontWeight.w700),
                )),
          ),
          SizedBox(
            height: screenAwareSize(12.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18.0, context), right: screenAwareSize(75.0, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Size",
                    style: TextStyle(color: const Color(0xFF949598), fontSize: screenAwareSize(10.0, context), fontFamily: "Montserrat-SemiBold")),
                Text("Quantity",
                    style: TextStyle(color: const Color(0xFF949598), fontSize: screenAwareSize(10.0, context), fontFamily: "Montserrat-SemiBold"))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(20.0, context), right: screenAwareSize(10.0, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: screenAwareSize(38.0, context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: sizeNumlist.map((item) {
                      var index = sizeNumlist.indexOf(item);
                      return GestureDetector(
                        onTap: () {
                          productDetailsController.currentSizeIndex.value = index;
                        },
                        child: sizeItem(item, index == productDetailsController.currentSizeIndex.value, context),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: screenAwareSize(100.0, context),
                    height: screenAwareSize(30.0, context),
                    decoration: BoxDecoration(color: const Color(0xFF525663), borderRadius: BorderRadius.circular(5.0)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        qtyController(productDetailsController.decrease, "-"),
                        divider(),
                        qtyController(() {}, productDetailsController.counter.value.toString()),
                        divider(),
                        qtyController(productDetailsController.increase, "+"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
            child: Text("Select Color",
                style: TextStyle(color: const Color(0xFF949598), fontSize: screenAwareSize(10.0, context), fontFamily: "Montserrat-SemiBold")),
          ),
          SizedBox(
            height: screenAwareSize(8.0, context),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: screenAwareSize(20.0, context)),
            height: screenAwareSize(34.0, context),
            child: Row(
              children: colorSelector(context),
            ),
          ),
          SizedBox(
            height: screenAwareSize(8.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(20.0, context)),
            child: const Text("Price", style: TextStyle(color: Color(0xFF949598), fontFamily: "Montserrat-SemiBold")),
          ),
          SizedBox(
            width: double.infinity,
            height: screenAwareSize(120.0, context),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: screenAwareSize(22.0, context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
                        child: Row(
                          children: <Widget>[
                            Text("\$",
                                style: TextStyle(color: Colors.white, fontSize: screenAwareSize(26.0, context), fontFamily: "Montserrat-Medium")),
                            SizedBox(width: screenAwareSize(2.0, context)),
                            Text("80",
                                style: TextStyle(color: Colors.white, fontSize: screenAwareSize(35.0, context), fontFamily: "Montserrat-Medium"))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenAwareSize(10.0, context),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: MaterialButton(
                          color: const Color(0xFFFB382F),
                          padding: EdgeInsets.symmetric(
                            vertical: screenAwareSize(14.0, context),
                          ),
                          onPressed: () {},
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: screenAwareSize(35.0, context)),
                              child: Text("Add To Cart",
                                  textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: screenAwareSize(15.0, context))),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: -40.0,
                  bottom: -60.0,
                  child: Image.asset("assets/cart.png",
                      width: screenAwareSize(190.0, context), height: screenAwareSize(155.0, context), fit: BoxFit.cover),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> colorSelector(BuildContext context) {
    List<Widget> colorItemList = [];
    colorItemList = List.generate(
      colors.length,
      (i) => colorItem(
        color: colors[i],
        isSelected: i == productDetailsController.currentColorIndex.value,
        context: context,
        ontab: () {
          productDetailsController.currentColorIndex.value = i;
        },
      ),
    );
    return colorItemList;
  }

  Widget qtyController(void Function()? onTap, String symbol) {
    return Flexible(
      flex: 3,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: onTap,
        child: SizedBox(
          height: double.infinity,
          child: Center(
            child: Text(symbol, style: const TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: "Montserrat-Bold")),
          ),
        ),
      ),
    );
  }
}
