import 'package:alzilzal/Core/components/progress_indector.dart';
import 'package:alzilzal/Core/constatnts/app_constant.dart';
import 'package:alzilzal/Core/constatnts/spacing.dart';
import 'package:alzilzal/Features/search/logic/search_cubit.dart';
import 'package:alzilzal/Features/search/ui/widgets/search_item.dart';
import 'package:alzilzal/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).search),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 8.h,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: S.of(context).search,
                        prefixIcon: const Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          context.read<SearchCubit>().clear();
                        } else {
                          context.read<SearchCubit>().fetchOrders(query: value);
                        }
                      },
                    ),
                  ),
                  if (state is SearchLoading)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppConstant.deviceWidth(context) / 2,
                        ),
                        child: const CustomLoadingIndicator(),
                      ),
                    )
                  else if (context.read<SearchCubit>().orders.isNotEmpty)
                    ListView.separated(
                      separatorBuilder: (context, index) =>
                          Spacing.verticalSpace(15),
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 15.h,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: context.read<SearchCubit>().orders.length,
                      itemBuilder: (context, index) {
                        return SearchItem(
                          searchModel:
                              context.read<SearchCubit>().orders[index],
                        );
                      },
                    )
                  else
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppConstant.deviceWidth(context) / 2,
                      ),
                      child: Center(
                        child: Text(
                          S.of(context).thereIsNoSearch,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18.sp,
                                  ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
