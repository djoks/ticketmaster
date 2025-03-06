import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketmaster/models/event.dart';
import 'package:ticketmaster/ui/views/home/home_view_model.dart';
import 'package:ticketmaster/ui/widgets/event_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final vm = Provider.of<HomeViewModel>(context, listen: false);
        vm.loadMore(reset: true);
      }
    });

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildSearchWidget(HomeViewModel vm) {
    return SliverToBoxAdapter(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Type here to search...',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          vm.keyword = value;
          vm.loadMore(reset: true);
        },
      ),
    ));
  }

  Widget _buildEventList(HomeViewModel vm) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == vm.items.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                  child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ))),
            );
          }

          final Event event = vm.items[index];
          return EventItem(event: event);
        },
        childCount: vm.items.length + (vm.hasMore ? 1 : 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildSearchWidget(vm),
          _buildEventList(vm),
        ],
      );
    });
  }

  void _onScroll() {
    final vm = context.read<HomeViewModel>();

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        vm.hasMore &&
        !vm.isLoading) {
      vm.loadMore();
    }
  }
}
