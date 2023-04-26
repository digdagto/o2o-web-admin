import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:o2o_point_configuration/data/models/point_configuration_model.dart';
import 'package:o2o_point_configuration/data/repositories/point_configuration_impl.dart';
import 'package:o2o_point_configuration/domain/repositories/point_configuration_repository.dart';

class ConfigurationController extends GetxController {
  final Map<String, dynamic> queryParameters;

  final RxInt duration = 1.obs;
  final RxInt minUse = 0.obs;
  final RxInt maxUse = 0.obs;
  final RxInt points = 0.obs;
  final RxDouble lowerLimit = 0.0.obs;
  final RxDouble upperLimit = 0.0.obs;
  final RxBool usePoints = true.obs;

  final RxBool valuesLoaded = false.obs;
  final RxBool isLoading = true.obs;
  final collectionPath;

  ConfigurationController({required this.queryParameters})
      : collectionPath =
            "pos_v2/${int.parse(queryParameters['id'].substring(3)) - 1}/configuration";
  // collectionPath = "pos_v2/399/configuration/";

  void listenToRealtimeUpdates() {
    PointConfigurationRepository pointConfigRepo =
        PointConfigurationRepositoryImpl(collectionPath);

    try {
      pointConfigRepo
          .getPointConfigurationStream('point')
          .listen((pointConfiguration) {
        if (pointConfiguration != null) {
          valuesLoaded.value = true;
          duration.value = pointConfiguration.expiration_year;
          minUse.value = pointConfiguration.minUse;
          maxUse.value = pointConfiguration.maxUse;
          points.value = pointConfiguration.earnings_rate;
          lowerLimit.value = pointConfiguration.lowerLimit;
          upperLimit.value = pointConfiguration.upperLimit;
          usePoints.value = pointConfiguration.useYn;
          isLoading.value = false;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void setDuration(int newDuration) {
    duration.value = newDuration;
  }

  void setMinUse(int newMinUse) {
    minUse.value = newMinUse;
  }

  void setMaxUse(int newMaxUse) {
    maxUse.value = newMaxUse;
  }

  void setLowerLimit(double newLowerLimit) {
    lowerLimit.value = newLowerLimit;
  }

  void setUpperLimit(double newUpperLimit) {
    upperLimit.value = newUpperLimit;
  }

  void setUsePoints(bool newUsePoints) {
    usePoints.value = newUsePoints;
  }

  void setPoints(int newPoints) {
    points.value = newPoints;
  }

  Future<PointConfigurationModel?> getInitialValues() async {
    PointConfigurationRepository pointConfigRepo =
        PointConfigurationRepositoryImpl(collectionPath);
    return await pointConfigRepo.getPointConfiguration('point');
  }

  Future<void> loadInitialValues() async {
    PointConfigurationRepository pointConfigRepo =
        PointConfigurationRepositoryImpl(collectionPath);
    String documentId = 'point'; //your_document_id -> point
    PointConfigurationModel? pointConfiguration =
        await pointConfigRepo.getPointConfiguration(documentId);

    if (pointConfiguration != null) {
      duration.value = pointConfiguration.expiration_year;
      minUse.value = pointConfiguration.minUse;
      maxUse.value = pointConfiguration.maxUse;
      points.value = pointConfiguration.earnings_rate;
      lowerLimit.value = pointConfiguration.lowerLimit;
      upperLimit.value = pointConfiguration.upperLimit;
      usePoints.value = pointConfiguration.useYn;
      print("it sets values loaded true");
      valuesLoaded.value = true;
    }
  }

  Future<void> submitData(BuildContext context) async {
    isLoading.value = true;
    PointConfigurationModel pointConfiguration = PointConfigurationModel(
      type: 'point',
      expiration_year: duration.value,
      earnings_rate: points.value,
      useYn: usePoints.value,
      lower_limit: lowerLimit.value,
      upper_limit: upperLimit.value,
      maxUse: maxUse.value,
      minUse: minUse.value,
    );

    PointConfigurationRepository pointConfigRepo =
        PointConfigurationRepositoryImpl(collectionPath);
    await pointConfigRepo.addOrUpdatePointConfiguration(pointConfiguration);
    isLoading.value = false;
    //showCustomToast(context, "저장이 완료되었습니다");
  }
}
