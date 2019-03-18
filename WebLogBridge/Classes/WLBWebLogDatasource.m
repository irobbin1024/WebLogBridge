//
//  WLBWebLogDatasource.m
//  Expecta
//
//  Created by irobbin on 2019/3/16.
//

#import "WLBWebLogDatasource.h"

@interface WLBWebLogDatasource ()

@property (nonatomic, strong) NSMutableArray * logList;

@end

@implementation WLBWebLogDatasource

- (instancetype)init {
    self = [super init];
    if (self) {
        _logList = [NSMutableArray arrayWithCapacity:100];
    }
    return self;
}

- (NSArray *)getLogs {
    __block NSArray * logs;
    @synchronized (self) {
        logs = [self.logList copy];
        
        [self.logList removeAllObjects];
    }
    
    return logs;
}

- (void)addLogWithChannel:(NSString *)channel content:(NSString *)content {
    @synchronized (self) {
        static NSDateFormatter * formatter;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        });
        [self.logList addObject:@{@"channel" : channel,
                                  @"content" : content,
                                  @"time" : [formatter stringFromDate:[NSDate date]]}];
    }
}

@end
