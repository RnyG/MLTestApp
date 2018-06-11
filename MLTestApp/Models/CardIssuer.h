//
//  CardIssuer.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 9/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardIssuer : NSObject

    - (instancetype)initWithDictionary:(NSDictionary*)dictionary;
    
    @property (nonatomic, copy, readonly) NSString *ID;
    @property (nonatomic, copy, readonly) NSString *name;
    @property (nonatomic, copy, readonly) NSString *secure_thumbnail;
    @property (nonatomic, copy, readonly) NSString *thumbnail;
    @property (nonatomic, copy, readonly) NSString *processing_mode;
    @property (nonatomic, copy, readonly) NSString *merchant_account_id;
    
@end
