//
//  InstallmentsVC.h
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 11/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstallmentsVM.h"
#import "ProgressHUD.h"

@interface InstallmentsVC : UIViewController

    - (instancetype)initWithViewModel:(InstallmentsVM *)viewModel;

    
@end
