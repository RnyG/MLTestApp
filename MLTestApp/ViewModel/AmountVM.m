//
//  AmountVM.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "AmountVM.h"
#define MAX_VALUE @"250.000"

@implementation AmountVM

    - (NSString *)title{
        return NSLocalizedString(@"Amount", @"");
    }
    
    - (NSString *)amountLabelText{
        return [NSString stringWithFormat:NSLocalizedString(@"Type an Amount between 1 and %@", @""),MAX_VALUE];
    }
    
    - (BOOL)validAmount:(NSString *)amount{
        NSInteger val = [self getValue:amount];
        NSInteger maxVal = [self getMaxValue];
        
        if ((val > 0) && (val <= maxVal)){
            return YES;
        }
        return NO;
    }
    
    - (NSString *)numericFormatWithString:(NSString *)amount{
        NSInteger val = [self getValue:amount];
        val = [self getValue:[self allowedText:amount]];
        return [self formatterWith:val];
    }
    
    - (NSString *)formatterWith:(NSInteger)value{
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setLocale:[NSLocale currentLocale]];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [numberFormatter setMaximumFractionDigits:0];
        NSString *formattedNumber = [numberFormatter stringFromNumber:[NSNumber numberWithInteger:value]];
        return formattedNumber;
    }
    
    - (NSString *)allowedText:(NSString *)amount{
        NSInteger val = [self getValue:amount];
        
        if (val <= 250000){
            return amount;
        }
        return [amount substringToIndex:[amount length]-1];;
    }
    - (NSInteger)getValue:(NSString *)amount{
        NSInteger val = 0;
        if ([amount containsString:@"."]){
            val = [[amount stringByReplacingOccurrencesOfString:@"." withString:@""] integerValue];
        }else{
            val = [[amount stringByReplacingOccurrencesOfString:@"," withString:@""] integerValue];
        }
        return val;
    }
    - (NSInteger)getMaxValue{
        return [[MAX_VALUE stringByReplacingOccurrencesOfString:@"." withString:@""] integerValue];
    }
    -(void)storeAmount:(NSString *)amount{
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
        [dictionary setValue:amount forKey:@"amount"];
        [[NSUserDefaults standardUserDefaults] setObject:dictionary forKey:@"SavedInformation"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    
    - (NSString *)getAllData{
        NSDictionary * dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"SavedInformation"];
        NSString *amount = [dict objectForKey:@"amount"];
        NSString *paymentMethod = [dict objectForKey:@"paymentName"];
        NSString *issuer = [dict objectForKey:@"issuerName"];
        NSString *installment = [dict objectForKey:@"recommended_message"];
        NSString *message = NSLocalizedString(@"Amount: %@\nPayment Method: %@\nCard Issuer: %@\nInstallment Option: %@",@"");
        return [NSString stringWithFormat:message,amount,paymentMethod,issuer,installment];
    }
    
@end
