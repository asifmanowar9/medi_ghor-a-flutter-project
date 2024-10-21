import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/r_circular_image.dart';

class RUserProfileTile extends StatelessWidget {
  const RUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: RCircularImage(image: RImages.user,height: 50, width: 50, padding: 0,),
      title: Text('Asif Manowar', style: Theme.of(context).textTheme.headlineMedium!.apply(color: RColors.white),),
      subtitle: Text('asifpc2022@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: RColors.white),),
      trailing: IconButton(onPressed: (){}, icon: Icon(Iconsax.edit , color: RColors.white,)),
    );
  }
}