//
//  CardIssuersVM.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 11/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "CardIssuersVM.h"

@interface CardIssuersVM ()
    
    @property (nonatomic, strong) NSMutableArray<CardIssuer *> *cardIssuers;
    
@end

@implementation CardIssuersVM

    - (instancetype)initCardIssuersWithPaymentMethodId:(NSString *)paymentMethodId{
        self = [super init];
        if (!self) return nil;
        
        CardIssuerNetwork *cardIssuerNetwork =[[CardIssuerNetwork alloc]init];
        
        [cardIssuerNetwork getCardIssuersWithPaymentMethodId:paymentMethodId andCallback:^(NSURLResponse *response, id responseObject, NSError *error) {
            if (error) {
                NSLog(@"Error: %@", error);
                [self sendErrorNotification:error.localizedDescription];
            } else {
                NSArray *jsonObject = [[NSArray alloc] initWithObjects:responseObject, nil];
                if (jsonObject.count > 0){
                    [self fillCardIssuersWithJsonObject:jsonObject];
                }else{
                    [self sendErrorNotification:NSLocalizedString(@"There is no data available","")];
                }
            }
        }];
        return self;
    }
    - (void)sendErrorNotification:(NSString *)error{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CardIssuersReady" object:error];
    }
    
    - (void)fillCardIssuersWithJsonObject: (NSArray*)jsonObject{
        _cardIssuers = [[NSMutableArray alloc]init];
        NSDictionary *dictionary = [[NSDictionary alloc]init];
        NSArray * array = jsonObject[0];
        if (array.count >0){
        for (int i = 0; i < [array count]; i++){
            dictionary = array[i];
            CardIssuer *cardIssuer = [[CardIssuer alloc]initWithDictionary:dictionary];
            [_cardIssuers addObject:cardIssuer];
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CardIssuersReady" object:nil];
        }else{
            [self sendErrorNotification:NSLocalizedString(@"There is no data available","")];
        }
    }
    
    - (NSString *)title{
        return NSLocalizedString(@"Card Issuers", @"");
    }
    
    - (NSString *)cardIssuersLabelText{
        return NSLocalizedString(@"Select a card issuer relative to your selected payment method from the below list.", @"");
    }
    
    - (NSUInteger)numberOfCardIssuersInSection:(NSInteger)section{
        return self.cardIssuers.count;
    }
    - (NSString*)imageAtIndexPath:(NSIndexPath *)indexPath{
        CardIssuer *cardIssuer = [self cardIssuerAtIndexPath:indexPath];
        return cardIssuer.secure_thumbnail;
    }
    
    - (NSString *)nameAtIndexPath:(NSIndexPath *)indexPath{
        CardIssuer *cardIssuer = [self cardIssuerAtIndexPath:indexPath];
        return cardIssuer.name;
    }
    
    - (NSString *)selectedIssuerIdAtIndexPath:(NSIndexPath *)indexPath{
        CardIssuer *cardIssuer = [self cardIssuerAtIndexPath:indexPath];
        [self storeCardIssuer:cardIssuer];
        return cardIssuer.ID;
    }
    
    - (CardIssuer *)cardIssuerAtIndexPath:(NSIndexPath *)indexPath {
        return self.cardIssuers[indexPath.row];
    }
    
    -(void)storeCardIssuer:(CardIssuer *)cardIssuer{
        NSMutableDictionary *newDict = [[NSMutableDictionary alloc]init];
        NSMutableDictionary *dictionary = [[NSUserDefaults standardUserDefaults] objectForKey:@"SavedInformation"];
        [newDict setObject:[dictionary objectForKey:@"amount"] forKey:@"amount"];
        [newDict setValue:[dictionary objectForKey:@"paymentId"] forKey:@"paymentId"];
        [newDict setValue:[dictionary objectForKey:@"paymentName"] forKey:@"paymentName"];
        [newDict setValue:[dictionary objectForKey:@"paymentSecure_thumbnail"] forKey:@"paymentSecure_thumbnail"];
        [newDict setValue:cardIssuer.ID forKey:@"issuerId"];
        [newDict setValue:cardIssuer.name forKey:@"issuerName"];
        [newDict setValue:cardIssuer.secure_thumbnail forKey:@"issuerSecure_thumbnail"];
        [[NSUserDefaults standardUserDefaults] setObject:newDict forKey:@"SavedInformation"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    - (NSString *)getValue:(NSString *)amount{
        NSString *val = @"";
        if ([amount containsString:@"."]){
            val = [amount stringByReplacingOccurrencesOfString:@"." withString:@""];
        }else{
            val = [amount stringByReplacingOccurrencesOfString:@"," withString:@""];
        }
        return val;
    }
    
@end
