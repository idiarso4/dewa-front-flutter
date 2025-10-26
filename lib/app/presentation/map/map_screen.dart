// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:presensi_smkn1punggelan/app/presentation/map/map_notifier.dart';
import 'package:presensi_smkn1punggelan/core/helper/global_helper.dart';
import 'package:presensi_smkn1punggelan/core/helper/location_helper.dart';
import 'package:presensi_smkn1punggelan/core/widget/app_widget.dart';
import 'package:presensi_smkn1punggelan/core/widget/loading_app_widget.dart';

class MapScreen extends AppWidget<MapNotifier, void, void> {
  MapScreen({super.key});

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.isSuccess) {
      Navigator.pop(context);
    }
  }

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: Text('Buat Kehadiran'),
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Expanded(
          child: OSMFlutter(
            controller: notifier.mapController,
            osmOption: OSMOption(
                zoomOption: ZoomOption(
                    initZoom: 15.5, maxZoomLevel: 17.5, minZoomLevel: 10)),
            onMapIsReady: (p0) {
              if (p0) {
                notifier.mapIsReady();
              }
            },
            mapIsLoading: LoadingAppWidget(),
          ),
        ),
        _footerLayout(context)
      ],
    ));
  }

  _footerLayout(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_city,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notifier.schedule?.office.name ?? '',
                            style: GlobalHelper.getTextStyle(context,
                                appTextStyle: AppTextStyle.titleMedium),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: GlobalHelper.getColorSchema(context)
                                    .primary),
                            child: Text(
                                (notifier.schedule?.isWfa ?? false)
                                    ? 'WFA'
                                    : 'WFO',
                                style: GlobalHelper.getTextStyle(context,
                                        appTextStyle: AppTextStyle.bodySmall)
                                    ?.copyWith(
                                  color: GlobalHelper.getColorSchema(context)
                                      .onPrimary,
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shift Kerja',
                            style: GlobalHelper.getTextStyle(context,
                                appTextStyle: AppTextStyle.titleMedium),
                          ),
                          Text(
                              '${notifier.schedule?.startTime ?? ''} - ${notifier.schedule?.endTime ?? ''}',
                              style: GlobalHelper.getTextStyle(context,
                                  appTextStyle: AppTextStyle.bodySmall))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(child: SizedBox())
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              width: double.maxFinite,
              child: FilledButton(
                  onPressed:
                      (notifier.isEnableSubmitButton) ? _onPressSubmit : null,
                  child: Text("Kirim Kehadiran")))
        ],
      ),
    );
  }

  _onPressSubmit() {
    notifier.send();
  }

  @override
  FilledButton? alternatifErrorButton(BuildContext context) {
    if (!notifier.isGrantedLocaiton) {
      return FilledButton(
          onPressed: () async {
            await LocationHelper.showDialogLocationPermission(context);
            notifier.checkLocationPermission();
          },
          child: Text('Setujui'));
    }
    if (!notifier.isEnabledLocation) {
      return FilledButton(
          onPressed: () async {
            LocationHelper.openLocationSetting();
            notifier.checkLocationService();
          },
          child: Text('Buka Pengaturan Lokasi'));
    }
    return null;
  }
}
