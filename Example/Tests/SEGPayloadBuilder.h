//
//  SEGPayloadBuilder.h
//  Segment-Mixpanel
//
//  Created by Prateek Srivastava on 2016-04-18.
//  Copyright © 2016 Prateek Srivastava. All rights reserved.
//

@import Foundation;
#import <Analytics/SEGAnalytics.h>

@interface SEGPayloadBuilder : NSObject

+ (SEGTrackPayload *)track:(NSString *)event;

+ (SEGTrackPayload *)track:(NSString *)event withProperties:(NSDictionary *)properties;

+ (SEGScreenPayload *)screen:(NSString *)name;

+ (SEGIdentifyPayload *)identify:(NSString *)userId;

+ (SEGIdentifyPayload *)identify:(NSString *)userId withTraits:(NSDictionary *)traits;

+ (SEGAliasPayload *)alias:(NSString *)newId;

+ (SEGGroupPayload *)group:(NSString *) groupId withTraits:(NSDictionary *)traits;

@end
