//
//  InstallmentsVC.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 11/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "InstallmentsVC.h"

@interface InstallmentsVC ()<UITableViewDelegate,UITableViewDataSource>
    
    @property (weak, nonatomic) IBOutlet UILabel *installmentsLabel;
    @property (weak, nonatomic) IBOutlet UITableView *installmentsTV;
    
    @property (nonatomic, strong, readonly) InstallmentsVM *viewModel;

@end

@implementation InstallmentsVC

    - (instancetype)initWithViewModel:(InstallmentsVM *)viewModel{
        
        if (!self) return nil;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData:) name:@"InstallmentsReady" object:nil];
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
        
        self.installmentsTV.dataSource = self;
        self.installmentsTV.delegate = self;
        self.title = [self.viewModel title];
        self.installmentsLabel.text = [self.viewModel installmentsLabelText];
        
    }
    
    - (void)reloadData:(NSNotification *) notification{
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [ProgressHUD dismiss];
            if (notification.object != nil){
                [self presentAlertWithTitle:@"Error" andMessage:notification.object];
                return;
            }
            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
            [self.installmentsTV reloadSections:indexSet withRowAnimation:UITableViewRowAnimationRight];
        });
    }
    
    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
    
#pragma mark - TableViewDataSource
    
    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
        return 1;
    }
    
    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return [self.viewModel numberOfInstallmentsInSection:section];
    }
    
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InstallmentsCell" forIndexPath:indexPath];
        
        UILabel *label = (UILabel*)[cell viewWithTag:2];
        label.text = [self.viewModel recommendedMessageAtIndexPath:indexPath];
        
        return cell;
        
    }
    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 50;
    }
    
#pragma mark - TableViewDelegate
    
    -(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        [self.viewModel selectedInstallmentAtIndexPath:indexPath];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"FinishCycle" object:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
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
