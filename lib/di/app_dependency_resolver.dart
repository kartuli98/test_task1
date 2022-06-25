import 'package:flutter/cupertino.dart';
import 'package:test_to_do/config/routes/app_route.dart';
import 'package:test_to_do/core/db/hive_db.dart';
import 'package:test_to_do/core/di/dependency_provider.dart';
import 'package:test_to_do/core/keys.dart';
import 'package:test_to_do/core/logger/todo_logger.dart';
import 'package:test_to_do/core/navigation/app_navigator.dart';
import 'package:test_to_do/core/navigation/navigation_graph.dart';
import 'package:test_to_do/core/network_client/network_client.dart';
import 'package:test_to_do/core/observer/task_update_checker.dart';
import 'package:test_to_do/core/services/connectivity_service.dart';
import 'package:test_to_do/core/services/synchronization_services.dart';
import 'package:test_to_do/data/datasources/local/local_task_storage.dart';
import 'package:test_to_do/data/repositories/dis_remote_repository_impl.dart';
import 'package:test_to_do/data/repositories/remote_repository_impl.dart';
import 'package:test_to_do/domain/repositories/remote_task_repository.dart';
import 'package:test_to_do/domain/usecases/usecases.dart';

import '../core/network_client/default_network_client.dart';
import '../data/repositories/local_repository_impl.dart';
import '../domain/repositories/local_task_repository.dart';
import '../presentation/pages/create_screen/create_edit_cubit.dart';
import '../presentation/pages/login_screen/login_cubit.dart';
import '../presentation/pages/main_screen/main_cubit.dart';

class AppDependeciesResolver {
  static register(ToDoLogger logger) {
    _registerApplication(logger);
    _registerCubits(logger);
  }

  static _registerApplication(ToDoLogger logger) {
    DependencyProvider.registerLazySingleton<BuildContext>(
        () => Keys.navigatorKey.currentState!.context);
    DependencyProvider.registerLazySingleton<NavigatorState>(
        () => Keys.navigatorKey.currentState!);
    DependencyProvider.registerLazySingleton<AppNavigator>(
        () => AppNavigator(DependencyProvider.get<NavigatorState>(), logger));

    DependencyProvider.registerSingleton<NavigationGraph>(NavigationGraph());
    DependencyProvider.get<NavigationGraph>().registerRoutes(AppRoute.routeMap);

    DependencyProvider.registerLazySingleton<HiveDB>(() => HiveDB());
    DependencyProvider.registerLazySingleton<LocalTaskStorage>(
        () => LocalTaskStorage(DependencyProvider.get<HiveDB>(), logger));

    DependencyProvider.registerLazySingleton<ConnectivityService>(() => ConnectivityService());

    DependencyProvider.registerLazySingleton<NetworkClient>(() =>
        DefaultHttpClient("https://djr44g68bkkn.softwars.com.ua/", logger));

    DependencyProvider.registerLazySingleton<RemoteTaskRepository>(() =>
        RemoteTaskRepositoryImpl(
            DependencyProvider.get<NetworkClient>(), logger));

    DependencyProvider.registerLazySingleton<LocalTaskRepository>(() =>
        LocalTaskRepositoryImpl(
            DependencyProvider.get<LocalTaskStorage>(), logger));

    DependencyProvider.registerLazySingleton<TaskUpdateChecker>(() =>
        TaskUpdateChecker());

    DependencyProvider.registerLazySingleton<PostTasksUseCase>(() =>
        PostTasksUseCase(
          logger,
          DependencyProvider.get<RemoteTaskRepository>(),
            ));

    DependencyProvider.registerLazySingleton<ReadTasksUseCase>(() =>
        ReadTasksUseCase(DependencyProvider.get<LocalTaskRepository>(),
            ));

    DependencyProvider.registerLazySingleton<GetTasksUseCase>(() =>
        GetTasksUseCase(DependencyProvider.get<RemoteTaskRepository>(),
            DependencyProvider.get<LocalTaskRepository>(),
            DependencyProvider.get<ConnectivityService>()
            )
            );

    DependencyProvider.registerLazySingleton<DeleteTaskUseCase>(() =>
        DeleteTaskUseCase(DependencyProvider.get<RemoteTaskRepository>(),
            DependencyProvider.get<LocalTaskRepository>(),
            DependencyProvider.get<ConnectivityService>()));

     DependencyProvider.registerLazySingleton<SaveTasksUseCase>(() =>
        SaveTasksUseCase(DependencyProvider.get<RemoteTaskRepository>(),
            DependencyProvider.get<LocalTaskRepository>(),
            DependencyProvider.get<ConnectivityService>()));

    DependencyProvider.registerLazySingleton<UpdateStatusUseCase>(() =>
        UpdateStatusUseCase(
            DependencyProvider.get<RemoteTaskRepository>(),
            DependencyProvider.get<LocalTaskRepository>(),
            DependencyProvider.get<ConnectivityService>()));        

    DependencyProvider.registerLazySingleton<GetTaskUseCase>(() =>
        GetTaskUseCase(
            DependencyProvider.get<LocalTaskRepository>()));        

    DependencyProvider.registerSingleton<SynchronizationServices>(SynchronizationServices(
      logger,
      DependencyProvider.get<ConnectivityService>(),
      DependencyProvider.get<PostTasksUseCase>(),
      DependencyProvider.get<ReadTasksUseCase>(),
    ));    
  }

  static _registerCubits(ToDoLogger logger) {
    DependencyProvider.registerFactory<TasksScreenCubit>(
        () => TasksScreenCubit(logger,
         DependencyProvider.get<AppNavigator>(),
         DependencyProvider.get<TaskUpdateChecker>(),
         DependencyProvider.get<GetTaskUseCase>(),
         DependencyProvider.get<UpdateStatusUseCase>(),
         ));
    DependencyProvider.registerFactory<CreateEditCubit>(
        () => CreateEditCubit(
          logger, 
          DependencyProvider.get<AppNavigator>(),
          DependencyProvider.get<DeleteTaskUseCase>(),
          DependencyProvider.get<SaveTasksUseCase>(),
          DependencyProvider.get<TaskUpdateChecker>(),
          ));
    DependencyProvider.registerFactory<LoginCubit>(() => LoginCubit(
        logger,
        DependencyProvider.get<AppNavigator>(),
        DependencyProvider.get<GetTasksUseCase>(),
        ));
  }
}
