import 'package:avon_app/core/components/app_image.dart';
import 'package:flutter/material.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart"), centerTitle: true),
      body: Padding(
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
                itemBuilder: (context, index) => _Item(),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Divider(),
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  const _Item({super.key});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  int count = 1;
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
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq8YulBksY8qeaRulg3e8SJHp3mpjFXou2uA&s',
                height: 102,
                width: 102,
                fit: BoxFit.cover,
              ),
            ),
            AppImage(image: 'delete.svg'),
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
                      TextSpan(text: 'Note Cosmetics\n'),

                      TextSpan(
                        text: 'Ultra rich mascara for lashes\n\n',

                        style: TextStyle(
                          color: Color(0xff3B4569BA).withValues(alpha: .73),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      TextSpan(text: '350 EGP'),
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
                          onPressed: () {
                            if (count > 1) {
                              count--;
                              setState(() {});
                            }
                          },
                          icon: AppImage(image: 'minus.svg'),
                        ),
                        Text(
                          "$count",
                          style: TextStyle(
                            color: Color(0xff434C6D),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            count++;
                            setState(() {});
                          },
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
