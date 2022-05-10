
import 'package:blog_app/controller/cubit/profile/profile_cubit.dart';
import 'package:blog_app/view/home_screen/home_page.dart';
import 'package:blog_app/view/home_screen/profile_page.dart';
import 'package:blog_app/view/home_screen/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/cubit/bottom_navigation_bar_cubit.dart';

class DashBoard extends StatefulWidget {

  static const dashBoardRoute = 'route2';

  final String email;
  final String password;

   const DashBoard( this.email,  this.password);


  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {



  PageController controller=PageController(initialPage: 0);

  @override
  void initState() {
    context.read<ProfileCubit>().profile(widget.email,widget.password);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (content) => BottomNavigationBarCubit(0),
      child: Scaffold(
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: BlocBuilder<BottomNavigationBarCubit, int>(
            builder: (context, state) {
              return PageView(
                controller: controller,
                onPageChanged: (x){
                  state = x;
                  context.read<BottomNavigationBarCubit>().changeIndex(index: state);
                },
                children:   [
                  const HomePage(),
                  const SearchPage(),
                  ProfilePage(email:widget.email,password:widget.password),

                ],
              );
            },
          ),
        ),

        bottomNavigationBar: Container(
          height: 60.h,
          color: const Color(0xFF0D638A),
          child: BlocBuilder<BottomNavigationBarCubit, int>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: IconButton(onPressed: (){
                            controller.jumpToPage(0);
                            context.read<BottomNavigationBarCubit>()
                                .changeIndex(index: 0);
                          }, icon: const Icon(Icons.home),color: state == 0 ? const Color(0xFFFFFFFF) : const Color(0xFFB6B7B7)),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [

                        Expanded(
                          child: IconButton(onPressed: (){ controller.jumpToPage(1);

                          context.read<BottomNavigationBarCubit>()
                              .changeIndex(index: 1);

                          }, icon: const Icon(Icons.search),color: state == 1 ? const Color(0xFFFFFFFF) : const Color(0xFFB6B7B7)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [

                        Expanded(
                          child: IconButton(onPressed: (){ controller.jumpToPage(2);
                          context.read<BottomNavigationBarCubit>()
                              .changeIndex(index: 2);
                          }, icon: const Icon(Icons.person),color: state == 2 ? const Color(0xFFFFFFFF) : const Color(0xFFB6B7B7)),
                        ),

                      ],
                    ),
                  ),


                ],
              );
            },
          ),

        ),
      ),
    );
  }
}
