import 'package:blog_app/controller/cubit/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  static const profilePageRoute = 'ProfilePageRoute';

  final String email;
  final String password;

  const ProfilePage({required this.email, required this.password});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  /* late StreamController _streamController;

  late Stream _stream;*/

  /*getUserData() async {
    var response =
    await http.post(Uri.parse('https://inveoa.com/api/login'), body: {
      'email': widget.email,
      'password': widget.password,
    });

    if (response.statusCode == 200) {
      var jasonData = json.decode(response.body);

      DataModel data = DataModel.fromJson(jasonData);

      print(data);
      _streamController.add(data);
    } else {
      _streamController.add('wrong');
    }
  }*/

  /* @override
  void initState() {
    _streamController = StreamController();
    _stream = _streamController.stream;

    _streamController.add('loading');

    getUserData();

    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ProfilePage"),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {

            if(state is ProfileInitial){
              return const CircularProgressIndicator();
            }

            if(state is ProfileLoadedState){
                return SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                          width: 170.w,
                          height: 170.h,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  'https://ui-avatars.com/api/?name=shehriyar&color=7F9CF5&background=EBF4FF',
                                ),
                              ))),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              widget.email,
                              style: TextStyle(
                                  fontSize: 25.sp, fontWeight: FontWeight.bold),
                            ))),
                    Expanded(
                        flex: 3,
                        child: Text(
                          widget.email,
                          style:
                          TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                        )),
                    const Spacer(
                      flex: 8,
                    ),
                  ],
                ),
              );
            }
            else {
              return const Text("Error States");
            }



          },
        ));
  }
}
