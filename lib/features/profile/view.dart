import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/core/app_router/router.dart';
import 'package:latech_app/features/account_info/view.dart';
import 'package:latech_app/features/profile/cubit/cubit.dart';
import 'package:latech_app/features/profile/cubit/states.dart';
import 'package:latech_app/features/profile/units/list.dart';
import 'package:latech_app/features/splash/view.dart';
import 'package:latech_app/widgets/app_bar.dart';
import 'package:latech_app/widgets/app_bar2.dart';
import 'package:latech_app/widgets/loading_indicator.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2('Account'),
      body:BlocProvider(
        create: (context) => ProfileCubit()..getProfileData(),
        child: BlocBuilder<ProfileCubit,ProfileStates>(
          builder: (context, state) {
            if(state is ProfileLoadingState) return Scaffold(body: LoadingIndicator(),);
            final accountData = ProfileCubit.get(context).profileModel!.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150)
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            child: Image.network(accountData!.image.toString()),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(accountData.name.toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),)
                      ],
                    ),
                  ),
                  AccountMenu(txt: 'Orders',),
                  AccountMenu(txt: 'Account information',function: ()=>MagicRouter.navigateTo(AccountInfo())),
                  AccountMenu(txt: 'Help'),
                  AccountMenu(txt: 'Terms & Conditions'),
                  AccountMenu(txt: 'Your Adresses'),
                  AccountMenu(txt: 'About us'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                    child: MaterialButton(
                      padding: EdgeInsets.all(15),
                      minWidth: double.infinity,
                      onPressed:() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AccountInfo(),));
                      },
                      color: Color(0xFFF40202),
                      child: Text('Logout',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ) ,
    );
  }
}
