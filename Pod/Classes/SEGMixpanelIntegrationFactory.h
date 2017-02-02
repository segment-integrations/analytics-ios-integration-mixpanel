#import <Foundation/Foundation.h>
#import <Analytics/SEGIntegrationFactory.h>


@interface SEGMixpanelIntegrationFactory : NSObject <SEGIntegrationFactory>

+ (instancetype)instance;
+ (instancetype)instanceWithLaunchOptions: (NSString *)token launchOptions:(NSDictionary *)launchOptions;

@end
