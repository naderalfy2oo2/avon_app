import 'package:avon_app/core/components/app_image.dart';
import 'package:avon_app/core/components/app_search.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<CategoryModel>? list;
  Future<void> getData() async {
    final resp = await Dio().get(
      'https://cosmatics.growfet.com/api/Categories',
    );

    list = CategoryData.fromJson({"result": resp.data}).result;
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
    return Scaffold(
      appBar: AppBar(title: Text("Categories"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
            AppSearch(),
            list == null
                ? CircularProgressIndicator()
                : ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 30,
                    ).copyWith(bottom: 60),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => _Item(model: list![index]),
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Divider(),
                    ),
                    itemCount: list!.length,
                  ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final CategoryModel model;
  const _Item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImage(image: model.imageUrl, height: 64, width: 64),
        SizedBox(width: 12),

        Expanded(
          child: Text(
            model.titleEn,
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

class CategoryData {
  late final List<CategoryModel> result;

  CategoryData.fromJson(Map<String, dynamic> json) {
    result = List.from(
      json['result'] ?? [],
    ).map((e) => CategoryModel.fromJson(e)).toList();
  }
}

class CategoryModel {
  late final num id;
  late final String titleEn;
  late final String titleAr;
  late final String imageUrl;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    titleEn = json['title_en'];
    titleAr = json['title_ar'];
    imageUrl = json['image_url'];
  }
}
