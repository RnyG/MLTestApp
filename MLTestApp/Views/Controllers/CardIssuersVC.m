//
//  CardIssuersVC.m
//  MLTestApp
//
//  Created by Rhonny Gonzalez on 11/6/18.
//  Copyright © 2018 Rhonny Gonzalez. All rights reserved.
//

#import "CardIssuersVC.h"
#import "InstallmentsVC.h"

@interface CardIssuersVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

    @property (weak, nonatomic) IBOutlet UILabel *cardIssuersLabel;
    @property (weak, nonatomic) IBOutlet UICollectionView *cardIssuersCV;
    
    @property (nonatomic, strong, readonly) CardIssuersVM *viewModel;

    
@end

@implementation CardIssuersVC
    
    - (instancetype)initWithViewModel:(CardIssuersVM *)viewModel{
        
        if (!self) return nil;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData:) name:@"CardIssuersReady" object:nil];
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
        
        self.cardIssuersCV.dataSource = self;
        self.cardIssuersCV.delegate = self;
        self.title = [self.viewModel title];
        self.cardIssuersLabel.text = [self.viewModel cardIssuersLabelText];
        
    }
    
    - (void)reloadData:(NSNotification *) notification{
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [ProgressHUD dismiss];
            if (notification.object != nil){
                [self presentAlertWithTitle:@"Error" andMessage:notification.object];
                return;
            }
            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];

            [self.cardIssuersCV performBatchUpdates:^{
                [self.cardIssuersCV reloadSections:indexSet];
            } completion:^(BOOL finished) {}];
        });
    }


    
    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSDictionary * dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"SavedInformation"];
    if ([segue.identifier  isEqual: @"SegueInstallments"]){

    InstallmentsVM* installmentsVM = [[InstallmentsVM alloc]initInstallmentsWithAmount:[self.viewModel getValue:[dict objectForKey:@"amount"]] paymentMethodId:[dict objectForKey:@"paymentId"] andIssuerId:[dict objectForKey:@"issuerId"]];
    InstallmentsVC* installmentsVC = [segue destinationViewController];
    installmentsVC = [installmentsVC initWithViewModel:installmentsVM];
    }
}


#pragma mark - CollectionViewDataSource
    
    - (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
        return 1;
    }
    - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
        return [self.viewModel numberOfCardIssuersInSection:section];
    }
    - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
        UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CardIssuersCell" forIndexPath:indexPath];
        UIImageView *imageView = (UIImageView*)[cell viewWithTag:1];
        UILabel *label = (UILabel*)[cell viewWithTag:2];
        imageView.contentMode = UIViewContentModeCenter;
        [imageView setImageWithURL:[NSURL URLWithString:[self.viewModel imageAtIndexPath:indexPath]]];
        label.text = [self.viewModel nameAtIndexPath:indexPath];
        cell.layer.borderColor = [UIColor colorWithRed:45/255 green:50/255 blue:119/255 alpha:1.0].CGColor;
        return cell;
    }
    -(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
    {
        CGFloat size = ((self.view.frame.size.width / 3) - 20);
        return  CGSizeMake(size,size) ;
    }
    
#pragma mark - CollectionViewDelegate
    
    - (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
        [self performSegueWithIdentifier:@"SegueInstallments" sender:[self.viewModel selectedIssuerIdAtIndexPath:indexPath]];
        
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
