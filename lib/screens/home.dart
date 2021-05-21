import 'package:flutter/material.dart';
import 'package:phuc_long_demo/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
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
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: formFillColor,
                ),
                child: DropdownButton(
                  items: [
                    DropdownMenuItem(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Khai vị"),
                      ),
                      value: 0,
                    ),
                    DropdownMenuItem(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Món chính"),
                      ),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Tráng miệng"),
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
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => TeaTile(),
                  itemCount: 10,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.0),
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
                    BigActionButton(text: "Giỏ hàng - 0 món"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BigActionButton extends StatelessWidget {
  const BigActionButton({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: boldButtonColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Text(
              text!,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TeaTile extends StatelessWidget {
  const TeaTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showOptional(context);
      },
      child: Container(
        child: Row(
          children: [
            Image.asset("assets/images/milktea/milktea01.png"),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trà sữa trân châu đường đen",
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
                        "121 còn lại",
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
                                "100.000",
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
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (contextModal) => Container(
        padding: EdgeInsets.only(top: 50),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0)),
          ),
          child: Wrap(
            children: [
              /* ***********
                                    
                                        HEADER 
                                    
                                    ************ */
              Row(
                children: [
                  Image.asset(
                    "assets/images/milktea/milktea01.png",
                    width: 124,
                    height: 124,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trà đào cam sả",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        children: [
                          Text(
                            "35.000 đ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "121 còn lại",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              /* ***********
                                    
                                           SIZE 
                                    
                                        ************ */
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Text("Kích cỡ"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: RadioListTile(
                          value: 0,
                          groupValue: 0,
                          onChanged: (dynamic val) {},
                          title: Row(
                            children: [
                              Text("S"),
                              Spacer(),
                              Text("+0"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: RadioListTile(
                          value: 0,
                          groupValue: 0,
                          onChanged: (dynamic val) {},
                          title: Row(
                            children: [
                              Text("M"),
                              Spacer(),
                              Text("+5.000"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: RadioListTile(
                          value: 0,
                          groupValue: 0,
                          onChanged: (dynamic val) {},
                          title: Row(
                            children: [
                              Text("L"),
                              Spacer(),
                              Text("+10.000"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      /* ***********
                                  
                                         ICE & SUGAR 
                                  
                                      ************ */
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Đường"),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 76,
                                  height: 44,
                                  child: Center(child: Text("100")),
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 12.0),
                                  margin: EdgeInsets.only(right: 8.0),
                                ),
                                Container(
                                  width: 76,
                                  height: 44,
                                  child: Center(child: Text("70")),
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 12.0),
                                  margin: EdgeInsets.only(right: 8.0),
                                ),
                                Container(
                                  width: 76,
                                  height: 44,
                                  child: Center(child: Text("30")),
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 12.0),
                                  margin: EdgeInsets.only(right: 8.0),
                                ),
                                Container(
                                  width: 76,
                                  height: 44,
                                  child: Center(child: Text("0")),
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 12.0),
                                  margin: EdgeInsets.only(right: 8.0),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Đá"),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 76,
                                  height: 44,
                                  child: Center(child: Text("100")),
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 12.0),
                                  margin: EdgeInsets.only(right: 8.0),
                                ),
                                Container(
                                  width: 76,
                                  height: 44,
                                  child: Center(child: Text("70")),
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 12.0),
                                  margin: EdgeInsets.only(right: 8.0),
                                ),
                                Container(
                                  width: 76,
                                  height: 44,
                                  child: Center(child: Text("30")),
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 12.0),
                                  margin: EdgeInsets.only(right: 8.0),
                                ),
                                Container(
                                  width: 76,
                                  height: 44,
                                  child: Center(child: Text("0")),
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 12.0),
                                  margin: EdgeInsets.only(right: 8.0),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      /* ***********
                                  
                                         TOPPINGS 
                                  
                                      ************ */
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Toppings"),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove,
                                ),
                                Text(
                                  "Trân châu đen",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                                Icon(Icons.add),
                                Spacer(),
                                Text("+5.000"),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove,
                                ),
                                Text(
                                  "Trân châu đen",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                                Icon(Icons.add),
                                Spacer(),
                                Text("+5.000"),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove,
                                ),
                                Text(
                                  "Trân châu đen",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                                Icon(Icons.add),
                                Spacer(),
                                Text("+5.000"),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove,
                                ),
                                Text(
                                  "Trân châu đen",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                                Icon(Icons.add),
                                Spacer(),
                                Text("+5.000"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Thêm ghi chú món ăn",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              prefixIcon: Icon(Icons.note_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          )),
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
                          Container(
                            padding: EdgeInsets.all(14.0),
                            child: Icon(Icons.remove),
                            decoration: BoxDecoration(
                              color: lightButtonColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              "25",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: boldButtonColor,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(14.0),
                            child: Icon(Icons.add),
                            decoration: BoxDecoration(
                              color: lightButtonColor,
                              borderRadius: BorderRadius.circular(5.0),
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
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
    );
  }
}

class TabWidget extends StatelessWidget {
  final String? text;

  TabWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        text!,
        style: TextStyle(
          color: lightTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }
}
