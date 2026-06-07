import 'package:avon_app/core/components/app_image.dart';
import 'package:flutter/material.dart';

import '../../../core/components/helper_methods.dart';
import '../../../core/components/logic/dio_helper.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  List<CartModel> items = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();
    getCart();
  }

  Future getCart() async {
    items = await CartService.getCart();

    loading = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart"), centerTitle: true),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You have 4 products in your cart",
                    style: TextStyle(
                      color: Color(0xff434C6D8C).withValues(alpha: .55),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 8),

                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 34,
                      ).copyWith(top: 12, bottom: 100),

                      itemCount: items.length,

                      itemBuilder: (context, index) {
                        final item = items[index];

                        return _Item(
                          getData: getCart,
                          id: item.productId,
                          model: item,
                          onPlus: () async {
                            final quantity = item.quantity + 1;

                            setState(() {
                              items[index] = CartModel(
                                productId: item.productId,
                                name: item.name,
                                image: item.image,
                                price: item.price,
                                quantity: quantity,
                              );
                            });

                            await CartService.update(item.productId, quantity);

                            showMsg("Quantity Increased");

                            await CartService.update(
                              item.productId,
                              item.quantity + 1,
                            );
                          },

                          onMinus: () async {
                            if (item.quantity > 1) {
                              final newQty = item.quantity - 1;

                              setState(() {
                                items[index] = CartModel(
                                  productId: item.productId,
                                  name: item.name,
                                  image: item.image,
                                  price: item.price,
                                  quantity: newQty,
                                );
                              });

                              await CartService.update(item.productId, newQty);

                              showMsg("Quantity Decreased");
                            }

                            await CartService.update(
                              item.productId,
                              item.quantity - 1,
                            );
                          },
                        );
                      },

                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Divider(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class _Item extends StatefulWidget {
  final CartModel model;
  final VoidCallback onPlus;
  final VoidCallback onMinus;
  final int id;
  final VoidCallback getData;
  const _Item({
    super.key,
    required this.model,
    required this.onPlus,
    required this.onMinus,
    required this.id,
    required this.getData,
  });

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AppImage(
                image:
                    widget.model?.image ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq8YulBksY8qeaRulg3e8SJHp3mpjFXou2uA&s',
                height: 102,
                width: 102,
                fit: BoxFit.cover,
              ),
            ),
            GestureDetector(
              onTap: () async {
                await CartService.delete(widget.id);
                widget.getData();
                setState(() {});

                showMsg('remove product');
              },

              child: AppImage(image: 'delete.svg'),
            ),
          ],
        ),
        SizedBox(width: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: Color(0xff3B4569),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(text: widget.model.name),

                      TextSpan(
                        text: '\n Ultra rich mascara for lashes\n\n',

                        style: TextStyle(
                          color: Color(0xff3B4569BA).withValues(alpha: .73),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      TextSpan(text: '${widget.model.price}'),
                    ],
                  ),
                ),

                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff8E8EA9)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: widget.onMinus,
                          icon: AppImage(image: 'minus.svg'),
                        ),

                        Text(
                          "${widget.model.quantity}",
                          style: TextStyle(
                            color: Color(0xff434C6D),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        IconButton(
                          onPressed: widget.onPlus,
                          icon: AppImage(image: 'plus.svg'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CartModel {
  final int productId;
  final String name;
  final String image;
  final num price;
  final int quantity;

  CartModel({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json['product_id'] ?? 0,
      name: json['product_name_en'] ?? "",
      image: json['image_url'] ?? "",
      price: json['price'] ?? 0,
      quantity: json['quantity'] ?? 1,
    );
  }
}

class CartService {
  static Future<List<CartModel>> getCart() async {
    final res = await DioHelper.getData("", path: "/api/Cart");

    if (!res.isSucess) return [];

    List data = res.data!["items"] ?? [];

    return data.map((e) => CartModel.fromJson(e)).toList();
  }

  static Future<CustomResponse> add(int id, {required int productId}) async {
    return await DioHelper.SendData(
      path: 'api/Cart/add',
      query: {'productId': productId, 'quantity': 1},
    );
  }

  static Future update(int id, int qty) async {
    return await DioHelper.SendData(
      path: "/api/Cart/update",
      data: {"productId": id, "quantity": qty},
    );
  }

  static Future delete(int id) async {
    return await DioHelper.deleteData(path: "/api/Cart/remove/$id");
  }
}
