import 'package:bookia_app/core/widgets/custom_arrow_back.dart';
import 'package:bookia_app/core/widgets/custom_text_form_field.dart';
import 'package:bookia_app/features/home/widgets/custom_gridview.dart';
import 'package:bookia_app/features/search/cubit/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: CustomArrowBack(),
        ),
        title: Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomTextFormFiled(
                    onChanged: (text) {
                      context.read<SearchCubit>().seaarchAction(text);
                    },
                    hintText: 'Search' ,),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(
              buildWhen: (previous, current) => current is SearchLoading || current is SearchSuccess || current is SearcheErorr,
              builder: (context, state) {
                 if (state is SearchLoading) {
                   return CustomGridview();
                 }else if ( state is SearchSuccess){
                  return CustomGridview( isLoading: false,books: state.books,);
                 }else {
                  return SliverToBoxAdapter(
                    child: Center(child: Text('Searh Not Found')),
                  );
                 }
              },
            ),
          ],
        ),
      ),
    );
  }
}
