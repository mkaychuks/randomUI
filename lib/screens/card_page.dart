import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/providers/provider.dart';
import 'package:learn_riverpod/widgets/action_widgets.dart';
import 'package:learn_riverpod/widgets/recent_text.dart';

import '../providers/state_providers.dart';
import '../widgets/account_card.dart';
import '../widgets/tab_transactions.dart';

class CardPage extends ConsumerStatefulWidget {
  const CardPage({super.key});

  @override
  ConsumerState<CardPage> createState() => _CardPageState();
}

class _CardPageState extends ConsumerState<CardPage>
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFF0D0D0C),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),

                // the card area
                AccountCard(price: price),

                // transactions pictures
                const SizedBox(height: 24),
                SizedBox(
                  height: 88,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ActionWidgets(
                        imagefit: BoxFit.cover,
                          text: "Send Money", imageUrl: "images/visa.png"),
                      ActionWidgets(
                          imagefit: BoxFit.cover,

                          text: "Watson", imageUrl: "images/image2.jpeg"),
                      ActionWidgets(
                          imagefit: BoxFit.cover,

                          text: "Sofia", imageUrl: "images/image3.jpeg"),
                      ActionWidgets(
                          imagefit: BoxFit.cover,

                          text: "Toni", imageUrl: "images/image4.jpeg"),
                      ActionWidgets(
                          imagefit: BoxFit.cover,

                          text: "Alina", imageUrl: "images/image5.jpeg"),
                    ],
                  ),
                ),

                // recent activity
                const SizedBox(height: 24),
                recentActivity(),

                // tabs with details
                const SizedBox(height: 24),
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
                    // labelStyle: const TextStyle(letterSpacing: 1, fontSize: 14),
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
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xffB6EF11),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: const Icon(Icons.add, size: 40,),
        ),
      ),
    );
  }
}
