//
//  InstallmentsVM.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 11/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "InstallmentsVM.h"

@interface InstallmentsVM ()
    
    @property (nonatomic, strong) Installments *installments;
    @property (nonatomic, strong) NSArray<InstallmentsDetails *> *installmentsDetail;
    
    @end

@implementation InstallmentsVM

    - (instancetype)initInstallmentsWithAmount:(NSString *)amount paymentMethodId:(NSString *)paymentMethodId andIssuerId:(NSString *)issuerId{
        self = [super init];
        if (!self) return nil;
        
        InstallmentsNetwork *installmentsNetwork =[[InstallmentsNetwork alloc]init];
        
        [installmentsNetwork getInstallmentsWithAmount:amount paymentMethodId:paymentMethodId issuerId:issuerId andCallback:^(NSURLResponse *response, id responseObject, NSError *error) {
            if (error) {
                NSLog(@"Error: %@", error);
                [self sendErrorNotification:error.localizedDescription];
            } else {
                NSArray *array = [[NSArray alloc]init];
                array = responseObject;
                if (array.count > 0){
                NSDictionary *jsonObject = [[NSDictionary alloc] initWithDictionary:responseObject[0]];
                if (jsonObject.count > 0){
                    [self fillInstallmentsWithJsonObject:jsonObject];
                }else{
                    [self sendErrorNotification:NSLocalizedString(@"There is no data available","")];
                }
                }else{
                    [self sendErrorNotification:NSLocalizedString(@"There is no data available","")];
                }
            }
        }];
        return self;
    }
    - (void)sendErrorNotification:(NSString *)error{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"InstallmentsReady" object:error];
    }
    
    - (void)fillInstallmentsWithJsonObject: (NSDictionary*)jsonObject{

        
        _installments = [[Installments alloc]initWithDictionary:jsonObject];

        _installmentsDetail = _installments.payer_costs;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"InstallmentsReady" object:nil];
    }
    
    - (NSString *)title{
        return NSLocalizedString(@"Installments", @"");
    }
    
    - (NSString *)installmentsLabelText{
        return NSLocalizedString(@"Select an installment option from the below list.", @"");
    }
    
    - (NSUInteger)numberOfInstallmentsInSection:(NSInteger)section{
        return self.installmentsDetail.count;
    }

    - (NSString *)recommendedMessageAtIndexPath:(NSIndexPath *)indexPath{
        InstallmentsDetails *installmentsDetail = [self installmentsDetailAtIndexPath:indexPath];
        return installmentsDetail.recommended_message;
    }
    
    - (InstallmentsDetails *)installmentsDetailAtIndexPath:(NSIndexPath *)indexPath {
        return self.installmentsDetail[indexPath.row];
    }
    - (NSString *)selectedInstallmentAtIndexPath:(NSIndexPath *)indexPath{
        InstallmentsDetails *installmentsDetail = [self installmentsDetailAtIndexPath:indexPath];
        [self storeInstallment:installmentsDetail];
        return installmentsDetail.recommended_message;
    }
    -(void)storeInstallment:(InstallmentsDetails *)installmentsDetail{
        NSMutableDictionary *newDict = [[NSMutableDictionary alloc]init];
        NSMutableDictionary *dictionary = [[NSUserDefaults standardUserDefaults] objectForKey:@"SavedInformation"];
        [newDict setObject:[dictionary objectForKey:@"amount"] forKey:@"amount"];
        [newDict setValue:[dictionary objectForKey:@"paymentId"] forKey:@"paymentId"];
        [newDict setValue:[dictionary objectForKey:@"paymentName"] forKey:@"paymentName"];
        [newDict setValue:[dictionary objectForKey:@"paymentSecure_thumbnail"] forKey:@"paymentSecure_thumbnail"];
        [newDict setValue:[dictionary objectForKey:@"issuerId"] forKey:@"issuerId"];
        [newDict setValue:[dictionary objectForKey:@"issuerName"] forKey:@"issuerName"];
        [newDict setValue:[dictionary objectForKey:@"issuerSecure_thumbnail"] forKey:@"issuerSecure_thumbnail"];
        [newDict setValue:installmentsDetail.recommended_message forKey:@"recommended_message"];
        [[NSUserDefaults standardUserDefaults] setObject:newDict forKey:@"SavedInformation"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    
@end
