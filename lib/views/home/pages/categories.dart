import 'package:avon_app/core/components/app_image.dart';
import 'package:avon_app/core/components/app_search.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
            AppSearch(),

            ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 30,
              ).copyWith(bottom: 60),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => _Item(),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(),
              ),
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImage(
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwWYtOMAp0yxF9PMOQ3aBqVYJabXl9yAThHw&s',
          height: 64,
          width: 64,
        ),
        SizedBox(width: 12),

        Expanded(
          child: Text(
            "Bundles",
            style: TextStyle(
              color: Color(0xff434C6D),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        AppImage(image: 'play.svg'),
      ],
    );
  }
}
