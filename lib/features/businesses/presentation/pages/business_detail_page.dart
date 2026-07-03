import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rcl_app/core/widgets/custom_image.dart';
import 'package:rcl_app/features/businesses/presentation/cubit/business_cubit.dart';
import 'package:rcl_app/features/businesses/presentation/cubit/business_state.dart';
import 'package:rcl_app/features/businesses/presentation/widgets/business_hours.dart';
import 'package:rcl_app/features/businesses/presentation/widgets/business_gallery.dart';
import 'package:rcl_app/features/businesses/presentation/widgets/business_rating.dart';
import 'package:rcl_app/features/businesses/presentation/widgets/business_contact_buttons.dart';
import 'package:rcl_app/features/businesses/presentation/widgets/business_features.dart';

class BusinessDetailPage extends StatelessWidget {
  const BusinessDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BusinessCubit, BusinessState>(
        builder: (context, state) {
          if (state is BusinessLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BusinessDetailLoaded) {
            final business = state.business;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: CustomImage(
                      imageUrl: business.coverUrl,
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(business.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        BusinessRating(rating: business.rating, reviewCount: business.reviewCount),
                        const SizedBox(height: 16),
                        if (business.description != null) Text(business.description!),
                        const SizedBox(height: 16),
                        const BusinessHours(),
                        const SizedBox(height: 16),
                        BusinessContactButtons(phone: business.phone, website: business.website),
                        const SizedBox(height: 16),
                        BusinessFeatures(business: business),
                        const SizedBox(height: 16),
                        if (business.photos != null && business.photos!.isNotEmpty)
                          BusinessGallery(photos: business.photos!),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          if (state is BusinessError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
