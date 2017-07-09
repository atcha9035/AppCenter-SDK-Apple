import Foundation;

/**
 * Protocol for interacting with MobileCenter SDK.
 * Swift and Objective C implement this protocol
 * to show usage of MobileCenter SDK in a language specific way.
 */
@objc protocol MobileCenterDelegate {

  // MARK: MSMobileCenter section.
  func isMobileCenterEnabled()->Bool;
  func setMobileCenterEnabled(_ isEnabled : Bool);
  func installId()->String;
  func appSecret()->String;
  func logUrl()->String;
  func isDebuggerAttached()->Bool;

  // MARK: Modules section.
  func isAnalyticsEnabled()->Bool;
  func setAnalyticsEnabled(_ isEnabled : Bool);

  func isCrashesEnabled() -> Bool
  func setCrashesEnabled(_ isEnabled: Bool)

  // MARK: MSAnalytics section.
  func trackEvent(_ eventName : String);
  func trackEvent(_ eventName : String, withProperties : Dictionary<String, String>);
  func trackPage(_ pageName : String);
  func trackPage(_ pageName : String, withProperties : Dictionary<String, String>);

  // MARK: MSCrashes section.
  func hasCrashedInLastSession() -> Bool
  func generateTestCrash()

  // Last crash report section.
  func lastCrashReportIncidentIdentifier() -> String?
  func lastCrashReportReporterKey() -> String?
  func lastCrashReportSignal() -> String?
  func lastCrashReportExceptionName() -> String?
  func lastCrashReportExceptionReason() -> String?
  func lastCrashReportAppStartTimeDescription() -> String?
  func lastCrashReportAppErrorTimeDescription() -> String?
  func lastCrashReportAppProcessIdentifier() -> UInt
  func lastCrashReportIsAppKill() -> Bool
  func lastCrashReportDeviceModel() -> String?
  func lastCrashReportDeviceOemName() -> String?
  func lastCrashReportDeviceOsName() -> String?
  func lastCrashReportDeviceOsVersion() -> String?
  func lastCrashReportDeviceOsBuild() -> String?
  func lastCrashReportDeviceLocale() -> String?
  func lastCrashReportDeviceTimeZoneOffset() -> NSNumber?
  func lastCrashReportDeviceScreenSize() -> String?
  func lastCrashReportDeviceAppVersion() -> String?
  func lastCrashReportDeviceAppBuild() -> String?
  func lastCrashReportDeviceCarrierName() -> String?
  func lastCrashReportDeviceCarrierCountry() -> String?
  func lastCrashReportDeviceAppNamespace() -> String?
}
