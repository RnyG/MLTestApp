//
//  AmountVC.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "AmountVC.h"
#import "PaymentMethodsVC.h"

@interface AmountVC ()<UITextFieldDelegate>

    @property (weak, nonatomic) IBOutlet UILabel *amountLabel;
    @property (weak, nonatomic) IBOutlet UITextField *amountTF;

    @property (nonatomic, strong, readonly) AmountVM *viewModel;
    
    
@end

@implementation AmountVC

    BOOL finish = NO;
    
    - (instancetype)initWithViewModel:(AmountVM *)viewModel{
        if (!self) return nil;
        
        _viewModel = viewModel;
        
        return self;
    }
    
    - (void)viewDidLoad {
        
        [super viewDidLoad];
        // Do any additional setup after loading the view.
        [self configure];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishCycle:) name:@"FinishCycle" object:nil];
    }
    - (void)finishCycle:(NSNotification *) notification{
        finish = YES;
    }

    - (void)configure{
        
        AmountVM *amountVM = [[AmountVM alloc] init];
        _viewModel = amountVM;
        self.title = [self.viewModel title];
        self.amountLabel.text = [self.viewModel amountLabelText];
        [self.amountTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
    - (void)viewWillAppear:(BOOL)animated{
        
        [super viewWillAppear:animated];
        if (finish){
            self.amountTF.text = @"";
            [self presentAlertWithTitle:@"Succesful" andMessage:[self.viewModel getAllData]];
        }else{
        [self.amountTF becomeFirstResponder];
        }
        
    }
    - (void)textFieldDidChange:(UITextField *)textField {
    
        textField.text = [self.viewModel numericFormatWithString:textField.text];
        
    }
    
    - (IBAction)done:(id)sender{
        if ([self.viewModel validAmount:self.amountTF.text]){
            [self.viewModel storeAmount:self.amountTF.text];
            [self performSegueWithIdentifier:@"SeguePaymentMethods" sender:nil];
        }else{
            [self presentAlertWithTitle:@"Alert"andMessage:@"You must type a valid amount."];
        }
    }
    - (void)presentAlertWithTitle:(NSString *)title andMessage:(NSString *)message{
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(title,@"") message:NSLocalizedString(message, @"") preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
            [alert dismissViewControllerAnimated:YES completion:nil];
            [self.amountTF becomeFirstResponder];
        }];
        [alert addAction:okAction];
        [self presentViewController:alert animated:true completion:nil];
        
    }
    - (void)viewWillDisappear:(BOOL)animated{
        
        [super viewWillDisappear:animated];
        [self.view endEditing:YES];
        
    }
    - (void)didReceiveMemoryWarning {
        
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"SeguePaymentMethods"]){
    PaymentMethodsVM* paymentMethodsVM = [[PaymentMethodsVM alloc]initWithPaymentMethods];
    PaymentMethodsVC* paymentMethodsVC = [segue destinationViewController];
    paymentMethodsVC = [paymentMethodsVC initWithViewModel:paymentMethodsVM];
    }
}

@end
