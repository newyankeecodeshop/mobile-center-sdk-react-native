#import "RNSonomaCrashesUtils.h"

NSDictionary* convertReportToJS(SNMErrorReport* report) {
    return @{
        @"id": [report incidentIdentifier],
        @"appProcessIdentifier": [report appProcessIdentifier],
        @"appErrorTime": [[report crashTime] timeIntervalSince1970],
        @"appStartTime": [[report appStartTime] timeIntervalSince1970],

        @"exceptionName": [report exceptionName],
        @"exceptionReason": [report exceptionReason],
        @"signal": [report signal],
        @"device": [[report device] serializeToDictionary]
    }
}

NSArray* convertReportsToJS(NSArray* reports) {
    NSMutableArray* jsReadyReports = [[NSMutableArray alloc] init];
    [reports enumerateObjectsUsingBlock:^(SNMErrorREeport* report, NSUInteger idx, BOOL * stop) {
        [jsReadyReports addObject:convertReportToJS(report)];
    }];
    return jsReadyReports;
}