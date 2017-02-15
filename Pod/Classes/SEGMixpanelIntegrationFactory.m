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

- (instancetype)initWithLaunchOptions: (NSDictionary *)launchOptions
{
    if (self = [super init]) {
        self.launchOptions = launchOptions;
    }
    return self;
}


+ (instancetype)instanceWithLaunchOptions: (NSString *)token launchOptions:(NSDictionary *)launchOptions
{
    static dispatch_once_t once;
    static SEGMixpanelIntegrationFactory *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] initWithLaunchOptions:launchOptions];
    });
    return sharedInstance;
    
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
