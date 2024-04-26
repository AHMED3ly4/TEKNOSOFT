import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/core/utils/viladators.dart';
import 'package:e_commerce/core/widgets/default_elevated_button.dart';
import 'package:e_commerce/features/account/data/models/add_address_request.dart';
import 'package:e_commerce/features/account/data/models/address.dart';
import 'package:e_commerce/features/account/presentation/cubit/account_cubit.dart';
import 'package:e_commerce/features/account/presentation/cubit/account_states.dart';
import 'package:e_commerce/features/account/presentation/widgets/editable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressScreen extends StatelessWidget {
  static const routeName ="/AAS";

  AddAddressScreen({super.key});
  final nameController =TextEditingController();
  final cityController =TextEditingController();
  final detailsController =TextEditingController();
  final numberController =TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = ModalRoute.of(context)!.settings.arguments as AccountCubit;
    return Scaffold(
      appBar: AppBar(

        title: const Text("Add Address"),
        centerTitle: true,
      ),
      body: BlocConsumer<AccountCubit,AccountStates>(
        bloc: cubit,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      EditableTextField(
                        label: "Name",
                        isEditable: false,
                        enabled: true,
                        controller: nameController,
                        validator: (content){
                          if(content == '' || content ==null) {
                            return "must have a name";
                          }
                        },
                      ),
                      SizedBox(height:12.h),
                      EditableTextField(
                        label: "City",
                        isEditable: false,
                        enabled: true,
                        controller: cityController,
                        validator: (content){
                          if(content == '' || content ==null) {
                            return "please enter your city";
                          }
                        },
                      ),
                      SizedBox(height:12.h),
                      EditableTextField(
                        label: "Details",
                        isEditable: false,
                        enabled: true,
                        controller: detailsController,
                        validator: (content){
                          if(content == '' || content ==null) {
                            return "please enter the details";
                          }
                        },
                      ),
                      SizedBox(height:12.h),
                      EditableTextField(
                        label: "Number",
                        isEditable: false,
                        enabled: true,
                        controller: numberController,
                        validator: (content){
                          if(!Validator.isEgyptianPhoneNumber(content)) {
                            return "invalid number";
                          }
                        },
                      ),
                      SizedBox(height:12.h),
                      DefaultElevatedButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            cubit.addAddress(AddAddressRequest(
                                address: Address(
                                    name: nameController.text,
                                    details: detailsController.text,
                                    phone: numberController.text,
                                    city: cityController.text,
                                ),
                            ),
                            );
                          }
                        },
                        label: "ADD ADDRESS",
                        backgroundColor: AppTheme.blueColor,
                        textColor: AppTheme.whiteColor,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (_, state)  {
            if(state is AccountLoading){
              UIUtils.showLoading(context);
            }else if(state is AddAddressSuccess){

              cubit.getAddresses().then((value) {
                UIUtils.hideLoading(context);
                Navigator.of(context).pop();
              });

            }else if(state is AccountError){
              UIUtils.showMessage(state.errorMessage);
            }
          },
      ),
    );
  }
}
