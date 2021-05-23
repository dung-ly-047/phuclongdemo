import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phuc_long_demo/controllers/teaController.dart';
import 'package:phuc_long_demo/screens/home/widgets/bigButton.dart';
import 'package:phuc_long_demo/screens/home/widgets/teaTile.dart';
import 'package:phuc_long_demo/utils/constants.dart';
import 'package:phuc_long_demo/utils/widgets/tab.dart';

final teaController = Get.put(TeaController());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Header(),
            Body(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: DefaultTabController(
                    length: 3,
                    child: TabBar(
                      labelColor: hightlightColor,
                      unselectedLabelColor: lightTextColor,
                      indicator: UnderlineTabIndicator(),
                      tabs: [
                        TabWidget(
                          text: "Ăn tại bàn",
                        ),
                        TabWidget(
                          text: "Mang đi",
                        ),
                        TabWidget(
                          text: "Giao hàng",
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Image.asset("assets/images/icon/hb_menu.png"),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        fillColor: formFillColor,
                        filled: true,
                        hintText: "Số thẻ",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: boldTextColor,
                          fontWeight: FontWeight.w700,
                        )),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: formFillColor,
                        ),
                        child: Image.asset('assets/images/icon/search.png'))),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: formFillColor,
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 22),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              child: DropdownButton(
                items: [
                  DropdownMenuItem(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10.0),
                      child: Text(
                        "Khai vị",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    value: 0,
                  ),
                  DropdownMenuItem(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10.0),
                      child: Text(
                        "Món chính",
                      ),
                    ),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10.0),
                      child: Text(
                        "Tráng miệng",
                      ),
                    ),
                    value: 2,
                  ),
                ],
                isExpanded: true,
                value: 0,
                underline: SizedBox(),
                onChanged: (dynamic val) {},
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: teaController.teaStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 8.0,
                    ),
                    itemBuilder: (context, index) => TeaTile(
                        imgUrl: (snapshot.data!.docs[index].data()
                            as Map)["imgUrl"],
                        name:
                            (snapshot.data!.docs[index].data() as Map)["name"],
                        price: ((snapshot.data!.docs[index].data()
                                as Map)["price"] as int)
                            .toDouble(),
                        quantity: (snapshot.data!.docs[index].data()
                            as Map)["quantity"]),
                    itemCount: snapshot.data!.docs.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 22),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: boldButtonColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset(
              "assets/images/icon/order.png",
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Obx(
            () => BigActionButton(
              text: "Giỏ hàng - ${teaController.totalQuantityCart} món",
              totalPrice: teaController.totalPriceCart.value,
            ),
          ),
        ],
      ),
    );
  }
}
