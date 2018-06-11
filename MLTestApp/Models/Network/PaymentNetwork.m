//
//  PaymentNetwork.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "PaymentNetwork.h"

@implementation PaymentNetwork

    -(void)getPaymentMethodsWithCallback:(void (^)(NSURLResponse *, id, NSError *))callback{
        
        [super getRequestDataWithURL:[NSString stringWithFormat:PAYMENT_METHODS_URL,PUBLIC_KEY] requestName:@"PaymentMethods" callback:^(NSURLResponse *response, id responseObject, NSError *error) {
                callback(response,responseObject,error);
        }];
        
    }
@end
