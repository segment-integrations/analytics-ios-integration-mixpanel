//
//  Segment-MixpanelTests.m
//  Segment-MixpanelTests
//
//  Created by Prateek Srivastava on 11/06/2015.
//  Copyright (c) 2015 Prateek Srivastava. All rights reserved.
//

// https://github.com/Specta/Specta

#import "SEGPayloadBuilder.h"
#import <MixpanelGroup.h>

SpecBegin(InitialSpecs)

describe(@"Mixpanel Integration", ^{
    __block SEGMixpanelIntegration *integration;
    __block Mixpanel *mixpanel;
    __block MixpanelPeople *mixpanelPeople;
    __block MixpanelGroup *mixpanelGroup;

    beforeEach(^{
        mixpanel = mock([Mixpanel class]);
        mixpanelPeople = mock([MixpanelPeople class]);
        [given([mixpanel people]) willReturn:mixpanelPeople];

        mixpanelGroup = mock([MixpanelGroup class]);

        integration = [[SEGMixpanelIntegration alloc] initWithSettings:@{
            @"trackAllPages" : @1,
            @"setAllTraitsByDefault" : @1,
            @"enableEuropeanUnionEndpoint" : @1,
            @"groupIdentifierTraits" : @[@"group_id", @"group_name", @"group_idtest2"]
        } andMixpanel:mixpanel];
    });

    it(@"track", ^{
        [integration track:[SEGPayloadBuilder track:@"App Opened"]];

        [verify(mixpanel) track:@"App Opened" properties:@{}];
    });

    it(@"track with properties", ^{
        [integration track:[SEGPayloadBuilder track:@"Viewed Product" withProperties:@{
            @"sku" : @"123456"
        }]];

        [verify(mixpanel) track:@"Viewed Product" properties:@{
            @"sku" : @"123456"
        }];
    });

    it(@"track with people", ^{
        [integration setSettings:@{
            @"people" : @1
        }];
        [integration track:[SEGPayloadBuilder track:@"Purchased Item" withProperties:@{
            @"revenue" : @19.99
        }]];

        [verify(mixpanel) track:@"Purchased Item" properties:@{
            @"revenue" : @19.99
        }];
        [verify(mixpanelPeople) trackCharge:@19.99];
    });

    it(@"track with property increments", ^{
        [integration setSettings:@{
            @"people" : @1,
            @"propIncrements" : @[@"revenue"]
        }];
        [integration track:[SEGPayloadBuilder track:@"Purchased Item" withProperties:@{
            @"revenue" : @19.99
        }]];
        [verify(mixpanel) track:@"Purchased Item" properties:@{
            @"revenue" : @19.99
        }];
    });

    it(@"screen", ^{
        [integration screen:[SEGPayloadBuilder screen:@"Home"]];

        [verify(mixpanel) track:@"Viewed Home Screen" properties:@{}];
    });

    it(@"screen with consolidatedPageCalls", ^{
        [integration setSettings:@{
            @"consolidatedPageCalls" : @1
        }];
        [integration screen:[SEGPayloadBuilder screen:@"Home"]];

        [verify(mixpanel) track:@"Loaded a Screen" properties:@{@"name": @"Home"}];
    });

    it(@"identify", ^{
        [integration identify:[SEGPayloadBuilder identify:@"prateek"]];

        [verify(mixpanel) identify:@"prateek"];
    });

    it(@"identify with traits", ^{
        [integration identify:[SEGPayloadBuilder identify:@"prateek" withTraits:@{
            @"firstName" : @"Prateek",
            @"lastName" : @"Srivastava",
            @"createdAt" : @"",
            @"lastSeen" : @"",
            @"email" : @"prateek@segment.com",
            @"name" : @"prateek srivastava",
            @"username" : @"f2prateek",
            @"phone" : @"",
            @"age" : @24
        }]];

        [verify(mixpanel) identify:@"prateek"];
        [verify(mixpanel) registerSuperProperties:@{
            @"$first_name" : @"Prateek",
            @"$last_name" : @"Srivastava",
            @"$created" : @"",
            @"$last_seen" : @"",
            @"$email" : @"prateek@segment.com",
            @"$name" : @"prateek srivastava",
            @"$username" : @"f2prateek",
            @"$phone" : @"",
            @"age" : @24
        }];
    });


    it(@"simple group", ^{
        NSDictionary *groupTraits = @{
                                      @"groupCity" : @"Cairo",
                                      @"group_name" : @"mixPanelTest1Group"
                                      };
        [integration group:[SEGPayloadBuilder group:@"groupTest1" withTraits:groupTraits]];

        NSDictionary *groupIdentifierTraits = integration.settings[@"groupIdentifierTraits"];

        for (NSString *identifierTrait in groupIdentifierTraits) {
            NSString *groupIdentifierVal = groupTraits[identifierTrait];
            if (groupIdentifierVal) {
                 [verify(mixpanel) getGroup:groupIdentifierVal groupID:@"groupTest1"];
            }

        }

    });

    it(@"complex group", ^{
        NSDictionary *groupTraits = @{
                                      @"groupCity" : @"Alexandria",
                                      @"name" : @"mixPanelTest1Group",
                                      @"address": @{@"city": @"Alexandria", @"postalCode": @"22314", @"state":@"Virginia", @"street": @"105 N Union St" },
                                      @"description": @"Art Center",
                                      @"avatar" : @"https://gravatar.com/avatar/f8b72def445675a558fe68b1cb651da1?s=400&d=robohash&r=x"
                                      };
        [integration group:[SEGPayloadBuilder group:@"groupTest1" withTraits:groupTraits]];

        NSDictionary *groupIdentifierTraits = integration.settings[@"groupIdentifierTraits"];

        for (NSString *identifierTrait in groupIdentifierTraits) {
            NSString *groupIdentifierVal = groupTraits[identifierTrait];
            if (groupIdentifierVal) {
                [verify(mixpanel) getGroup:groupIdentifierVal groupID:@"groupTest1"];
            }

        }

    });

    it(@"simple group without name", ^{
        NSDictionary *groupTraits = @{
                                      @"groupCity" : @"Cairo"
                                      };
        [integration group:[SEGPayloadBuilder group:@"groupTest2" withTraits:groupTraits]];

        NSDictionary *groupIdentifierTraits = integration.settings[@"groupIdentifierTraits"];

        for (NSString *identifierTrait in groupIdentifierTraits) {
            NSString *groupIdentifierVal = groupTraits[identifierTrait];
             [given([mixpanel getGroup:groupIdentifierVal groupID:@"groupTest2"]) willReturn:nil];

        }
    });

    it(@"simple group setOnce traits", ^{
        [given([mixpanel getGroup:@"test1" groupID:@"groupTest2"]) willReturn:mixpanelGroup];
        NSDictionary *groupTraits = @{
                                      @"groupCity" : @"Cairo",
                                      @"groupCount" : @"20",
                                      @"group_id" : @"test1"
                                      };
        [integration group:[SEGPayloadBuilder group:@"groupTest2" withTraits:groupTraits]];

        [verify(mixpanelGroup) setOnce:groupTraits];
        [verify(mixpanel) getGroup:@"test1" groupID:@"groupTest2"];
    });

    it(@"alias", ^{
        [given([mixpanel distinctId]) willReturn:@"123456"];
        [integration alias:[SEGPayloadBuilder alias:@"prateek"]];

        [verify(mixpanel) createAlias:@"prateek" forDistinctID:@"123456"];
    });

    it(@"flush", ^{
        [integration flush];

        [verify(mixpanel) flush];
    });

    it(@"reset", ^{
        [integration reset];

        [verify(mixpanel) flush];
    });
});

SpecEnd
