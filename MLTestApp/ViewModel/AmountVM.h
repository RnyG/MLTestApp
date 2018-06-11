//
//  AmountVM.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AmountVM : NSObject
    
    - (NSString *)title;
    - (NSString *)amountLabelText;
    - (BOOL)validAmount:(NSString *)amount;
    - (NSString *)numericFormatWithString:(NSString *)amount;
    - (void)storeAmount:(NSString *)amount;
    - (NSString *)getAllData;
@end
