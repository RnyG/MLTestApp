//
//  Network.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#define PUBLIC_KEY @"444a9ef5-8a6b-429f-abdf-587639155d88"
#define PAYMENT_METHODS_URL @"https://api.mercadopago.com/v1/payment_methods?public_key=%@"
#define CARD_ISSUERS_URL @"https://api.mercadopago.com/v1/payment_methods/card_issuers?public_key=%@&payment_method_id=%@"
#define INSTALLMENTS_URL @"https://api.mercadopago.com/v1/payment_methods/installments?public_key=%@&amount=%@&payment_method_id=%@&issuer.id=%@"

@interface Network : NSObject

    - (void)getRequestDataWithURL:(NSString *)url requestName:(NSString *)requestName callback:(void(^)(NSURLResponse *response, id responseObject, NSError *error))callback;
    
@end
