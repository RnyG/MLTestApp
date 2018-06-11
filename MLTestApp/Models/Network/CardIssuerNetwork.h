//
//  CardIssuerNetwork.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 11/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Network.h"

@interface CardIssuerNetwork : Network
    
    -(void)getCardIssuersWithPaymentMethodId:(NSString *)paymentMethodId andCallback:(void(^)(NSURLResponse *response, id responseObject, NSError *error))callback;

@end
