#import "SEGMixpanelIntegrationFactory.h"
#import "SEGMixpanelIntegration.h"


@implementation SEGMixpanelIntegrationFactory

+ (instancetype)instance
{
    static dispatch_once_t once;
    static SEGMixpanelIntegrationFactory *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    return self;
}

- (id<SEGIntegration>)createWithSettings:(NSDictionary *)settings forAnalytics:(SEGAnalytics *)analytics
{
    return [[SEGMixpanelIntegration alloc] initWithSettings:settings];
}

- (NSString *)key
{
    return @"Mixpanel";
}

@end
