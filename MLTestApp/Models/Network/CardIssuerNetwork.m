//
//  CardIssuerNetwork.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 11/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "CardIssuerNetwork.h"

@implementation CardIssuerNetwork

    -(void)getCardIssuersWithPaymentMethodId:(NSString *)paymentMethodId andCallback:(void(^)(NSURLResponse *response, id responseObject, NSError *error))callback{
        
        [super getRequestDataWithURL:[NSString stringWithFormat:CARD_ISSUERS_URL,PUBLIC_KEY,paymentMethodId] requestName:@"CardIssuers" callback:^(NSURLResponse *response, id responseObject, NSError *error) {
            callback(response,responseObject,error);
        }];
        
    }
    
@end
