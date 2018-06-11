//
//  InstallmentsVM.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 11/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InstallmentsNetwork.h"
#import "Installments.h"

@interface InstallmentsVM : NSObject

    - (instancetype)initInstallmentsWithAmount:(NSString *)amount paymentMethodId:(NSString *)paymentMethodId andIssuerId:(NSString *)issuerId;
    - (NSString *)title;
    - (NSString *)installmentsLabelText;
    - (NSUInteger)numberOfInstallmentsInSection:(NSInteger)section;
    - (NSString *)recommendedMessageAtIndexPath:(NSIndexPath *)indexPath;
    - (NSString *)selectedInstallmentAtIndexPath:(NSIndexPath *)indexPath;

@end
