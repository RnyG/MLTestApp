//
//  Installments.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 9/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "Installments.h"

@implementation Installments

    - (instancetype)initWithDictionary:(NSDictionary *)dictionary{
        self = [super init];
        if (!self) return nil;
        
        _payment_method_id = [dictionary objectForKey:@"payment_method_id"];
        _payment_type_id = [dictionary objectForKey:@"payment_type_id"];
        _issuer = [[CardIssuer alloc]initWithDictionary:[dictionary objectForKey:@"issuer"]];
        _processing_mode = [dictionary objectForKey:@"processing_mode"];
        _merchant_account_id = [dictionary objectForKey:@"merchant_account_id"];
        NSArray *array = [dictionary objectForKey:@"payer_costs"];
        NSDictionary *dict = [[NSDictionary alloc]init];
        NSMutableArray<InstallmentsDetails *> *details = [[NSMutableArray alloc]init];
        for (int i = 0; i < [array count]; i++){
            dict = array[i];
            InstallmentsDetails *installmentDetail = [[InstallmentsDetails alloc]initWithDictionary:dict];
            [details addObject:installmentDetail];
//            [self.payer_costs addObject:installmentDetail];
        }
        _payer_costs = details;
        return self;
    }
    
@end
