import 'package:erp_demo/constants/app_colors.dart';
import 'package:erp_demo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SelectedItemsListview extends StatefulWidget {
  const SelectedItemsListview({super.key});

  @override
  State<SelectedItemsListview> createState() => _SelectedItemsListviewState();
}

class _SelectedItemsListviewState extends State<SelectedItemsListview> {

  List<String> name = ['January','February','March','April','May','June','July','Agust','October','November','December'];
  List<String> tempArray = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const TextWidget(text: 'Flutter Demo selected listview items',fontSize: 15,color: AppColors.whiteColor,),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: name.length,
                itemBuilder: ( context,  index) {
                  return InkWell(
                    onTap: (){
                      setState(() {
                         if( tempArray.contains(name[index].toString())){
                        ( tempArray.remove(name[index].toString()));
                      } else {
                        ( tempArray.add(name[index].toString()));
                      }
                      });
                      print('myValue');
                      print(tempArray.toString());
                    },
                    child: Card(
                      child: ListTile(
                        title: TextWidget(text: name[index].toString()),
                        trailing: Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                            color: tempArray.contains(name[index].toString())? AppColors.crimsonRedColor :  AppColors.emeraldGreenColor,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(
                            child: TextWidget(text: tempArray.contains(name[index].toString()) ? 'Remove' : 'Add'),
                          ),
                        ),
                      ),
                    ),
                  );
                  },),
            )
          ],
        ),
      ),
    );
  }
}
