//
//  CardIssuersVC.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 11/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardIssuersVM.h"
#import "ProgressHUD.h"

@interface CardIssuersVC : UIViewController

    - (instancetype)initWithViewModel:(CardIssuersVM *)viewModel;
    
@end
