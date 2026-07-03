import 'package:get_it/get_it.dart';
import 'package:rcl_app/core/network/api_client.dart';
import 'package:rcl_app/core/storage/secure_storage.dart';
import 'package:rcl_app/core/storage/local_storage.dart';
import 'package:rcl_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:rcl_app/features/auth/data/repositories/auth_repository.dart';
import 'package:rcl_app/features/auth/domain/repositories/auth_repository_contract.dart';
import 'package:rcl_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:rcl_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:rcl_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:rcl_app/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:rcl_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rcl_app/features/businesses/data/datasources/business_remote_datasource.dart';
import 'package:rcl_app/features/businesses/data/repositories/business_repository.dart';
import 'package:rcl_app/features/businesses/domain/usecases/get_businesses_usecase.dart';
import 'package:rcl_app/features/businesses/domain/usecases/get_business_detail_usecase.dart';
import 'package:rcl_app/features/businesses/domain/usecases/search_businesses_usecase.dart';
import 'package:rcl_app/features/businesses/domain/usecases/get_nearby_businesses_usecase.dart';
import 'package:rcl_app/features/businesses/domain/usecases/get_featured_businesses_usecase.dart';
import 'package:rcl_app/features/businesses/presentation/cubit/business_cubit.dart';
import 'package:rcl_app/features/promotions/data/repositories/promotion_repository.dart';
import 'package:rcl_app/features/promotions/domain/usecases/get_promotions_usecase.dart';
import 'package:rcl_app/features/promotions/domain/usecases/get_active_promotions_usecase.dart';
import 'package:rcl_app/features/promotions/domain/usecases/claim_coupon_usecase.dart';
import 'package:rcl_app/features/promotions/presentation/cubit/promotion_cubit.dart';
import 'package:rcl_app/features/merchant/data/repositories/merchant_repository.dart';
import 'package:rcl_app/features/merchant/domain/usecases/get_my_businesses_usecase.dart';
import 'package:rcl_app/features/merchant/domain/usecases/create_business_usecase.dart';
import 'package:rcl_app/features/merchant/domain/usecases/update_business_usecase.dart';
import 'package:rcl_app/features/merchant/domain/usecases/get_merchant_stats_usecase.dart';
import 'package:rcl_app/features/merchant/presentation/cubit/merchant_cubit.dart';
import 'package:rcl_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:rcl_app/features/home/data/repositories/home_repository.dart';
import 'package:rcl_app/features/home/domain/repositories/home_repository_contract.dart';
import 'package:rcl_app/features/home/domain/usecases/get_home_data_usecase.dart';
import 'package:rcl_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:rcl_app/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:rcl_app/features/profile/data/repositories/profile_repository.dart';
import 'package:rcl_app/features/profile/domain/repositories/profile_repository_contract.dart';
import 'package:rcl_app/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:rcl_app/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:rcl_app/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:rcl_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:rcl_app/features/events/data/datasources/event_remote_datasource.dart';
import 'package:rcl_app/features/events/data/repositories/event_repository.dart';
import 'package:rcl_app/features/events/domain/repositories/event_repository_contract.dart';
import 'package:rcl_app/features/events/domain/usecases/get_events_usecase.dart';
import 'package:rcl_app/features/events/domain/usecases/get_event_detail_usecase.dart';
import 'package:rcl_app/features/events/presentation/cubit/event_cubit.dart';
import 'package:rcl_app/features/tourism/data/datasources/tourism_remote_datasource.dart';
import 'package:rcl_app/features/tourism/data/repositories/tourism_repository.dart';
import 'package:rcl_app/features/tourism/domain/repositories/tourism_repository_contract.dart';
import 'package:rcl_app/features/tourism/domain/usecases/get_attractions_usecase.dart';
import 'package:rcl_app/features/tourism/presentation/cubit/tourism_cubit.dart';
import 'package:rcl_app/features/jobs/data/datasources/job_remote_datasource.dart';
import 'package:rcl_app/features/jobs/data/repositories/job_repository.dart';
import 'package:rcl_app/features/jobs/domain/repositories/job_repository_contract.dart';
import 'package:rcl_app/features/jobs/domain/usecases/get_jobs_usecase.dart';
import 'package:rcl_app/features/jobs/domain/usecases/get_job_detail_usecase.dart';
import 'package:rcl_app/features/jobs/presentation/cubit/job_cubit.dart';
import 'package:rcl_app/features/classifieds/data/datasources/classified_remote_datasource.dart';
import 'package:rcl_app/features/classifieds/data/repositories/classified_repository.dart';
import 'package:rcl_app/features/classifieds/domain/repositories/classified_repository_contract.dart';
import 'package:rcl_app/features/classifieds/domain/usecases/get_classifieds_usecase.dart';
import 'package:rcl_app/features/classifieds/domain/usecases/get_classified_detail_usecase.dart';
import 'package:rcl_app/features/classifieds/presentation/cubit/classified_cubit.dart';
import 'package:rcl_app/features/notifications/data/datasources/notification_remote_datasource.dart';
import 'package:rcl_app/features/notifications/data/repositories/notification_repository.dart';
import 'package:rcl_app/features/notifications/domain/repositories/notification_repository_contract.dart';
import 'package:rcl_app/features/notifications/domain/usecases/get_notifications_usecase.dart';
import 'package:rcl_app/features/notifications/domain/usecases/mark_notification_read_usecase.dart';
import 'package:rcl_app/features/notifications/presentation/cubit/notification_cubit.dart';
import 'package:rcl_app/services/notification_service.dart';

final GetIt getIt = GetIt.instance;

class AppInjection {
  AppInjection._();

  static Future<void> setup() async {
    // Core
    getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());
    getIt.registerLazySingleton<LocalStorage>(() => LocalStorage());
    getIt.registerLazySingleton<ApiClient>(() => ApiClient());

    // Services
    getIt.registerLazySingleton<NotificationService>(() => NotificationService());

    // Auth
    getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource());
    getIt.registerLazySingleton<AuthRepositoryContract>(() => AuthRepository());
    getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase());
    getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase());
    getIt.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase());
    getIt.registerLazySingleton<RefreshTokenUseCase>(() => RefreshTokenUseCase());
    getIt.registerFactory<AuthCubit>(() => AuthCubit());

    // Businesses
    getIt.registerLazySingleton<BusinessRemoteDataSource>(() => BusinessRemoteDataSource());
    getIt.registerLazySingleton<BusinessRepository>(() => BusinessRepository());
    getIt.registerLazySingleton<GetBusinessesUseCase>(() => GetBusinessesUseCase());
    getIt.registerLazySingleton<GetBusinessDetailUseCase>(() => GetBusinessDetailUseCase());
    getIt.registerLazySingleton<SearchBusinessesUseCase>(() => SearchBusinessesUseCase());
    getIt.registerLazySingleton<GetNearbyBusinessesUseCase>(() => GetNearbyBusinessesUseCase());
    getIt.registerLazySingleton<GetFeaturedBusinessesUseCase>(() => GetFeaturedBusinessesUseCase());
    getIt.registerFactory<BusinessCubit>(() => BusinessCubit());

    // Promotions
    getIt.registerLazySingleton<PromotionRepository>(() => PromotionRepository());
    getIt.registerLazySingleton<GetPromotionsUseCase>(() => GetPromotionsUseCase());
    getIt.registerLazySingleton<GetActivePromotionsUseCase>(() => GetActivePromotionsUseCase());
    getIt.registerLazySingleton<ClaimCouponUseCase>(() => ClaimCouponUseCase());
    getIt.registerFactory<PromotionCubit>(() => PromotionCubit());

    // Merchant
    getIt.registerLazySingleton<MerchantRepository>(() => MerchantRepository());
    getIt.registerLazySingleton<GetMyBusinessesUseCase>(() => GetMyBusinessesUseCase());
    getIt.registerLazySingleton<CreateBusinessUseCase>(() => CreateBusinessUseCase());
    getIt.registerLazySingleton<UpdateBusinessUseCase>(() => UpdateBusinessUseCase());
    getIt.registerLazySingleton<GetMerchantStatsUseCase>(() => GetMerchantStatsUseCase());
    getIt.registerFactory<MerchantCubit>(() => MerchantCubit());

    // Events
    getIt.registerLazySingleton<EventRemoteDataSource>(() => EventRemoteDataSource());
    getIt.registerLazySingleton<EventRepositoryContract>(() => EventRepository());
    getIt.registerLazySingleton<GetEventsUseCase>(() => GetEventsUseCase());
    getIt.registerLazySingleton<GetEventDetailUseCase>(() => GetEventDetailUseCase());
    getIt.registerFactory<EventCubit>(() => EventCubit());

    // Tourism
    getIt.registerLazySingleton<TourismRemoteDataSource>(() => TourismRemoteDataSource());
    getIt.registerLazySingleton<TourismRepositoryContract>(() => TourismRepository());
    getIt.registerLazySingleton<GetAttractionsUseCase>(() => GetAttractionsUseCase());
    getIt.registerFactory<TourismCubit>(() => TourismCubit());

    // Jobs
    getIt.registerLazySingleton<JobRemoteDataSource>(() => JobRemoteDataSource());
    getIt.registerLazySingleton<JobRepositoryContract>(() => JobRepository());
    getIt.registerLazySingleton<GetJobsUseCase>(() => GetJobsUseCase());
    getIt.registerLazySingleton<GetJobDetailUseCase>(() => GetJobDetailUseCase());
    getIt.registerFactory<JobCubit>(() => JobCubit());

    // Classifieds
    getIt.registerLazySingleton<ClassifiedRemoteDataSource>(() => ClassifiedRemoteDataSource());
    getIt.registerLazySingleton<ClassifiedRepositoryContract>(() => ClassifiedRepository());
    getIt.registerLazySingleton<GetClassifiedsUseCase>(() => GetClassifiedsUseCase());
    getIt.registerLazySingleton<GetClassifiedDetailUseCase>(() => GetClassifiedDetailUseCase());
    getIt.registerFactory<ClassifiedCubit>(() => ClassifiedCubit());

    // Notifications
    getIt.registerLazySingleton<NotificationRemoteDataSource>(() => NotificationRemoteDataSource());
    getIt.registerLazySingleton<NotificationRepositoryContract>(() => NotificationRepository());
    getIt.registerLazySingleton<GetNotificationsUseCase>(() => GetNotificationsUseCase());
    getIt.registerLazySingleton<MarkNotificationReadUseCase>(() => MarkNotificationReadUseCase());
    getIt.registerFactory<NotificationCubit>(() => NotificationCubit());

    // Profile
    getIt.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSource());
    getIt.registerLazySingleton<ProfileRepositoryContract>(() => ProfileRepository());
    getIt.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase());
    getIt.registerLazySingleton<UpdateProfileUseCase>(() => UpdateProfileUseCase());
    getIt.registerLazySingleton<ChangePasswordUseCase>(() => ChangePasswordUseCase());
    getIt.registerFactory<ProfileCubit>(() => ProfileCubit());

    // Home
    getIt.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSource());
    getIt.registerLazySingleton<HomeRepositoryContract>(() => HomeRepository());
    getIt.registerLazySingleton<GetHomeDataUseCase>(() => GetHomeDataUseCase());
    getIt.registerFactory<HomeCubit>(() => HomeCubit());
  }
}
