import 'package:avon_app/core/components/app_image.dart';
import 'package:avon_app/core/components/app_input.dart';
import 'package:avon_app/core/components/app_search.dart';
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
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    AppImage(
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTow5dHm-vUCYSMeRKf3Vd2cWEzzYTffQKIhQ&s',
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
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "50% OFF DISCOUNT\n CUPON CODE : 125865",
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
                                  "Hurry up!\nSkin care only !",
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

              SizedBox(height: 24),

              Text(
                "Top rated products",
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 14),

              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 176 / 237,
                ),
                itemCount: 10,
                itemBuilder: (context, index) => _Item(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key});

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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: AppImage(
                image:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyJ4o4s8Vr6uuetWRFzS5DVrCB22EMW9OSgw&s',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 11),
          Text(
            "Face tint / lip tint",
            style: TextStyle(
              color: Color(0xff434C6D),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 11),

          Text(
            "\$44.99",

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
