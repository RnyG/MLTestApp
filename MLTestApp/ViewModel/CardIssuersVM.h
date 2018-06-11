//
//  CardIssuersVM.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 11/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardIssuerNetwork.h"
#import "CardIssuer.h"
#import <UIImageView+AFNetworking.h>

@interface CardIssuersVM : NSObject

    - (instancetype)initCardIssuersWithPaymentMethodId:(NSString *)paymentMethodId;
    - (NSString *)title;
    - (NSString *)cardIssuersLabelText;
    - (NSUInteger)numberOfCardIssuersInSection:(NSInteger)section;
    - (NSString *)imageAtIndexPath:(NSIndexPath *)indexPath;
    - (NSString *)nameAtIndexPath:(NSIndexPath *)indexPath;
    - (NSString *)selectedIssuerIdAtIndexPath:(NSIndexPath *)indexPath;
    - (NSString *)getValue:(NSString *)amount;
    
@end
