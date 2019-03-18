//
//  WLBWebLogDatasource.h
//  Expecta
//
//  Created by irobbin on 2019/3/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WLBWebLogDatasource : NSObject

- (NSArray *)getLogs;
- (void)addLogWithChannel:(NSString *)channel content:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
