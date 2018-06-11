//
//  InstallmentsDetails.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "InstallmentsDetails.h"

@implementation InstallmentsDetails
    
    - (instancetype)initWithDictionary:(NSDictionary *)dictionary{
        self = [super init];
        if (!self) return nil;
     
        _installments = [dictionary objectForKey:@"installments"];
        _installment_rate = [dictionary objectForKey:@"installment_rate"];
        _discount_rate = [dictionary objectForKey:@"discount_rate"];
        _labels = [dictionary objectForKey:@"labels"];
        _installment_rate_collector = [dictionary objectForKey:@"installment_rate_collector"];
        _min_allowed_amount = [dictionary objectForKey:@"min_allowed_amount"];
        _max_allowed_amount = [dictionary objectForKey:@"max_allowed_amount"];
        _recommended_message = [dictionary objectForKey:@"recommended_message"];
        _installment_amount = [dictionary objectForKey:@"installment_amount"];
        _total_amount = [dictionary objectForKey:@"total_amount"];
        
        return self;
    }
    
@end
