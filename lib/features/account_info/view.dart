import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/core/app_router/router.dart';
import 'package:latech_app/features/change_pass/view.dart';
import 'package:latech_app/features/profile/cubit/cubit.dart';
import 'package:latech_app/features/profile/cubit/states.dart';
import 'package:latech_app/features/profile/model.dart';
import 'package:latech_app/widgets/app_bar2.dart';
import 'package:latech_app/widgets/loading_indicator.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2(''),
      body: BlocProvider(
        create: (context) => ProfileCubit()..getProfileData(),
        child: BlocBuilder<ProfileCubit,ProfileStates>(
          builder: (context, state) {
            if(state is ProfileLoadingState) return Scaffold(body: LoadingIndicator(),);
            final accountData = ProfileCubit.get(context).profileModel!.data;
            return ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: Text('Account information',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22),),
                ),
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    child: Image.network(accountData!.image.toString()),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('User name',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                      SizedBox(height: 10),
                      Text(accountData.name.toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Color(0xFF0001FC)),),
                      SizedBox(height: 20),
                      Text('Email Address',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                      SizedBox(height: 10),
                      Text(accountData.email.toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Color(0xFF0001FC)),),
                      SizedBox(height: 20),
                      Text('Phone Number',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                      SizedBox(height: 10),
                      Text(accountData.phone.toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Color(0xFF0001FC)),),
                      SizedBox(height: 20),
                      Text('Credit',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                      SizedBox(height: 10),
                      Text(accountData.credit.toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Color(0xFF0001FC)),),
                      SizedBox(height: 20),
                      Text('Password',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('*********** ',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Color(0xFF0001FC)),),
                          MaterialButton(onPressed:(){
                            MagicRouter.navigateTo(ChangePassView());
                          },
                            child: Text('Change'),
                          )
                        ],
                      )

                    ],
                  ),
                )

              ],
            );
          },
        ),
      ),
    );
  }
}
