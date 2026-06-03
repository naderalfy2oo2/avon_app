import 'package:avon_app/core/components/app_image.dart';
import 'package:avon_app/core/components/helper_methods.dart';
import 'package:avon_app/views/auth/login.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _Header(),

            SingleChildScrollView(
              padding: EdgeInsets.all(16).copyWith(top: 100),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppImage(
                    image:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIsEfO454WwEXP1LXocen-skMNiax3lg9LeQ&s',
                    height: 96,
                    width: 96,
                    isCircle: true,
                  ),

                  Text(
                    'Sara Samer Talaat',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),

                  SizedBox(height: 40),
                  _Item(image: 'edit_info.svg', title: 'Edit Info'),
                  _Item(image: 'order_history.svg', title: 'Order History'),
                  _Item(image: 'wallet.svg', title: 'Wallet'),
                  _Item(image: 'settings.svg', title: 'Settings'),
                  _Item(image: 'voucher.svg', title: 'Voucher'),
                  _Item(
                    image: 'logout.svg',
                    title: 'Logout',
                    dasnationpage: LoginView(),
                    isLogOut: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xffECA4C5),
            Color(0xff434C6DD4).withValues(alpha: .83),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String image, title;
  final bool isLogOut;
  final Widget? dasnationpage;

  const _Item({
    super.key,
    required this.image,
    required this.title,

    this.isLogOut = false,
    this.dasnationpage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: dasnationpage == null
          ? null
          : () {
              goTo(page: dasnationpage!);
            },
      leading: AppImage(image: image),
      title: Text(
        title,
        style: TextStyle(color: isLogOut ? Color(0xffCD0F0F) : null),
      ),
      trailing: isLogOut ? null : AppImage(image: 'play.svg'),
    );
  }
}
