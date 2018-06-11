//
//  CardIssuer.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 9/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "CardIssuer.h"

@implementation CardIssuer

    - (instancetype)initWithDictionary:(NSDictionary*)dictionary{
        self = [super init];
        if (!self) return nil;

        _ID = [dictionary objectForKey:@"id"];
        _name = [dictionary objectForKey:@"name"];
        _secure_thumbnail = [dictionary objectForKey:@"secure_thumbnail"];
        _thumbnail = [dictionary objectForKey:@"thumbnail"];
        _processing_mode = [dictionary objectForKey:@"processing_mode"];
        _merchant_account_id = [dictionary objectForKey:@"merchant_account_id"];
        
        return self;
    }
    
@end
