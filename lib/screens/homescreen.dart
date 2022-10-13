import 'package:crypto_list_app/controller/coin_controller.dart';
import 'package:crypto_list_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final CoinController controller = Get.put(CoinController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black87,
              Colors.black45,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.4, 0.8],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Text(
                  'Crypto Market',
                  style: textStyle(
                    25,
                    Colors.white,
                    FontWeight.bold,
                    fontType: 5,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            Obx(() {
              if (controller.isLoading.value == true) {
                return const SliverToBoxAdapter(
                    child: Center(
                  child: CircularProgressIndicator(),
                ));
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 80,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[700]!.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      controller.coinsList[index].image,
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          controller.coinsList[index].name,
                                          style: textStyle(
                                            18,
                                            Colors.white,
                                            FontWeight.w600,
                                            fontType: 4,
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          controller.coinsList[index]
                                              .priceChangePercentage24H
                                              .toStringAsFixed(2),
                                          style: textStyle(
                                            17,
                                            Colors.grey[400]!,
                                            FontWeight.w600,
                                            fontType: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, top: 15, bottom: 15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          '\$ ${controller.coinsList[index].currentPrice}',
                                          style: textStyle(
                                            18,
                                            Colors.white,
                                            FontWeight.w500,
                                            fontType: 4,
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          controller.coinsList[index].symbol
                                              .toUpperCase(),
                                          style: textStyle(
                                            17,
                                            Colors.grey[400]!,
                                            FontWeight.w600,
                                            fontType: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: controller.coinsList.length,
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
