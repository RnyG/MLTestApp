//
//  Installments.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 9/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardIssuer.h"
#import "InstallmentsDetails.h"

@interface Installments : NSObject

    - (instancetype)initWithDictionary:(NSDictionary*)dictionary;
    
    @property (nonatomic, copy, readonly) NSString *payment_method_id;
    @property (nonatomic, copy, readonly) NSString *payment_type_id;
    @property (nonatomic, copy, readonly) CardIssuer *issuer;
    @property (nonatomic, copy, readonly) NSString *processing_mode;
    @property (nonatomic, copy, readonly) NSString *merchant_account_id;
    @property (nonatomic, copy, readonly) NSMutableArray<InstallmentsDetails *> *payer_costs;
    
@end
