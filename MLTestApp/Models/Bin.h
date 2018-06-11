//
//  Bin.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bin : NSObject

    @property (nonatomic, copy, readonly) NSString *pattern;
    @property (nonatomic, copy, readonly) NSString *installments_pattern;
    @property (nonatomic, copy, readonly) NSString *exclusion_pattern;
    
@end
