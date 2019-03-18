//
//  WLBWebLogManager.h
//  Expecta
//
//  Created by irobbin on 2019/3/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLBWebLogManager : NSObject

@property (readonly) BOOL isRunning;

+ (instancetype)sharedManager;
- (void)startServer;
- (void)stopServer;
- (void)sendLogWithChannel:(NSString *)channel content:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
