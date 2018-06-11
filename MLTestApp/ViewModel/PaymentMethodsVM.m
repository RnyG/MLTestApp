//
//  PaymentMethodsVM.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "PaymentMethodsVM.h"

@interface PaymentMethodsVM ()
    
    @property (nonatomic, strong) NSMutableArray<PaymentMethod *> *paymentMethods;
    
@end

@implementation PaymentMethodsVM

    - (instancetype)initWithPaymentMethods{
        self = [super init];
        if (!self) return nil;

        PaymentNetwork *paymentNetwork=[[PaymentNetwork alloc]init];
    
        [paymentNetwork getPaymentMethodsWithCallback:^(NSURLResponse *response, id responseObject, NSError *error) {
            if (error) {
                NSLog(@"Error: %@", error);
                [self sendErrorNotification:error.localizedDescription];
            } else {
                NSArray *jsonObject = [[NSArray alloc] initWithObjects:responseObject, nil];
            if (jsonObject.count > 0){
                [self fillPaymentMethodsWithJsonObject:jsonObject];
            }else{
                [self sendErrorNotification:NSLocalizedString(@"There is no data available","")];
            }
        }
        }];
        return self;
    }
    - (void)sendErrorNotification:(NSString *)error{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PaymentMethodsReady" object:error];
    }
    - (void)fillPaymentMethodsWithJsonObject: (NSArray*)jsonObject{
        _paymentMethods = [[NSMutableArray alloc]init];
        NSDictionary *dictionary = [[NSDictionary alloc]init];
        NSArray * array = jsonObject[0];
        if (array.count >0){
        for (int i = 0; i < [array count]; i++){
            dictionary = array[i];
            PaymentMethod *paymentMethod = [[PaymentMethod alloc]initWithDictionary:dictionary];
            [_paymentMethods addObject:paymentMethod];
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"PaymentMethodsReady" object:nil];
        }else{
            [self sendErrorNotification:NSLocalizedString(@"There is no data available","")];
        }
    }
    
    - (NSString *)title{
        return NSLocalizedString(@"Payment Methods", @"");
    }
    
    - (NSString *)paymentMethodsLabelText{
        return NSLocalizedString(@"Select a payment method from the below list.", @"");
    }
    
    - (NSUInteger)numberOfPaymentMethodsInSection:(NSInteger)section{
        return self.paymentMethods.count;
    }
    - (NSString*)imageAtIndexPath:(NSIndexPath *)indexPath{
        PaymentMethod *paymentMethod = [self paymentMethodAtIndexPath:indexPath];
        return paymentMethod.secure_thumbnail;
    }
    
    - (NSString *)nameAtIndexPath:(NSIndexPath *)indexPath{
        PaymentMethod *paymentMethod = [self paymentMethodAtIndexPath:indexPath];
        return paymentMethod.name;
    }
    
    -(NSString *)selectedPaymentIdAtIndexPath:(NSIndexPath *)indexPath{
        PaymentMethod *paymentMethod = [self paymentMethodAtIndexPath:indexPath];
        [self storePaymentMethod:paymentMethod];
        return paymentMethod.ID;
    }
    - (PaymentMethod *)paymentMethodAtIndexPath:(NSIndexPath *)indexPath {
        return self.paymentMethods[indexPath.row];
    }
    -(void)storePaymentMethod:(PaymentMethod *)paymentMethod{
        NSMutableDictionary *newDict = [[NSMutableDictionary alloc]init];
        NSMutableDictionary *dictionary = [[NSUserDefaults standardUserDefaults] objectForKey:@"SavedInformation"];
        [newDict setObject:[dictionary objectForKey:@"amount"] forKey:@"amount"];
        [newDict setValue:paymentMethod.ID forKey:@"paymentId"];
        [newDict setValue:paymentMethod.name forKey:@"paymentName"];
        [newDict setValue:paymentMethod.secure_thumbnail forKey:@"paymentSecure_thumbnail"];
        [[NSUserDefaults standardUserDefaults] setObject:newDict forKey:@"SavedInformation"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
@end
