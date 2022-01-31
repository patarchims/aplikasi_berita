part of 'services.dart';

class AppServices {
  static void checkVersionApp(BuildContext context) async {
    final newVersion = NewVersion(androidId: 'com.chims_app');
    final VersionStatus? status = await newVersion.getVersionStatus();

    if (status != null) {
      if (status.canUpdate) {
        newVersion.showUpdateDialog(
          context: context,
          versionStatus: status,
          dialogTitle: 'Gampong News',
          dismissAction: () {
            SystemNavigator.pop();
          },
          dismissButtonText: 'NANTI',
          updateButtonText: "UPDATE SEKARANG",
        );
      }
    }
  }
}
