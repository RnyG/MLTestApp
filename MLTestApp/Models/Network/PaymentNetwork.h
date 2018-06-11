//
//  PaymentNetwork.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Network.h"

@interface PaymentNetwork : Network
    
    -(void)getPaymentMethodsWithCallback:(void(^)(NSURLResponse *response, id responseObject, NSError *error))callback;
    
@end
