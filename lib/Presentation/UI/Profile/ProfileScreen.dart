import 'dart:io';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:emp_apnagodam/Data/SharedPrefs/SharedUtility.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Constants/ColorConstant.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: primaryColor,
                middle: Text(
                  "Profile",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              child: profileLayout(context, ref))
          : Scaffold(
              appBar: AppBar(
                title: const Text('Profile'),
              ),
              body: profileLayout(context, ref),
            ),
    );
  }

  profileLayout(BuildContext context, WidgetRef ref) => Padding(
        padding: Pad(all: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: Adaptive.sh(25),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InstaImageViewer(
                      child: Image.network(
                        "${ref.watch(dioProvider).options.baseUrl}resources/assets/upload/employees/${ref.watch(sharedUtilityProvider).getUser()?.passportImage}",
                        errorBuilder: (context, s, o) =>
                            Icon(CupertinoIcons.person),
                        fit: BoxFit.contain,
                        height: Adaptive.sh(50),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ColumnSuper(
              alignment: Alignment.topLeft,
              children: [
                Text(
                  "${ref.watch(sharedUtilityProvider).getUser()?.firstName} ${ref.watch(sharedUtilityProvider).getUser()?.lastName}(${ref.watch(sharedUtilityProvider).getUser()?.empId})",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: Adaptive.sp(16),
                      color: primaryColorDark,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Designation : ${ref.watch(sharedUtilityProvider).getUser()?.designation})",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: Adaptive.sp(15), fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Location : ${ref.watch(sharedUtilityProvider).getUser()?.location ?? ref.watch(sharedUtilityProvider).getUser()?.address})",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: Adaptive.sp(15), fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Pan: ${ref.watch(sharedUtilityProvider).getUser()?.panCard}",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: Adaptive.sp(15), fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Mobile Number : ${ref.watch(sharedUtilityProvider).getUser()?.phone}",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: Adaptive.sp(15), fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Aadhar Number : ${ref.watch(sharedUtilityProvider).getUser()?.aadharCard}",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: Adaptive.sp(15), fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Account Number : ${ref.watch(sharedUtilityProvider).getUser()?.accountNo}",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: Adaptive.sp(15), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Center(
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red.shade700,
                ),
                icon: const Icon(Icons.delete_outline_rounded, size: 20),
                label: const Text(
                  "Request Account Deletion",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Delete Account"),
                      content: const Text(
                        "Are you sure you want to request account deletion? Your request will be submitted to company HR/Admin for processing and your employee account data will be permanently removed.",
                      ),
                      actions: [
                        TextButton(
                          child: const Text("Cancel"),
                          onPressed: () => Navigator.pop(ctx),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("Confirm Request"),
                          onPressed: () {
                            Navigator.pop(ctx);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Account deletion request submitted to company admin successfully.",
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
}
