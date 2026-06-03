import 'package:avon_app/core/components/app_Back.dart';
import 'package:avon_app/core/components/app_button.dart';
import 'package:avon_app/core/components/app_image.dart';
import 'package:flutter/material.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: AppBack(),
        title: Text('Checkout'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            color: Color(0xff29D3DA1C).withValues(alpha: .11),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Delivery to'),
                SizedBox(height: 16),
                _Tile(
                  title: 'Home',
                  subTitle: 'Mansoura, 14 Porsaid St',
                  leading: Container(color: Colors.red, height: 60, width: 97),
                ),

                SizedBox(height: 40),

                Text('Payment Method'),

                SizedBox(height: 18),
                _Tile(
                  title: '**** **** **** 0256',
                  leading: AppImage(image: 'meza.svg'),
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 14),
                //   child: ListTile(
                //     contentPadding: EdgeInsets.all(12),
                //     horizontalTitleGap: 10,
                //     shape: RoundedRectangleBorder(
                //       side: BorderSide(color: Color(0xff73B9BB), width: 1.5),
                //       borderRadius: BorderRadius.circular(30),
                //     ),
                //     leading: AppImage(image: 'meza.svg'),
                //     title: Text(
                //       '**** **** **** 0256',
                //       style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                //     ),
                //     trailing: AppImage(image: 'arrow.svg'),
                //   ),
                // ),
                SizedBox(height: 12),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 14),
                //   child: ListTile(
                //     contentPadding: EdgeInsets.all(12),
                //     horizontalTitleGap: 10,
                //     shape: RoundedRectangleBorder(
                //       side: BorderSide(color: Color(0xff73B9BB), width: 1.5),
                //       borderRadius: BorderRadius.circular(30),
                //     ),
                //     leading: AppImage(image: 'voucher.svg'),
                //     title: Text(
                //       'Add vaucher',
                //       style: TextStyle(
                //         fontSize: 12,
                //         fontWeight: FontWeight.w600,
                //         color: Color(0xff434C6D),
                //       ),
                //     ),
                //     trailing: Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 12),
                //       child: AppButton(text: 'Apply'),
                //     ),
                //   ),
                // ),
                _Tile(
                  title: 'Add vaucher',
                  leading: AppImage(image: 'voucher.svg'),
                  trilling: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: AppButton(text: 'Apply'),
                  ),
                ),

                SizedBox(height: 32),
                Text(
                  '-' * 100,
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0xff434C6D4F).withValues(alpha: .30),
                  ),
                ),
                SizedBox(height: 12),

                Text(
                  '- REVIEW PAYMENT',

                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff434C6D),
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  'PAYMENT SUMMARY',

                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff434C6D),
                  ),
                ),

                SizedBox(height: 40),
                _detailsText(title: 'Subtotal', value: '16.100 EGP'),
                _detailsText(title: 'SHIPPING FEES', value: 'TO BE CALCULATED'),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Divider(color: Color(0xff73B9BB)),
                ),

                _detailsText(
                  title: 'TOTAL + VAT',
                  value: '16.100 EGP',
                  ValuefontWeight: FontWeight.bold,
                ),

                SizedBox(height: 35),

                AppButton(text: 'ORDER', Icon: 'order.svg'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _detailsText extends StatelessWidget {
  final String title, value;
  final FontWeight ValuefontWeight;

  const _detailsText({
    super.key,
    required this.title,
    required this.value,
    this.ValuefontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,

            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),

          Text(
            value,

            style: TextStyle(fontSize: 12, fontWeight: ValuefontWeight),
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? leadingImage;
  final Widget? leading, trilling;
  const _Tile({
    super.key,
    required this.title,
    this.subTitle,
    this.leading,
    this.trilling,
    this.leadingImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: ListTile(
        contentPadding: leading != null ? EdgeInsets.all(12) : null,
        horizontalTitleGap: 10,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xff73B9BB), width: 1.5),
          borderRadius: BorderRadius.circular(30),
        ),
        leading: leading ?? AppImage(image: leadingImage ?? ""),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            if (subTitle != null)
              Text(
                subTitle!,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff8E8EA9),
                ),
              ),
          ],
        ),
        trailing: trilling ?? AppImage(image: 'arrow.svg'),
      ),
    );
  }
}
