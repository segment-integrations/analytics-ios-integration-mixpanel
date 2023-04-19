#import <Foundation/Foundation.h>

#if defined(__has_include) && __has_include(<Analytics/SEGAnalytics.h>)
#import <Analytics/SEGIntegrationFactory.h>
#else
@import Segment;
#endif

@interface SEGMixpanelIntegrationFactory : NSObject <SEGIntegrationFactory>

+ (instancetype)instance;
+ (instancetype)createWithLaunchOptions:(NSString *)token launchOptions:(NSDictionary *)launchOptions;

@property NSDictionary *launchOptions;

@end

