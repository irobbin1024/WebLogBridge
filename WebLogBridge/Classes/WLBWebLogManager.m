//
//  WLBWebLogManager.m
//  Expecta
//
//  Created by irobbin on 2019/3/16.
//

#import "WLBWebLogManager.h"
#import "GCDWebServer.h"
#import "WLBWebLogDatasource.h"
#import "GCDWebServerDataResponse.h"

@interface WLBWebLogManager ()

@property (nonatomic, strong) GCDWebServer * webServer;
@property (nonatomic, strong) WLBWebLogDatasource * datasource;

@end

@implementation WLBWebLogManager

+ (instancetype)sharedManager {
    static WLBWebLogManager *staticInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        staticInstance = [[WLBWebLogManager alloc] init];
    });
    return staticInstance;
}

- (WLBWebLogDatasource *)datasource {
    if (_datasource == nil) {
        _datasource = [WLBWebLogDatasource new];
    }
    return _datasource;
}

- (BOOL)isRunning {
    return self.webServer && self.webServer.isRunning;
}

- (void)startServer {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        self.webServer = [GCDWebServer new];
        
        __weak WLBWebLogManager * weakSelf = self;
        [self.webServer addDefaultHandlerForMethod:@"GET" requestClass:[GCDWebServerRequest class] processBlock:^GCDWebServerResponse * _Nullable(__kindof GCDWebServerRequest * _Nonnull request) {
            
            if ([request.path isEqualToString:@"/get_more_event"]) {
                GCDWebServerDataResponse * response = [GCDWebServerDataResponse responseWithJSONObject:(id)[weakSelf.datasource getLogs]];
                return response;
            } else {
                
                return [weakSelf getIndexHTMLResponse];
            }
            return nil;
        }];
        
        [self.webServer startWithOptions:@{GCDWebServerOption_AutomaticallySuspendInBackground : @(NO), GCDWebServerOption_Port : @(8086)} error:NULL];
    });
}

- (void)stopServer {
    [self.webServer stop];
}

- (void)sendLogWithChannel:(NSString *)channel content:(NSString *)content {
    [self.datasource addLogWithChannel:channel content:content];
}

- (GCDWebServerDataResponse *)getIndexHTMLResponse {
    NSString *mainBundlePath = [[NSBundle mainBundle] resourcePath];
    NSString *bundlePath = [mainBundlePath stringByAppendingPathComponent:@"WebLogBridge.bundle"];
    NSString * path = [bundlePath stringByAppendingPathComponent:@"index.html"];
    NSString * indexString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    indexString = [indexString stringByReplacingOccurrencesOfString:@"${server_address}" withString:self.webServer.serverURL.absoluteString];
    
    GCDWebServerDataResponse * response = [GCDWebServerDataResponse responseWithHTML:indexString];
    return response;
}

@end
