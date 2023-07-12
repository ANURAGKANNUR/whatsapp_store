import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_store/app/modules/products/controller/product_controller.dart';

class ProductPage extends GetView<ProductController> {
  ProductPage({super.key});
  final numbers = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Get.back();
          },
        ),
        leadingWidth: 30,
        actions: [
          const Icon(
            Icons.shopping_cart,
            size: 30,
          )
        ],
        backgroundColor: Colors.black54,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/whatsapp.png',
              height: 40,
              width: 40,
            ),
            const SizedBox(
              width: 4,
            ),
            const Text("WhatssAppShop")
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Obx(() => (controller.allProducts.value.products == null)
                ? Center(
                    child: Text("Nothing to show"),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.productDtail.value.title ?? "",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.network(
                          controller.productDtail.value.images!.first),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(color: Colors.black, thickness: 0.7),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "MRP : ",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "₹4000.0",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              Text(
                                "₹ ${controller.productDtail.value.price.toString()}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              const Text(
                                "In stock",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green),
                              ),
                              DropdownButton(
                                  value: controller.selectedNumber.value,
                                  items: numbers
                                      .map<DropdownMenuItem<int>>((int number) {
                                    return DropdownMenuItem<int>(
                                      value: number,
                                      child: Text(number.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    controller.updateSelectedNumber(newValue!);
                                  }),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                disabledBackgroundColor: Colors.green,
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13))),
                            child: const Text(
                              "Add to cart",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                disabledBackgroundColor: Colors.black,
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13))),
                            child: const Text(
                              "Buy now",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Quick Review",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "staff chair",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(color: Colors.black26, thickness: 0.5),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Similar products",
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          Text(
                            "View all",
                            style: TextStyle(color: Colors.green),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        child: PageView.builder(
                            itemCount:
                                controller.allProducts.value.products?.length,
                            padEnds: false,
                            controller: PageController(viewportFraction: 0.6),
                            itemBuilder: (BuildContext context, int itemIndex) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 200,
                                        width: 200,
                                        child: Image.network(
                                          controller
                                              .allProducts
                                              .value
                                              .products![itemIndex]
                                              .images!
                                              .first,
                                          fit: BoxFit.cover,
                                        )),
                                    Text(
                                      controller.allProducts.value
                                          .products![itemIndex].title
                                          .toString(),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "₹${controller.allProducts.value.products![itemIndex].price}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "4000.00",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  )),
          ),
        ),
      ),
    );
  }
}
