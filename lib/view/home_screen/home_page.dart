import 'package:blog_app/controller/cubit/dictionary_api/api_call_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var dictionaryController = TextEditingController();

/*  late StreamController _streamController;

  late Stream _stream;*/


 /* DictionaryApp(dictioaryWord) async {
    print(dictioaryWord);

    String url = 'https://owlbot.info/api/v4/dictionary/$dictioaryWord';


    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Token 67cf7719a34b1a7df1a4c72ab5e0c29748977b1d'
    });

    if (response.statusCode == 200) {
      var jasonData = json.decode(response.body);

      Dictionary data = Dictionary.fromJson(jasonData);

      print(data);
      _streamController.add(data);
    } else {
      _streamController.add('wrong');
    }
  }*/


  /*@override
  void initState() {
    _streamController = StreamController();
    _stream = _streamController.stream;

    super.initState();
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'My Blogs',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 28.h),
              ),
              trailing: Image.asset("assets/dictionary_blog.png"),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Create and post blogs")),
            ),
             SizedBox(height: 10.h,),
            Padding(
              padding:  EdgeInsets.all(10.sp),
              child: Row(
                children: [
                  Expanded(
                      flex: 8,
                      child: TextField(
                        controller: dictionaryController,
                        decoration: InputDecoration(

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "find meaning of a word",
                            fillColor: Colors.white70),
                      )
                  ),
                  Expanded(child: IconButton(onPressed: () {
                    context.read<ApiCallCubit>().dictionaryApi(name: dictionaryController.text.trim());
                    //DictionaryApp(dictionaryController.text.trim());
                  }, icon: const Icon(Icons.search))),
                ],

              ),
            ),


            /// BLoc builder
            BlocBuilder<ApiCallCubit, ApiCallState>(
              builder: (context, state) {

                /// initial state
                if(state is ApiCallLoading) {
                  return const Center(child: CircularProgressIndicator(),);
                }
                /// loaded state
                if(state is ApiCallLoadedState) {
                  return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: state.dictionaryModel!.definitions!.length,itemBuilder: (ctx,index){
                    var dic = state.dictionaryModel!.definitions![index];
                    return Padding(
                      padding:  EdgeInsets.all(8.sp),
                      child: ListView(
                        shrinkWrap: true,
                        primary: false,
                        children: [
                           SizedBox(height: 20.h,),
                          Text(state.dictionaryModel!.word!,style: const TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),),
                           SizedBox(height: 25.h,),
                          Container(
                              width: 150.w,
                              height: 150.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(dic.imageUrl!),
                                  )
                              )),
                           SizedBox(height: 20.h,),
                          const Divider(color: Colors.red,),
                          Text(dic.type!,style:  TextStyle(color: Colors.black,fontSize: 28.sp,fontWeight: FontWeight.bold),),
                           SizedBox(height: 10.h,),
                          Text(dic.definition!,style:  TextStyle(fontSize: 16.sp),),
                           SizedBox(height: 15.h,),
                           Divider(color: Colors.red,),
                           SizedBox(height: 10.h,),
                           Text("Example",style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold),),
                           SizedBox(height: 10.h,),
                          Text(dic.example!,style:  TextStyle(fontSize: 16.sp),),
                           SizedBox(height: 15.h,),
                          const Divider(color: Colors.red,),
                           SizedBox(height: 10.h,),
                        /*  const Text("Pronounciation",style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10,),*/
                          /*Text(state.dictionaryModel!.pronunciation!,style: const TextStyle(fontSize: 20),),*/

                        ],
                      ),
                    );
                  });
                }

                if(state is ApiCallErrorState){
                  return const Center(child: Text('error state'),);
                }
                /// error state
                else {
                  return  Container();
                }


              },
            ),


//             StreamBuilder(
//                 stream: _stream,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     if (snapshot.data == 'loading') {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (snapshot.data == 'wrong') {
//                       return const Center(
//                         child: Text('Something went wrong'),
//                       );
//                     } else {
//                       print(snapshot.data);
//                       Dictionary data = snapshot.data as Dictionary;
//
//                       return SizedBox(
//                         child: ListView.builder(
//                             primary: false,
//                             shrinkWrap: true,
//                             itemCount: data.definitions.length,
//                             itemBuilder: (ctx, index) {
//                               var dic = data.definitions[index];
//                               return Padding(
//                                 padding: EdgeInsets.all(8.sp),
//                                 child: ListView(
//                                   shrinkWrap: true,
//                                   primary: false,
//                                   children: [
//                                     Text(data.word, style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 30.sp,
//                                         fontWeight: FontWeight.bold),),
//                                     SizedBox(height: 10.h,),
//                                     Row(
//                                       children: [
//                                         Expanded(
//                                           child: Align(
//                                             alignment: Alignment.bottomLeft,
//                                             child: Container(
//                                                 width: 130.r,
//                                                 height: 130.r,
//                                                 decoration: new BoxDecoration(
//                                                     shape: BoxShape.circle,
//                                                     image: new DecorationImage(
//                                                       fit: BoxFit.fill,
//                                                       image: new NetworkImage(
//                                                           dic!.imageUrl),
//                                                     )
//                                                 )),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 15.h,),
//                                     Divider(color: Colors.red,),
//                                     Text(dic.type, style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 25.sp,
//                                         fontWeight: FontWeight.bold),),
//                                     SizedBox(height: 10.h,),
//                                     Text(dic.definition,
//                                       style: TextStyle(fontSize: 14.sp),),
//                                     SizedBox(height: 15.h,),
//                                     Divider(color: Colors.red,),
//                                     SizedBox(height: 10.h,),
//                                     Text("Example", style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 25.sp,
//                                         fontWeight: FontWeight.bold),),
//                                     SizedBox(height: 10.h,),
//                                     Text(dic.example,
//                                       style: TextStyle(fontSize: 14.sp),),
//                                     SizedBox(height: 15.h,),
//                                     Divider(color: Colors.red,),
//                                     SizedBox(height: 10.h,),
//                                     Text("Pronounciation", style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 25.sp,
//                                         fontWeight: FontWeight.bold)),
//                                     SizedBox(height: 10.h,),
//                                     Text(data.pronunciation,
//                                       style: TextStyle(fontSize: 14.sp),),
//
//                                   ],
//                                 ),
//                               );
//                             }),
//                       );
// /*
//                         return Container(
//                           height: 1.sh,
//                           width: 1.sw,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//
//                             ],
//                           ),
//                         );
// */
//                     }
//                   } else {
//                     return Container();
//                   }
//                 })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0D638A),
        shape: const StadiumBorder(side: BorderSide(color: Color(0xFF0D638A),)),
      ),
    );
  }
}
