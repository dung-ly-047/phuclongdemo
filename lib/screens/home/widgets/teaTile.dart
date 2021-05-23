import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:phuc_long_demo/controllers/teaController.dart';
import 'package:phuc_long_demo/screens/home/widgets/bigButton.dart';
import 'package:phuc_long_demo/utils/constants.dart';
import 'package:phuc_long_demo/utils/widgets/line.dart';

final teaController = Get.find<TeaController>();

class TeaTile extends StatelessWidget {
  TeaTile({
    Key? key,
    @required this.imgUrl,
    @required this.name,
    @required this.price,
    required this.quantity,
  }) : super(key: key);
  final String? imgUrl;
  final String? name;
  final double? price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        teaController.resetOrder();
        teaController.order["totalPrice"] = price;
        showOptional(context);
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/images/$imgUrl.png",
              width: 80,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$quantity còn lại",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                        ),
                      ),
                      Container(
                        // width: 84,
                        // height: 32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: lightButtonColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                price.toString(),
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.add,
                                  size: 14,
                                  color: boldButtonColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future showOptional(BuildContext context) {
    var noteController = TextEditingController();

    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (contextModal) => Container(
        padding: EdgeInsets.only(top: 50),
        child: Container(
          decoration: BoxDecoration(
            color: formFillColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0)),
          ),
          child: Obx(
            () => Wrap(
              children: [
                /* ***********
                                    
                                        HEADER 
                                    
                                    ************ */
                Row(
                  children: [
                    Image.asset(
                      "assets/images/$imgUrl.png",
                      width: 124,
                      height: 124,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 22),
                            child: Row(
                              children: [
                                Text(
                                  price.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "$quantity còn lại",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                /* ***********
                                    
                                           SIZE 
                                    
                                        ************ */
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  margin: EdgeInsets.only(
                    top: 16.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  padding: EdgeInsets.all(16.0),
                  height: MediaQuery.of(context).size.height / 2,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Size(),
                        SizedBox(
                          height: 32,
                        ),
                        /* ***********
                                  
                                         ICE & SUGAR 
                                  
                                      ************ */
                        Sugar(),
                        SizedBox(
                          height: 16,
                        ),
                        Ice(),
                        SizedBox(
                          height: 22,
                        ),
                        /* ***********
                                  
                                         TOPPINGS 
                                  
                                      ************ */
                        Toppings(),
                        SizedBox(
                          height: 24,
                        ),
                        Note(noteController: noteController),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 144,
                  child: Column(
                    children: [
                      Container(
                        // padding: EdgeInsets.all(8.0),
                        height: 64,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (teaController.order["quantity"] > 1) {
                                  teaController.order["totalPrice"] -=
                                      teaController.order["totalPrice"] /
                                          teaController.order["quantity"];
                                  teaController.order["quantity"]--;
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(14.0),
                                child: Icon(Icons.remove),
                                decoration: BoxDecoration(
                                  color: lightButtonColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                teaController.order["quantity"].toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: boldButtonColor,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (teaController.order["quantity"] <
                                    quantity) {
                                  teaController.order["totalPrice"] +=
                                      teaController.order["totalPrice"] /
                                          teaController.order["quantity"];
                                  teaController.order["quantity"]++;
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(14.0),
                                child: Icon(Icons.add),
                                decoration: BoxDecoration(
                                  color: lightButtonColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: bgColor,
                      ),

                      /* ********  
                          FOOTER
                      *********** */
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                        "assets/images/icon/discount.png"),
                                    Text("Giảm giá"),
                                  ],
                                ),
                              ),
                              BigActionButton(
                                text: "Đặt món",
                                totalPrice: teaController.order["totalPrice"],
                                onTap: () {
                                  teaController.totalPriceCart.value +=
                                      teaController.order["totalPrice"];
                                  teaController.totalQuantityCart +=
                                      teaController.order["quantity"];
                                  Navigator.of(contextModal).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Size extends StatelessWidget {
  const Size({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kích cỡ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          value: "S",
          groupValue: teaController.order["size"],
          onChanged: (dynamic val) {
            if (teaController.order["size"] == "M")
              teaController.order["totalPrice"] -=
                  5000 * teaController.order["quantity"];
            else if (teaController.order["size"] == "L")
              teaController.order["totalPrice"] -=
                  10000 * teaController.order["quantity"];
            teaController.order["size"] = val;
            teaController.order["totalPrice"] +=
                0 * teaController.order["quantity"];
          },
          title: Row(
            children: [
              Text("S"),
              Spacer(),
              Text("+0"),
            ],
          ),
        ),
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          value: "M",
          groupValue: teaController.order["size"],
          onChanged: (dynamic val) {
            if (teaController.order["size"] == "L")
              teaController.order["totalPrice"] -=
                  10000 * teaController.order["quantity"];
            teaController.order["size"] = val;
            teaController.order["totalPrice"] +=
                5000 * teaController.order["quantity"];
          },
          title: Row(
            children: [
              Text("M"),
              Spacer(),
              Text("+5.000"),
            ],
          ),
        ),
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          value: "L",
          groupValue: teaController.order["size"],
          onChanged: (dynamic val) {
            if (teaController.order["size"] == "M")
              teaController.order["totalPrice"] -=
                  5000 * teaController.order["quantity"];
            teaController.order["size"] = val;
            teaController.order["totalPrice"] +=
                10000 * teaController.order["quantity"];
          },
          title: Row(
            children: [
              Text("L"),
              Spacer(),
              Text("+10.000"),
            ],
          ),
        ),
      ],
    );
  }
}

class Note extends StatelessWidget {
  const Note({
    Key? key,
    required this.noteController,
  }) : super(key: key);

  final TextEditingController noteController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: noteController,
      decoration: InputDecoration(
        hintText: "Thêm ghi chú món ăn",
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: Image.asset("assets/images/icon/note.png"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class Toppings extends StatelessWidget {
  const Toppings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Toppings",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: [
            // GestureDetector(
            //   onTap: () {
            //     if (teaController.order["toppings"]
            //             ["black_pearl"] >
            //         0)
            //       teaController.order["toppings"]
            //           ["black_pearl"]--;
            //   },
            //   child: Icon(
            //     Icons.remove,
            //   ),
            // ),
            Text(
              "Trân châu đen",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            // GestureDetector(
            //     onTap: () {
            //       teaController.order["toppings"]
            //           ["black_pearl"]++;
            //     },
            //     child: Icon(Icons.add)),
            Spacer(),
            Text("+5.000"),
          ],
        ),
        LineWidget(),
        Row(
          children: [
            // Icon(
            //   Icons.remove,
            // ),
            Text(
              "Trân châu trắng",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            // Icon(Icons.add),
            Spacer(),
            Text("+10.000"),
          ],
        ),
        LineWidget(),
        Row(
          children: [
            // Icon(
            //   Icons.remove,
            // ),
            Text(
              "Thạch trái cây",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            // Icon(Icons.add),
            Spacer(),
            Text("+10.000"),
          ],
        ),
      ],
    );
  }
}

class Ice extends StatelessWidget {
  const Ice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Đá",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  teaController.order["ice"] = 100;
                },
                child: Container(
                  width: 76,
                  height: 44,
                  child: Center(
                      child: Text(
                    "100",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: teaController.order["ice"] == 100
                          ? boldButtonColor
                          : Colors.black,
                    ),
                  )),
                  decoration: BoxDecoration(
                    color: teaController.order["ice"] == 100
                        ? lightButtonColor
                        : bgColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  margin: EdgeInsets.only(right: 8.0),
                ),
              ),
              GestureDetector(
                onTap: () {
                  teaController.order["ice"] = 70;
                },
                child: Container(
                  width: 76,
                  height: 44,
                  child: Center(
                      child: Text(
                    "70",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: teaController.order["ice"] == 70
                          ? boldButtonColor
                          : Colors.black,
                    ),
                  )),
                  decoration: BoxDecoration(
                    color: teaController.order["ice"] == 70
                        ? lightButtonColor
                        : bgColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  margin: EdgeInsets.only(right: 8.0),
                ),
              ),
              GestureDetector(
                onTap: () {
                  teaController.order["ice"] = 30;
                },
                child: Container(
                  width: 76,
                  height: 44,
                  child: Center(
                      child: Text(
                    "30",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: teaController.order["ice"] == 30
                          ? boldButtonColor
                          : Colors.black,
                    ),
                  )),
                  decoration: BoxDecoration(
                    color: teaController.order["ice"] == 30
                        ? lightButtonColor
                        : bgColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  margin: EdgeInsets.only(right: 8.0),
                ),
              ),
              GestureDetector(
                onTap: () {
                  teaController.order["ice"] = 0;
                },
                child: Container(
                  width: 76,
                  height: 44,
                  child: Center(
                      child: Text(
                    "0",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: teaController.order["ice"] == 0
                          ? boldButtonColor
                          : Colors.black,
                    ),
                  )),
                  decoration: BoxDecoration(
                    color: teaController.order["ice"] == 0
                        ? lightButtonColor
                        : bgColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  margin: EdgeInsets.only(right: 8.0),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Sugar extends StatelessWidget {
  const Sugar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Đường",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  teaController.order["sugar"] = 100;
                },
                child: Container(
                  width: 76,
                  height: 44,
                  child: Center(
                      child: Text(
                    "100",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: teaController.order["sugar"] == 100
                          ? boldButtonColor
                          : Colors.black,
                    ),
                  )),
                  decoration: BoxDecoration(
                    color: teaController.order["sugar"] == 100
                        ? lightButtonColor
                        : bgColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  margin: EdgeInsets.only(right: 8.0),
                ),
              ),
              GestureDetector(
                onTap: () {
                  teaController.order["sugar"] = 70;
                },
                child: Container(
                  width: 76,
                  height: 44,
                  child: Center(
                      child: Text(
                    "70",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: teaController.order["sugar"] == 70
                          ? boldButtonColor
                          : Colors.black,
                    ),
                  )),
                  decoration: BoxDecoration(
                    color: teaController.order["sugar"] == 70
                        ? lightButtonColor
                        : bgColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  margin: EdgeInsets.only(right: 8.0),
                ),
              ),
              GestureDetector(
                onTap: () {
                  teaController.order["sugar"] = 30;
                },
                child: Container(
                  width: 76,
                  height: 44,
                  child: Center(
                      child: Text(
                    "30",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: teaController.order["sugar"] == 30
                          ? boldButtonColor
                          : Colors.black,
                    ),
                  )),
                  decoration: BoxDecoration(
                    color: teaController.order["sugar"] == 30
                        ? lightButtonColor
                        : bgColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  margin: EdgeInsets.only(right: 8.0),
                ),
              ),
              GestureDetector(
                onTap: () {
                  teaController.order["sugar"] = 0;
                },
                child: Container(
                  width: 76,
                  height: 44,
                  child: Center(
                      child: Text(
                    "0",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: teaController.order["sugar"] == 0
                          ? boldButtonColor
                          : Colors.black,
                    ),
                  )),
                  decoration: BoxDecoration(
                    color: teaController.order["sugar"] == 0
                        ? lightButtonColor
                        : bgColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  margin: EdgeInsets.only(right: 8.0),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
