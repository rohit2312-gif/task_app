import 'package:flutter/material.dart';
import 'networking.dart';
import 'view.dart';
void main() {
  runApp(MyApp());
}



List<Photos> photos=[];
provider ()async{

  var get_data=await decoder();
 // print(get_data);

  for (var x in get_data){
    photos.add(Photos(title: x["title"],url: x["url"],thumbnailurl: x["thumbnailUrl"],id: x["id"]));



  }
  print(photos.length);
  return photos;

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: Text('Froshlink'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: provider(),
          builder: (context,snapshot){
            if (snapshot.hasData){
              return GridView.builder(
                itemCount: photos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {

                  return GestureDetector(
                    onTap: (){
                      showModalBottomSheet(context: context, builder: (context){
                        return Column(
                          children: [
                            Image.network(snapshot.data[index].url),
                            Text(snapshot.data[index].title),
                          ],
                        );

                      });
                    },
                    child: Card(
                      elevation: 10.0,
                      borderOnForeground: true,
                      margin: EdgeInsets.all(10.0),
                      child: Image.network(snapshot.data[index].url),

                    ),
                  );
                },
              );
            }
            else{
             return Center(
               child: CircularProgressIndicator(

               ),
             );
            }
          },

        ),
      ),
    );
  }
}