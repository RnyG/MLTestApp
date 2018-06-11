//
//  PaymentMethodsVC.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentMethodsVM.h"
#import "ProgressHUD.h"

@interface PaymentMethodsVC : UIViewController

- (instancetype)initWithViewModel:(PaymentMethodsVM *)viewModel;

@end
