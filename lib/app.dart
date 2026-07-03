import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:rcl_app/core/theme/app_theme.dart';
import 'package:rcl_app/core/routes/app_router.dart';
import 'package:rcl_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rcl_app/features/businesses/presentation/cubit/business_cubit.dart';
import 'package:rcl_app/features/promotions/presentation/cubit/promotion_cubit.dart';
import 'package:rcl_app/features/merchant/presentation/cubit/merchant_cubit.dart';
import 'package:rcl_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:rcl_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:rcl_app/features/events/presentation/cubit/event_cubit.dart';
import 'package:rcl_app/features/tourism/presentation/cubit/tourism_cubit.dart';
import 'package:rcl_app/features/jobs/presentation/cubit/job_cubit.dart';
import 'package:rcl_app/features/classifieds/presentation/cubit/classified_cubit.dart';
import 'package:rcl_app/features/notifications/presentation/cubit/notification_cubit.dart';

class RCLApp extends StatelessWidget {
  const RCLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => GetIt.instance<AuthCubit>()..checkAuthStatus(),
        ),
        BlocProvider<BusinessCubit>(
          create: (context) => GetIt.instance<BusinessCubit>(),
        ),
        BlocProvider<PromotionCubit>(
          create: (context) => GetIt.instance<PromotionCubit>(),
        ),
        BlocProvider<MerchantCubit>(
          create: (context) => GetIt.instance<MerchantCubit>(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => GetIt.instance<HomeCubit>(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => GetIt.instance<ProfileCubit>(),
        ),
        BlocProvider<EventCubit>(
          create: (context) => GetIt.instance<EventCubit>(),
        ),
        BlocProvider<TourismCubit>(
          create: (context) => GetIt.instance<TourismCubit>(),
        ),
        BlocProvider<JobCubit>(
          create: (context) => GetIt.instance<JobCubit>(),
        ),
        BlocProvider<ClassifiedCubit>(
          create: (context) => GetIt.instance<ClassifiedCubit>(),
        ),
        BlocProvider<NotificationCubit>(
          create: (context) => GetIt.instance<NotificationCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'RCL - Red Comercial Local',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es'),
          Locale('en'),
        ],
        locale: const Locale('es'),
      ),
    );
  }
}
