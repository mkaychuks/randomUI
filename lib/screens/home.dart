// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:learn_riverpod/providers/provider.dart';
import 'package:learn_riverpod/providers/state_providers.dart';
import 'package:learn_riverpod/screens/screens.dart';
import 'package:learn_riverpod/widgets/action_widgets.dart';
import 'package:learn_riverpod/widgets/header_section.dart';
import 'package:learn_riverpod/widgets/tab_transactions.dart';
import 'package:learn_riverpod/widgets/total_section.dart';

import '../widgets/recent_text.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final price = ref.watch(priceStateProvider);
    final tabs = ref.watch(tabProvider);
    final transactions = ref.watch(transactionsProvider);
    return Scaffold(
      backgroundColor: const Color(0XFF0D0D0C),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              // header section
              const HeaderSection(),
              const SizedBox(height: 27),

              // total price section
              TotalSection(price: price),

              // divider
              const SizedBox(height: 12),
              const Divider(height: 1.5, color: Colors.white),
              const SizedBox(height: 24),

              // chips
              SizedBox(
                height: 88,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    ActionWidgets(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SendMoneyScreen(),
                            ),
                          );
                        },
                        imagefit: BoxFit.none,
                        text: "Fund Transfer",
                        imageUrl: "images/trans.png"),
                    ActionWidgets(
                        imagefit: BoxFit.none,
                        text: "Add Money",
                        imageUrl: "images/dollar.png"),
                    ActionWidgets(
                        imagefit: BoxFit.none,
                        text: "More",
                        imageUrl: "images/more.png"),
                  ],
                ),
              ),

              // recent activity
              const SizedBox(height: 24),
              recentActivity(),
              const SizedBox(height: 24),

              // the tab bar
              SizedBox(
                height: 30,
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0XFFB6EF11),
                  ),
                  isScrollable: true,
                  controller: tabController,
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.white,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                  tabs: tabs,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              // the tabs
              SizedBox(
                height: 400,
                // color: Colors.blue,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    // tab one child
                    TransactionsTabWidget(transactions: transactions),
                    // tab two child
                    TransactionsTabWidget(transactions: transactions),
                    // and so on
                    TransactionsTabWidget(transactions: transactions),
                    // tab 4
                    TransactionsTabWidget(transactions: transactions),
                  ],
                ),
              ),

              //  other parts of the UI
              // hdhdhddhdhdh
            ],
          ),
        ),
      ),
    );
  }
}
