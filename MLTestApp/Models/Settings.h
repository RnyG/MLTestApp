//
//  Settings.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecurityCode.h"
#import "CardNumber.h"
#import "Bin.h"

@interface Settings : NSObject
    
    @property (nonatomic, copy, readonly) SecurityCode * security_code;
    @property (nonatomic, copy, readonly) CardNumber * card_number;
    @property (nonatomic, copy, readonly) Bin * bin;

@end
