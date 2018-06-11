//
//  PaymentMethodsVC.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 10/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "PaymentMethodsVC.h"
#import "CardIssuersVC.h"

@interface PaymentMethodsVC ()<UITableViewDataSource,UITableViewDelegate>

    @property (weak, nonatomic) IBOutlet UILabel *selectMessageLabel;
    @property (weak, nonatomic) IBOutlet UITableView *paymentMethodsTV;
    
    @property (nonatomic, strong, readonly) PaymentMethodsVM *viewModel;

@end

@implementation PaymentMethodsVC
    
    - (instancetype)initWithViewModel:(PaymentMethodsVM *)viewModel{
        
        if (!self) return nil;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData:) name:@"PaymentMethodsReady" object:nil];
        _viewModel = viewModel;
        [ProgressHUD show:NSLocalizedString(@"Loading",@"") Interaction:NO];
        return self;
    }
    
    
    - (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
        [self configure];
    }
    
    - (void)configure{
    
        self.paymentMethodsTV.dataSource = self;
        self.paymentMethodsTV.delegate = self;
        self.title = [self.viewModel title];
        self.selectMessageLabel.text = [self.viewModel paymentMethodsLabelText];
        
    }

    - (void)reloadData:(NSNotification *) notification{
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [ProgressHUD dismiss];
            if (notification.object != nil){
                [self presentAlertWithTitle:@"Error" andMessage:notification.object];
                return;
            }
            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
            [self.paymentMethodsTV reloadSections:indexSet withRowAnimation:UITableViewRowAnimationRight];
        });
    }
    
    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"SegueCardIssuers"]){
    CardIssuersVM* cardIssuersVM = [[CardIssuersVM alloc]initCardIssuersWithPaymentMethodId:sender];
    CardIssuersVC* cardIssuersVC = [segue destinationViewController];
    cardIssuersVC = [cardIssuersVC initWithViewModel:cardIssuersVM];
    }
}
    

    
#pragma mark - TableViewDataSource
    
    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
        return 1;
    }
    
    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return [self.viewModel numberOfPaymentMethodsInSection:section];
    }
    
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PaymentMethodsCell" forIndexPath:indexPath];
        UIImageView *imageView = (UIImageView*)[cell viewWithTag:1];
        UILabel *label = (UILabel*)[cell viewWithTag:2];
        imageView.contentMode = UIViewContentModeCenter;
        [imageView setImageWithURL:[NSURL URLWithString:[self.viewModel imageAtIndexPath:indexPath]]];
        label.text = [self.viewModel nameAtIndexPath:indexPath];
        
        return cell;
        
    }
    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 50;
    }
    
#pragma mark - TableViewDelegate
    
    -(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        [self performSegueWithIdentifier:@"SegueCardIssuers" sender:[self.viewModel selectedPaymentIdAtIndexPath:indexPath]];
    }
    
    
    - (void)presentAlertWithTitle:(NSString *)title andMessage:(NSString *)message{

        UIAlertController* alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(title,@"") message:NSLocalizedString(message, @"") preferredStyle:UIAlertControllerStyleAlert];
            
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                [self.navigationController popViewControllerAnimated:YES];
        }];
        [alert addAction:okAction];
        [self presentViewController:alert animated:true completion:nil];
    }
    
@end


