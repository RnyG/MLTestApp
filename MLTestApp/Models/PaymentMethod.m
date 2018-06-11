//
//  PaymentMethod.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 9/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "PaymentMethod.h"

@implementation PaymentMethod

    - (instancetype)initWithDictionary:(NSDictionary *)dictionary{
        self = [super init];
        if (!self) return nil;
        
        _ID = [dictionary objectForKey:@"id"];
        _name = [dictionary objectForKey:@"name"];
        _payment_type_id = [dictionary objectForKey:@"payment_type_id"];
        _status = [dictionary objectForKey:@"status"];
        _secure_thumbnail = [dictionary objectForKey:@"secure_thumbnail"];
        _thumbnail = [dictionary objectForKey:@"thumbnail"];
        _deferred_capture = [dictionary objectForKey:@"deferred_capture"];
        _settings = [dictionary objectForKey:@"settings"];
        _min_allowed_amount = [dictionary objectForKey:@"min_allowed_amount"];
        _max_allowed_amount = [dictionary objectForKey:@"max_allowed_amount"];
        _accreditation_time = [dictionary objectForKey:@"accreditation_time"];
        _additional_info_needed = [dictionary objectForKey:@"additional_info_needed"];
        _financial_institutions = [dictionary objectForKey:@"financial_institutions"];
        _processing_modes = [dictionary objectForKey:@"processing_modes"];
        
        return self;
    }
    
@end
