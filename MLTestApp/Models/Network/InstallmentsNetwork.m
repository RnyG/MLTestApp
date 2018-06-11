//
//  InstallmentsNetwork.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 11/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "InstallmentsNetwork.h"

@implementation InstallmentsNetwork

    -(void)getInstallmentsWithAmount:(NSString *)amount paymentMethodId:(NSString *)paymentMethodId issuerId:(NSString *)issuerId andCallback:(void(^)(NSURLResponse *response, id responseObject, NSError *error))callback{
        
        [super getRequestDataWithURL:[NSString stringWithFormat:INSTALLMENTS_URL,PUBLIC_KEY,amount,paymentMethodId,issuerId] requestName:@"Installments" callback:^(NSURLResponse *response, id responseObject, NSError *error) {
            callback(response,responseObject,error);
        }];

    }
    
@end
