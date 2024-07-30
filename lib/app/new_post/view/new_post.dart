import 'package:erp_demo/app/new_post/cubit/new_post_cubit.dart';
import 'package:erp_demo/constants/app_colors.dart';
import 'package:erp_demo/widgets/button_widget.dart';
import 'package:erp_demo/widgets/sizebox_widget.dart';
import 'package:erp_demo/widgets/text_formfileld_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final _nameController = TextEditingController();
  final _adressController = TextEditingController();
  final _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'New Post',
          ),
          backgroundColor: AppColors.blushPinkColor,
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.lightVioletColor,
                AppColors.blueColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 20.w, vertical: 15.h),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextformFieldWidget(
                      controller: _nameController,
                      labelText: 'Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBoxWidget(
                      height: 10,
                    ),
                    TextformFieldWidget(
                      controller: _adressController,
                      labelText: 'Address',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBoxWidget(
                      height: 10,
                    ),
                    TextformFieldWidget(
                      controller: _cityController,
                      labelText: 'City',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBoxWidget(
                      height: 25,
                    ),
                    BlocBuilder<NewPostCubit, NewPostState>(
                      builder: (context, state) {
                        if(state is NewPostLoadding){
                          return const Center(child: CircularProgressIndicator(),);
                        }
                        return ButtonWidget(
                            onClick: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<NewPostCubit>().newPostData(
                                  id: '', 
                                  name: _nameController.text, 
                                  address: _adressController.text, 
                                  city: _cityController.text
                                  );
                              }
                            },
                            text: 'Save');
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
