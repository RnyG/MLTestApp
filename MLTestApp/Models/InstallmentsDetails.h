//
//  InstallmentsDetails.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InstallmentsDetails : NSObject
    
    - (instancetype)initWithDictionary:(NSDictionary*)dictionary;
    
    @property (nonatomic, copy, readonly) NSNumber *installments;
    @property (nonatomic, copy, readonly) NSNumber *installment_rate;
    @property (nonatomic, copy, readonly) NSNumber *discount_rate;
    @property (nonatomic, copy, readonly) NSArray *labels;
    @property (nonatomic, copy, readonly) NSArray *installment_rate_collector;
    @property (nonatomic, copy, readonly) NSNumber *min_allowed_amount;
    @property (nonatomic, copy, readonly) NSNumber *max_allowed_amount;
    @property (nonatomic, copy, readonly) NSString *recommended_message;
    @property (nonatomic, copy, readonly) NSNumber *installment_amount;
    @property (nonatomic, copy, readonly) NSNumber *total_amount;
    
    
@end
