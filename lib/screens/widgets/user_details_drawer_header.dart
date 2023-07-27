
import 'package:eazy_techno_application/package/package/package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../app_constants/app_constant.dart';
import '../../main.dart';

class UserDetailsDrawerHeader extends StatelessWidget{
  const UserDetailsDrawerHeader({super.key});

  @override
  Widget build(BuildContext context){
    return  BlocConsumer<UserStore, User>(
            bloc: getIt.get<UserStore>(),
            listener: (ctx, state) {},
            builder: (context, user) {
              return Stack(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(user.name),
                    accountEmail: Text(user.email),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(user.image),
                      child: const FaIcon(
                        FontAwesomeIcons.circleUser,
                        size: 30,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: FavIcon(
                      icon: FontAwesomeIcons.penToSquare,
                      iconColor: kLight,
                      onTap: () {
                        'TODO: go to profile page'.log();

                        /// TODO: go to profile page
                      },
                    ),
                  )
                ],
              );
            },
            );
  }
  
  
}