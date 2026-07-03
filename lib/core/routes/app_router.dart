import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rcl_app/core/routes/app_routes.dart';
import 'package:rcl_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rcl_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:rcl_app/features/auth/presentation/pages/login_page.dart';
import 'package:rcl_app/features/auth/presentation/pages/register_page.dart';
import 'package:rcl_app/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:rcl_app/features/auth/presentation/pages/verification_page.dart';
import 'package:rcl_app/features/home/presentation/pages/home_page.dart';
import 'package:rcl_app/features/businesses/presentation/pages/business_list_page.dart';
import 'package:rcl_app/features/businesses/presentation/pages/business_detail_page.dart';
import 'package:rcl_app/features/businesses/presentation/pages/business_search_page.dart';
import 'package:rcl_app/features/businesses/presentation/pages/business_map_page.dart';
import 'package:rcl_app/features/promotions/presentation/pages/promotion_list_page.dart';
import 'package:rcl_app/features/promotions/presentation/pages/promotion_detail_page.dart';
import 'package:rcl_app/features/promotions/presentation/pages/my_coupons_page.dart';
import 'package:rcl_app/features/profile/presentation/pages/profile_page.dart';
import 'package:rcl_app/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:rcl_app/features/profile/presentation/pages/settings_page.dart';
import 'package:rcl_app/features/profile/presentation/pages/change_password_page.dart';
import 'package:rcl_app/features/merchant/presentation/pages/merchant_dashboard_page.dart';
import 'package:rcl_app/features/merchant/presentation/pages/business_form_page.dart';
import 'package:rcl_app/features/merchant/presentation/pages/business_media_page.dart';
import 'package:rcl_app/features/merchant/presentation/pages/business_hours_page.dart';
import 'package:rcl_app/features/merchant/presentation/pages/promotion_form_page.dart';
import 'package:rcl_app/features/merchant/presentation/pages/analytics_page.dart';
import 'package:rcl_app/features/events/presentation/pages/event_list_page.dart';
import 'package:rcl_app/features/events/presentation/pages/event_detail_page.dart';
import 'package:rcl_app/features/tourism/presentation/pages/tourism_page.dart';
import 'package:rcl_app/features/tourism/presentation/pages/attraction_detail_page.dart';
import 'package:rcl_app/features/tourism/presentation/pages/route_page.dart';
import 'package:rcl_app/features/jobs/presentation/pages/job_list_page.dart';
import 'package:rcl_app/features/jobs/presentation/pages/job_detail_page.dart';
import 'package:rcl_app/features/classifieds/presentation/pages/classified_list_page.dart';
import 'package:rcl_app/features/classifieds/presentation/pages/classified_detail_page.dart';
import 'package:rcl_app/features/notifications/presentation/pages/notification_page.dart';

class AppRouter {
  AppRouter._();

  static final List<String> _publicRoutes = [
    AppRoutes.login,
    AppRoutes.register,
    AppRoutes.forgotPassword,
    AppRoutes.verification,
  ];

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    redirect: (context, state) {
      final authState = context.read<AuthCubit>().state;
      final isAuthenticated = authState is AuthAuthenticated;
      final isAuthRoute = _publicRoutes.contains(state.matchedLocation);

      if (isAuthenticated && isAuthRoute) {
        return AppRoutes.home;
      }

      if (!isAuthenticated && !isAuthRoute && authState is! AuthLoading) {
        return AppRoutes.login;
      }

      return null;
    },
    routes: [
      GoRoute(path: AppRoutes.login, builder: (context, state) => const LoginPage()),
      GoRoute(path: AppRoutes.register, builder: (context, state) => const RegisterPage()),
      GoRoute(path: AppRoutes.forgotPassword, builder: (context, state) => const ForgotPasswordPage()),
      GoRoute(path: AppRoutes.verification, builder: (context, state) => const VerificationPage()),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => const BusinessSearchPage(),
      ),
      GoRoute(
        path: AppRoutes.businesses,
        builder: (context, state) => const BusinessListPage(),
        routes: [
          GoRoute(
            path: 'detail',
            builder: (context, state) => const BusinessDetailPage(),
          ),
          GoRoute(
            path: 'map',
            builder: (context, state) => const BusinessMapPage(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.promotions,
        builder: (context, state) => const PromotionListPage(),
        routes: [
          GoRoute(
            path: 'detail',
            builder: (context, state) => const PromotionDetailPage(),
          ),
        ],
      ),
      GoRoute(path: AppRoutes.coupons, builder: (context, state) => const MyCouponsPage()),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const ProfilePage(),
        routes: [
          GoRoute(path: 'edit', builder: (context, state) => const EditProfilePage()),
        ],
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsPage(),
        routes: [
          GoRoute(path: 'change-password', builder: (context, state) => const ChangePasswordPage()),
        ],
      ),
      GoRoute(
        path: AppRoutes.merchant,
        builder: (context, state) => const MerchantDashboardPage(),
        routes: [
          GoRoute(path: 'business-form', builder: (context, state) => const BusinessFormPage()),
          GoRoute(path: 'media', builder: (context, state) => const BusinessMediaPage()),
          GoRoute(path: 'hours', builder: (context, state) => const BusinessHoursPage()),
          GoRoute(path: 'promotion-form', builder: (context, state) => const PromotionFormPage()),
          GoRoute(path: 'analytics', builder: (context, state) => const AnalyticsPage()),
        ],
      ),
      GoRoute(
        path: AppRoutes.events,
        builder: (context, state) => const EventListPage(),
        routes: [
          GoRoute(path: 'detail', builder: (context, state) => const EventDetailPage()),
        ],
      ),
      GoRoute(
        path: AppRoutes.tourism,
        builder: (context, state) => const TourismPage(),
        routes: [
          GoRoute(path: 'attraction-detail', builder: (context, state) => const AttractionDetailPage()),
          GoRoute(path: 'route', builder: (context, state) => const RoutePage()),
        ],
      ),
      GoRoute(
        path: AppRoutes.jobs,
        builder: (context, state) => const JobListPage(),
        routes: [
          GoRoute(path: 'detail', builder: (context, state) => const JobDetailPage()),
        ],
      ),
      GoRoute(
        path: AppRoutes.classifieds,
        builder: (context, state) => const ClassifiedListPage(),
        routes: [
          GoRoute(path: 'detail', builder: (context, state) => const ClassifiedDetailPage()),
        ],
      ),
      GoRoute(path: AppRoutes.notifications, builder: (context, state) => const NotificationPage()),
    ],
  );
}
