import 'dart:math';

import 'package:avon_app/core/components/app_image.dart';

import 'package:avon_app/core/components/app_search.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSearch(),

              SizedBox(height: 13),
              _Offers(),

              SizedBox(height: 24),
              _list(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final productModel model;
  const _Item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),

        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
            blurStyle: BlurStyle.inner,
            color: Colors.black.withValues(alpha: .25),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: AppImage(
                    image: model.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      // add to cart
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 4),
                        ],
                      ),
                      child: Center(
                        child: AppImage(
                          image: 'basket.png',
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 11),
          Text(
            "${model.nameEn} / ${model.descriptionEn}",
            style: TextStyle(
              color: Color(0xff434C6D),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 11),

          Text(
            "\$${model.price}",

            style: TextStyle(
              color: Color(0xff70839C),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _list extends StatefulWidget {
  const _list({super.key});

  @override
  State<_list> createState() => _listState();
}

class _listState extends State<_list> {
  List<productModel>? list;
  Future<void> getData() async {
    final resp = await Dio().get('https://cosmatics.growfet.com/api/Products');

    list = ProductsData.fromJson({"list": resp.data}).product;
    print(resp.data);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Top rated products",
          style: TextStyle(
            color: Color(0xff434C6D),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 14),

        list == null
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 176 / 237,
                ),
                itemCount: list!.length,
                itemBuilder: (context, index) => _Item(model: list![index]),
              ),
      ],
    );
  }
}

class _Offers extends StatefulWidget {
  const _Offers({super.key});

  @override
  State<_Offers> createState() => _OffersState();
}

class _OffersState extends State<_Offers> {
  List<OffersModel>? list;
  Future<void> getData() async {
    final resp = await Dio().get('https://cosmatics.growfet.com/api/Sliders');

    list = OffersData.fromJon({"list": resp.data}).list;
    print(resp.data);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (list == null) {
      return Center(child: CircularProgressIndicator());
    }
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        aspectRatio: 364 / 320,
        autoPlay: true,
        viewportFraction: 1,
      ),
      items: List.generate(
        list!.length,
        (index) => Padding(
          padding: EdgeInsetsDirectional.only(end: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                AppImage(
                  image: list![index].imageUrl,

                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffE9DCD3).withValues(alpha: .8),
                  ),
                  padding: EdgeInsets.all(18),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${list![index].discount_percent}% OFF DISCOUNT\n CUPON CODE : ${list![index].coupon_code}",
                              style: TextStyle(
                                color: Color(0xff62322D),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          AppImage(image: 'offer.svg'),
                        ],
                      ),

                      Row(
                        children: [
                          AppImage(image: 'offer.svg'),
                          Expanded(
                            child: Text(
                              "${list![index].description_title1_en}\n${list![index].description_title2_ar}",
                              textAlign: TextAlign.end,

                              style: TextStyle(
                                color: Color(0xff434C6D),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
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

//????????

class OffersData {
  late List<OffersModel> list;
  OffersData.fromJon(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => OffersModel.fromJson(e)).toList();
  }
}

class OffersModel {
  late final String coupon_code,
      description_title1_en,
      description_title1_ar,
      description_title2_en,
      description_title2_ar;
  late final String imageUrl;

  late final num discount_percent;

  late final int id;

  OffersModel.fromJson(Map<String, dynamic> json) {
    coupon_code = json['coupon_code'] ?? "";
    description_title1_en = json['description_title1_en'] ?? "";
    description_title1_ar = json[' description_title1_ar'] ?? "";
    description_title2_en = json[' description_title2_en'] ?? "";
    description_title2_ar = json['description_title2_ar'] ?? "";
    imageUrl = json['image_url'] ?? "";
    discount_percent = json['discount_percent'] ?? 0;
    id = json['id'] ?? 0;
  }
}

class ProductsData {
  late final List<productModel> product;

  ProductsData.fromJson(Map<String, dynamic> json) {
    product = List.from(
      json['list'] ?? "",
    ).map((e) => productModel.fromJson(e)).toList();
  }
}

class productModel {
  late final num id;
  late final String nameEn;
  late final String nameAr;
  late final String descriptionEn;
  late final String descriptionAr;
  late final num price;
  late final num stock;
  late final String imageUrl;
  late final num categoryId;

  productModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    nameEn = json['name_en'] ?? '';
    nameAr = json['name_ar'] ?? "";
    descriptionEn = json['description_en'] ?? "";
    descriptionAr = json['description_ar'] ?? "";
    price = json['price'] ?? 0;
    stock = json['stock'] ?? 0;
    imageUrl = json['image_url'] ?? '';
    categoryId = json['category_id'] ?? 0;
  }
}
