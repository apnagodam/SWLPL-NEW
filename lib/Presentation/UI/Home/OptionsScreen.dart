// ignore_for_file: deprecated_member_use

import 'package:emp_apnagodam/Presentation/Constants/ColorConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Data/SharedPrefs/SharedUtility.dart';
import '../../../Domain/dio/DioProvider.dart';

class OptionsScreen extends ConsumerWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: primaryColorDark.withOpacity(0.9),
          middle: const Text(
            'Options',
            style: TextStyle(color: Colors.white),
          ),
        ),
        child: SafeArea(
            child: ListView(
          children: [
            CupertinoListSection(
              children: [
                ListTile(
                  title: Text(
                    '${ref.watch(sharedUtilityProvider).getUser()?.firstName} ${ref.watch(sharedUtilityProvider).getUser()?.lastName}',
                    style: TextStyle(fontSize: Adaptive.sp(16)),
                  ),
                  leading: ref.watch(sharedUtilityProvider).getUser() == null
                      ? const Icon(Icons.person)
                      : CircleAvatar(
                          radius: Adaptive.sp(16),
                          foregroundImage: (ref.watch(sharedUtilityProvider).getUser()?.passportImage != null &&
                                  ref.watch(sharedUtilityProvider).getUser()!.passportImage!.toString().trim().isNotEmpty)
                              ? NetworkImage(
                                  "${ref.watch(dioProvider).options.baseUrl}resources/assets/upload/employees/${ref.watch(sharedUtilityProvider).getUser()?.passportImage}",
                                )
                              : null,
                          onForegroundImageError: (exception, stackTrace) {},
                          child: const Icon(Icons.person),
                        ),
                  onTap: () => context.goNamed('profile'),
                ),
                ExpansionTile(
                  shape: Border(bottom: BorderSide(color: primaryColorDark)),
                  expandedAlignment: Alignment.centerLeft,
                  title: Text(
                    'Leads',
                    style: TextStyle(fontSize: Adaptive.sp(16)),
                  ),
                  leading: SvgPicture.asset(
                    'assets/leads.svg',
                    height: Adaptive.sp(20),
                    width: Adaptive.sp(20),
                  ),
                  children: [
                    CupertinoListTile(
                      title: Text(
                        'Generate Leads',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/leads.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () => context.goNamed('generate_lead'),
                    ),

                    CupertinoListTile(
                      title: Text(
                        'Leads List',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/leads_list.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () => context.goNamed('leads_list'),
                    ),
                    // CupertinoListTile(
                    //   title: Text(
                    //     'Voucher History',
                    //     style: TextStyle(fontSize: Adaptive.sp(16)),
                    //   ),
                    //   leading: SvgPicture.asset(
                    //     'assets/voucher.svg',
                    //     height: Adaptive.sp(20),
                    //     width: Adaptive.sp(20),
                    //   ),
                    //   trailing: const CupertinoListTileChevron(),
                    //   onTap: () => context.goNamed('voucher_history'),
                    // ),
                    // CupertinoListTile(
                    //   title: Text(
                    //     'Voucher Requests',
                    //     style: TextStyle(fontSize: Adaptive.sp(16)),
                    //   ),
                    //   leading: SvgPicture.asset(
                    //     'assets/voucher.svg',
                    //     height: Adaptive.sp(20),
                    //     width: Adaptive.sp(20),
                    //   ),
                    //   trailing: const CupertinoListTileChevron(),
                    //   onTap: () => context.goNamed('voucher_request'),
                    // ),
                  ],
                ),
                // ExpansionTile(
                //   shape:
                //   Border(bottom: BorderSide(color: primaryColorDark)),
                //   expandedAlignment: Alignment.centerLeft,
                //   title: Text(
                //     'Audit',
                //     style: TextStyle(fontSize: Adaptive.sp(16)),
                //   ),
                //   leading: SvgPicture.asset(
                //     'assets/leads.svg',
                //     height: Adaptive.sp(20),
                //     width: Adaptive.sp(20),
                //   ),
                //   children: [
                //     CupertinoListTile(
                //       title: Text(
                //         'Neighbour Details',
                //         style: TextStyle(fontSize: Adaptive.sp(16)),
                //       ),
                //       leading: SvgPicture.asset(
                //         'assets/leads.svg',
                //         height: Adaptive.sp(20),
                //         width: Adaptive.sp(20),
                //       ),
                //       onTap: () => context.goNamed('audit_neighbour'),
                //     ),
                //
                //     CupertinoListTile(
                //       title: Text(
                //         'Leads List',
                //         style: TextStyle(fontSize: Adaptive.sp(16)),
                //       ),
                //       leading: SvgPicture.asset(
                //         'assets/leads_list.svg',
                //         height: Adaptive.sp(20),
                //         width: Adaptive.sp(20),
                //       ),
                //       onTap: () => context.goNamed('leads_list'),
                //     ),
                //     // CupertinoListTile(
                //     //   title: Text(
                //     //     'Voucher History',
                //     //     style: TextStyle(fontSize: Adaptive.sp(16)),
                //     //   ),
                //     //   leading: SvgPicture.asset(
                //     //     'assets/voucher.svg',
                //     //     height: Adaptive.sp(20),
                //     //     width: Adaptive.sp(20),
                //     //   ),
                //     //   trailing: const CupertinoListTileChevron(),
                //     //   onTap: () => context.goNamed('voucher_history'),
                //     // ),
                //     // CupertinoListTile(
                //     //   title: Text(
                //     //     'Voucher Requests',
                //     //     style: TextStyle(fontSize: Adaptive.sp(16)),
                //     //   ),
                //     //   leading: SvgPicture.asset(
                //     //     'assets/voucher.svg',
                //     //     height: Adaptive.sp(20),
                //     //     width: Adaptive.sp(20),
                //     //   ),
                //     //   trailing: const CupertinoListTileChevron(),
                //     //   onTap: () => context.goNamed('voucher_request'),
                //     // ),
                //   ],
                // ),
                ExpansionTile(
                  shape: Border(bottom: BorderSide(color: primaryColorDark)),
                  expandedAlignment: Alignment.centerLeft,
                  title: Text(
                    'Conveyance Voucher',
                    style: TextStyle(fontSize: Adaptive.sp(16)),
                  ),
                  leading: SvgPicture.asset(
                    'assets/voucher.svg',
                    height: Adaptive.sp(20),
                    width: Adaptive.sp(20),
                  ),
                  children: [
                    CupertinoListTile(
                      title: Text(
                        'Create Conveyance Voucher',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/voucher.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () => context.goNamed('create_voucher'),
                    ),
                    CupertinoListTile(
                      title: Text(
                        'Voucher History',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/voucher.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () => context.goNamed('voucher_history'),
                    ),
                    CupertinoListTile(
                      title: Text(
                        'Voucher Requests',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/voucher.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () => context.goNamed('voucher_request'),
                    ),
                  ],
                ),
                ListTile(
                    title: Text(
                      'Cancel Case Ids',
                      style: TextStyle(fontSize: Adaptive.sp(16)),
                    ),
                    leading: SvgPicture.asset(
                      'assets/truck.svg',
                      height: Adaptive.sp(20),
                      width: Adaptive.sp(20),
                    ),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () => context.goNamed('cancel_case_id')),
                ListTile(
                    title: Text(
                      'Displeased Bags',
                      style: TextStyle(fontSize: Adaptive.sp(16)),
                    ),
                    leading: SvgPicture.asset(
                      'assets/bag.svg',
                      height: Adaptive.sp(20),
                      width: Adaptive.sp(20),
                    ),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () => context.goNamed('displeased_bags')),
                ExpansionTile(
                  shape: Border(bottom: BorderSide(color: primaryColorDark)),
                  expandedAlignment: Alignment.centerLeft,
                  title: Text(
                    'In',
                    style: TextStyle(fontSize: Adaptive.sp(16)),
                  ),
                  leading: SvgPicture.asset(
                    'assets/truck_in.svg',
                    height: Adaptive.sp(20),
                    width: Adaptive.sp(20),
                  ),
                  children: [
                    CupertinoListTile(
                      title: Text(
                        'Truck Book',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/truck.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () {
                        context.goNamed('truck_book_list',
                            extra: {'in_out': 'IN'});
                      },
                    ),
                    CupertinoListTile(
                        title: Text(
                          'Labour Book',
                          style: TextStyle(fontSize: Adaptive.sp(16)),
                        ),
                        leading: SvgPicture.asset(
                          'assets/labour.svg',
                          height: Adaptive.sp(20),
                          width: Adaptive.sp(20),
                        ),
                        onTap: () {
                          context.goNamed('labour_book_list',
                              extra: {'in_out': 'IN'});
                        }),
                    CupertinoListTile(
                      title: Text(
                        'First Kanta Parchi',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/bag.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () {
                        context.goNamed('f_kanta_parchi_list',
                            extra: {'in_out': 'IN'});
                      },
                    ),
                    CupertinoListTile(
                      title: Text(
                        'First Quality Report',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/f_quality.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () {
                        context.goNamed('f_quality_report_list');
                      },
                    ),
                    CupertinoListTile(
                      title: Text(
                        'Second Kanta Parchi',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/bag.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () {
                        context.goNamed('s_kanta_parchi_list',
                            extra: {'in_out': 'IN'});
                      },
                    ),
                    CupertinoListTile(
                      title: Text(
                        'Second Quality Report',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/f_quality.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () {
                        context
                            .goNamed('s_quality_list', extra: {'in_out': 'IN'});
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  shape: Border(bottom: BorderSide(color: primaryColorDark)),
                  expandedAlignment: Alignment.centerLeft,
                  title: Text(
                    'OUT',
                    style: TextStyle(fontSize: Adaptive.sp(16)),
                  ),
                  leading: SvgPicture.asset(
                    'assets/truck_out.svg',
                    height: Adaptive.sp(20),
                    width: Adaptive.sp(20),
                  ),
                  children: [
                    CupertinoListTile(
                      title: Text(
                        'Truck Book',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/truck.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () {
                        context.goNamed('truck_book_list',
                            extra: {'in_out': 'OUT'});
                      },
                    ),
                    CupertinoListTile(
                        title: Text(
                          'Labour Book',
                          style: TextStyle(fontSize: Adaptive.sp(16)),
                        ),
                        leading: SvgPicture.asset(
                          'assets/labour.svg',
                          height: Adaptive.sp(20),
                          width: Adaptive.sp(20),
                        ),
                        onTap: () => context.goNamed('labour_book_list',
                            extra: {'in_out': 'OUT'})),
                    CupertinoListTile(
                      title: Text(
                        'First Kanta Parchi',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/bag.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () {
                        context.goNamed('f_kanta_parchi_list',
                            extra: {'in_out': 'OUT'});
                      },
                    ),
                    CupertinoListTile(
                      title: Text(
                        'Second Quality Report',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/f_quality.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () {
                        context.goNamed('s_quality_list',
                            extra: {'in_out': 'OUT'});
                      },
                    ),
                    CupertinoListTile(
                      title: Text(
                        'Second Kanta Parchi',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/bag.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () {
                        context.goNamed('s_kanta_parchi_list',
                            extra: {'in_out': 'OUT'});
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  shape: Border(bottom: BorderSide(color: primaryColorDark)),
                  expandedAlignment: Alignment.centerLeft,
                  title: Text(
                    'Advance',
                    style: TextStyle(fontSize: Adaptive.sp(16)),
                  ),
                  leading: SvgPicture.asset(
                    'assets/advance.svg',
                    height: Adaptive.sp(20),
                    width: Adaptive.sp(20),
                  ),
                  children: [
                    CupertinoListTile(
                      title: Text(
                        'Advance',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/advance_request.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () {
                        context.goNamed('advance');
                      },
                    ),
                    CupertinoListTile(
                      title: Text(
                        'Advance History',
                        style: TextStyle(fontSize: Adaptive.sp(16)),
                      ),
                      leading: SvgPicture.asset(
                        'assets/advance_request.svg',
                        height: Adaptive.sp(20),
                        width: Adaptive.sp(20),
                      ),
                      onTap: () {
                        context.goNamed('advance_history');
                      },
                    ),
                  ],
                ),
                ListTile(
                  title: Text(
                    'PV',
                    style: TextStyle(fontSize: Adaptive.sp(16)),
                  ),
                  leading: SvgPicture.asset(
                    'assets/pv.svg',
                    height: Adaptive.sp(20),
                    width: Adaptive.sp(20),
                  ),
                  onTap: () {
                    context.goNamed('pv');
                  },
                ),
                ListTile(
                  title: Text(
                    'Check for update',
                    style: TextStyle(fontSize: Adaptive.sp(16)),
                  ),
                  leading: SvgPicture.asset(
                    'assets/update.svg',
                    height: Adaptive.sp(20),
                    width: Adaptive.sp(20),
                  ),
                  onTap: () {
                    context.goNamed('update');
                  },
                ),
                TextButton(
                  onPressed: () async {
                    await ref
                        .watch(sharedUtilityProvider)
                        .sharedPreferences
                        .clear()
                        .then((value) {
                      context.go('/login');
                      // const LoginScreen().launch(context, isNewTask: true);
                    });
                  },
                  child: Text("Logout",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Adaptive.sp(16))),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
