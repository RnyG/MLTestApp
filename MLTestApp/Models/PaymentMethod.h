//
//  PaymentMethod.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 9/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Settings.h"
#import "FinancialInstitution.h"

@interface PaymentMethod : NSObject

    - (instancetype)initWithDictionary:(NSDictionary*)dictionary;
    
    @property (nonatomic, copy, readonly) NSString *ID;
    @property (nonatomic, copy, readonly) NSString *name;
    @property (nonatomic, copy, readonly) NSString *payment_type_id;
    @property (nonatomic, copy, readonly) NSString *status;
    @property (nonatomic, copy, readonly) NSString *secure_thumbnail;
    @property (nonatomic, copy, readonly) NSString *thumbnail;
    @property (nonatomic, copy, readonly) NSString *deferred_capture;
    @property (nonatomic, copy, readonly) NSMutableArray<Settings *> *settings;
    @property (nonatomic, copy, readonly) NSNumber *min_allowed_amount;
    @property (nonatomic, copy, readonly) NSNumber *max_allowed_amount;
    @property (nonatomic, copy, readonly) NSNumber *accreditation_time;
    @property (nonatomic, copy, readonly) NSArray *additional_info_needed;
    @property (nonatomic, copy, readonly) NSMutableArray<FinancialInstitution *> *financial_institutions;
    @property (nonatomic, copy, readonly) NSArray *processing_modes;
    
@end

/*
 400 BAD_REQUEST
    1000 the credentials are required
    1001 public_key not found
 401 UNAUTHORIZED
    unauthorized: unauthorized
 404 NOT_FOUND
    not_found: not_found
 */
