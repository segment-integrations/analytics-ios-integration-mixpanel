#import <Foundation/Foundation.h>
#import <Analytics/SEGIntegrationFactory.h>

@interface SEGMixpanelIntegrationFactory : NSObject<SEGIntegrationFactory>

+ (id)instance;

@end