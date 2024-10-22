import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medi_ghor/common/widgets/app_bar/appbar.dart';
import 'package:medi_ghor/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:medi_ghor/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:medi_ghor/common/widgets/texts/section_heading.dart';
import 'package:medi_ghor/utils/constants/colors.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header
            RPrimaryHeaderContainer(child: Column(
              children: [
                ///app bar
                RAppbar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: RColors.white),), ),

                ///profile card
                RUserProfileTile(),
                const SizedBox(height: RSizes.spaceBtwSections,),
              ],
            ),
            ),



            ///body
            Padding(
                padding: EdgeInsets.all(RSizes.defaultSpace),
              child: Column(
                children: [
                  RSectionHeading(title: 'Account Settings', showActionButton: false,),
                  SizedBox(height: RSizes.spaceBtwItems,),
                  RSettingsMenuTile(icon: Iconsax.safe_home, title: 'My address', subtitle: 'My shopping delivery address', onTap: (){},),

                  ///logout button
                  SizedBox(height: RSizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: ()async {await AuthenticationRepository.instance.logout();},
                        child: Text('Logout')),
                  ),
                  SizedBox(height: RSizes.spaceBtwSections * 2.5,),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}


