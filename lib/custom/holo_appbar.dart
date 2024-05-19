import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holo/AppBarIcons/appbar_profile.dart';
import 'package:holo/AppBarIcons/appbar_search.dart';
import 'package:holo/AppBarIcons/appbar_setting.dart';
import '../AppBarIcons/appbar_alarm.dart';

class HoloAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String region;
  final bool profile, search, setting, alarm, underbar;
  final BuildContext context;

  const HoloAppBar(
      {super.key,
      required this.region,
      required this.context,
      required this.profile,
      required this.search,
      required this.setting,
      required this.alarm,
      required this.underbar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      shape: underbar
          ? Border(bottom: BorderSide(color: Colors.grey, width: 1))
          : null,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                region,
                style: TextStyle(fontSize: 16),
              ),
              SvgPicture.asset("assets/icons/under-direction.svg"),
            ],
          ),
          Row(
            children: [
              if (profile == true)
                Transform.translate(
                  offset: Offset(30, 0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppBarProfile()));
                      },
                      icon: SvgPicture.asset('assets/icons/user-circle.svg'),
                      iconSize: 27),
                ),
              if (search == true)
                Transform.translate(
                  offset: Offset(15, 0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppBarSearch()));
                    },
                    icon: SvgPicture.asset('assets/icons/search.svg'),
                    iconSize: 30,
                  ),
                ),
              if (alarm == true)
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AppBarAlarm()));
                  },
                  icon: SvgPicture.asset('assets/icons/bell-03.svg'),
                ),
              if (setting == true)
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppBarSetting()));
                    },
                    icon: SvgPicture.asset('assets/icons/settings-02.svg')),
            ],
          ),
        ],
      ),

      // toolbarHeight: MediaQuery.of(context).size.height / 12,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height / 13);
}