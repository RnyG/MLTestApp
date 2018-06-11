//
//  SecurityCode.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecurityCode : NSObject

    @property (nonatomic, copy, readonly) NSString *mode;
    @property (nonatomic, copy, readonly) NSString *card_location;
    @property (nonatomic, copy, readonly) NSNumber *lenght;
    
@end
