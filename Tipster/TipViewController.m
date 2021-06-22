//
//  TipViewController.m
//  Tipster
//
//  Created by Elisa Jacobo Arill on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [self hideLabels];
    [self changeColorOriginal];
}

- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    
    [self.view endEditing:true];
}

- (IBAction)updateLabels:(id)sender {
    [self changeColorTip];
    if (self.labelsContainerView.alpha == 0) {
        [self showLabels];
    }
    
    if (self.billField.text.length == 0) {
        [self hideLabels];
        [self changeColorOriginal];
    }
    
    
    
    
    double tipPercentages[] = {0.10, 0.15, 0.20};
    double tipPercentage = tipPercentages[self.tipPercentControl.selectedSegmentIndex];
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (void)hideLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billField.frame;
        billFrame.origin.y += 200;
        
        self.billField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y += 200;
        
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 0;
    }];
    
}

- (void)changeColorOriginal {
    self.backgroundView.backgroundColor = [UIColor
                                           colorWithRed: 0.69
                                           green: 0.93
                                           blue: 0.93
                                           alpha: 1.0];
}

- (void)changeColorTip {
    // change color to red
    if (self.tipPercentControl.selectedSegmentIndex == 0) {
        self.backgroundView.backgroundColor = [UIColor
                                               colorWithRed: 1.0
                                               green: 0.8
                                               blue: 0.8
                                               alpha: 1.0];
    }
    // change color to green
    else {
        self.backgroundView.backgroundColor = [UIColor
                                               colorWithRed: 0.60
                                               green: 1.0
                                               blue: 0.60
                                               alpha: 1.0];
        
    }
}

- (void)showLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billField.frame;
        billFrame.origin.y -= 200;
        
        self.billField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y -= 200;
        
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 1;
    }];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
