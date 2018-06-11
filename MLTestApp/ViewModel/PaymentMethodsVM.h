//
//  PaymentMethodsVM.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentNetwork.h"
#import "PaymentMethod.h"
#import <UIImageView+AFNetworking.h>

@interface PaymentMethodsVM : NSObject

    - (instancetype)initWithPaymentMethods;
    - (NSString *)title;
    - (NSString *)paymentMethodsLabelText;
    - (NSUInteger)numberOfPaymentMethodsInSection:(NSInteger)section;
    - (NSString *)imageAtIndexPath:(NSIndexPath *)indexPath;
    - (NSString *)nameAtIndexPath:(NSIndexPath *)indexPath;
    - (NSString *)selectedPaymentIdAtIndexPath:(NSIndexPath *)indexPath;

@end
