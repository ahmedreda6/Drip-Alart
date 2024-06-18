import 'package:brain_box/widgets/custom_button.dart';
import 'package:brain_box/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddEmailBottomSheet extends StatefulWidget {
  const AddEmailBottomSheet({super.key});

  @override
  State<AddEmailBottomSheet> createState() => _AddEmailBottomSheetState();
}

class _AddEmailBottomSheetState extends State<AddEmailBottomSheet> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),

              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
                hintText: 'User email',
              ),

              const SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CustomButton(title: 'Add'),
              ),

              // BlocBuilder<AddNoteCubit, AddNoteState>(
              //   builder: (context, state) {
              //     return CustomBotton(
              //       isLoaading: state is AddNoteLoading ? true : false,
              //       ontap: () {
              //         if (formkey.currentState!.validate()) {
              //           formkey.currentState!.save();
              //           var currentDate = DateTime.now();
              //           var formattedCurrentDate =
              //               DateFormat.yMd().format(currentDate);
              //           var notemodel = NoteModel(
              //             title: title!,
              //             subtitle: subtitle!,
              //             data: formattedCurrentDate,
              //             color: Colors.amber.value,
              //           );
              //           BlocProvider.of<AddNoteCubit>(context).addNote(notemodel);
              //         } else {
              //           autovalidateMode = AutovalidateMode.always;
              //           setState(() {});
              //         }
              //       },
              //     );
              //   },
              // ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
