import 'package:avon_app/core/components/app_image.dart';
import 'package:avon_app/core/components/helper_methods.dart';
import 'package:avon_app/core/components/logic/dio_helper.dart';

import 'package:avon_app/views/auth/login.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileModel? user;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final res = await DioHelper.getData("", path: "api/Auth/profile");
    print(res.isSucess);
    print(res.msg);

    print("${res.isSucess}");
    print(" ${res.data}");
    print(" ${res.data.runtimeType}");

    if (res.isSucess && res.data is Map) {
      user = ProfileModel.fromJson(Map<String, dynamic>.from(res.data!));
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _Header(),

            if (loading)
              const Center(child: CircularProgressIndicator())
            else
              SingleChildScrollView(
                padding: EdgeInsets.all(16).copyWith(top: 100),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppImage(
                      image:
                          user?.profilePhotoUrl ??
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIsEfO454WwEXP1LXocen-skMNiax3lg9LeQ&s',

                      height: 96,
                      width: 96,
                      isCircle: true,
                    ),

                    Text(
                      user?.username ?? "",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
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
                      isLogOut: true,
                      onLogout: () async {
                        final res = await DioHelper.SendData(
                          path: "api/Auth/logout",
                        );

                        showMsg(
                          res.msg ?? "Logged out successfully",
                          isError: !res.isSucess,
                        );

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginView()),
                          (route) => false,
                        );
                      },
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
  final Future<void> Function()? onLogout;
  final String image, title;
  final bool isLogOut;
  final Widget? dasnationpage;

  const _Item({
    super.key,
    required this.image,
    required this.title,

    this.isLogOut = false,
    this.dasnationpage,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        if (isLogOut) {
          await onLogout?.call();
        } else if (dasnationpage != null) {
          goTo(page: dasnationpage!);
        }
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

class ProfileModel {
  final int id;
  final String username;
  final String email;
  final String role;
  final String phoneNumber;
  final String countryCode;
  final String profilePhotoUrl;

  ProfileModel({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    required this.phoneNumber,
    required this.countryCode,
    required this.profilePhotoUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      role: json['role'],
      phoneNumber: json['phoneNumber'],
      countryCode: json['countryCode'],
      profilePhotoUrl: json['profilePhotoUrl'],
    );
  }
}
