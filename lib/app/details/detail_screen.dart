import 'package:erp_demo/app/details/cubit/delete_cubit.dart';
import 'package:erp_demo/app/details/cubit/detail_screen_cubit.dart';
import 'package:erp_demo/app/home/model/home_model.dart';
import 'package:erp_demo/constants/app_colors.dart';
import 'package:erp_demo/utils/routes/routes.dart';
import 'package:erp_demo/widgets/button_widget.dart';
import 'package:erp_demo/widgets/sizebox_widget.dart';
import 'package:erp_demo/widgets/text_formfileld_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatefulWidget {
  final HomeModel home;
  const DetailScreen({super.key, required this.home});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _idController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _idController.text = widget.home.id ?? '';
    _nameController.text = widget.home.name ?? '';
    _addressController.text = widget.home.address ?? "";
    _cityController.text = widget.home.city ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightVioletColor,
          title: const Text('Details Screen'),
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<DetailScreenCubit, DetailScreenState>(
                listener: (context, state) {
              if (state is DetailScreenSuccess) {
                // SchedulerBinding.instance.addPersistentFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Data Updated Successfully'),
                  backgroundColor: AppColors.emeraldGreenColor,
                ));
                // });
              } else if (state is DetailScreenError) {
                SchedulerBinding.instance.addPersistentFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${state.errorMessage}')));
                });
              }
            }),
            BlocListener<DeleteCubit, DeleteState>(listener: (context, state) {
              if (state is DeleteSuccess) {
                // SchedulerBinding.instance.addPersistentFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Data Deleted Successfully'),
                  backgroundColor: AppColors.emeraldGreenColor,
                ));
                //});
              } else if (state is DeleteError) {
                SchedulerBinding.instance.addPersistentFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error : ${state.errorMessage}')));
                });
              }
            })
          ],
          child: Container(
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
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Text(
                        widget.home.id ?? "",
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    const SizedBoxWidget(height: 20),
                    TextformFieldWidget(
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBoxWidget(height: 15),
                    TextformFieldWidget(
                      controller: _addressController,
                    ),
                    const SizedBoxWidget(height: 15),
                    TextformFieldWidget(
                      controller: _cityController,
                    ),
                    const SizedBoxWidget(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BlocBuilder<DeleteCubit, DeleteState>(
                            builder: (context, state) {
                          if (state is DeleteLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ButtonWidget(
                              onClick: () {
                                context
                                    .read<DeleteCubit>()
                                    .deleteData(id: widget.home.id ?? "");
                                context.push(Routes.homeScreen);
                              },
                              text: 'Delete',
                            );
                          }
                        }),
                        BlocBuilder<DetailScreenCubit, DetailScreenState>(
                          builder: (context, state) {
                            if (state is DetailScreenLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ButtonWidget(
                                onClick: () {
                                  if (_formKey.currentState!.validate()) {
                                    final namex = _nameController.text;
                                    final idx = _idController.text;
                                    final addressx = _addressController.text;
                                    final cityx = _cityController.text;
                                    context
                                        .read<DetailScreenCubit>()
                                        .putDetailScreen(
                                          id: idx,
                                          name: namex,
                                          address: addressx,
                                          city: cityx,
                                          context: context,
                                        );
                                    context.push(Routes.homeScreen);
                                  }
                                },
                                text: 'Update',
                              );
                            }
                          },
                        ),
                      ],
                    ),
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
