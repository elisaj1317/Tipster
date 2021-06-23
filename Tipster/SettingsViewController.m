//
//  SettingsViewController.m
//  Tipster
//
//  Created by Elisa Jacobo Arill on 6/22/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)updateDefault:(id)sender {
    double tipPercentages[] = {0.10, 0.15, 0.20};
    double tipPercentage = tipPercentages[self.tipControl.selectedSegmentIndex];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:tipPercentage forKey:@"default_tip_percentage"];
    [defaults synchronize];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double defaultTip = [defaults doubleForKey:@"default_tip_percentage"];
    
    double tipPercentages[] = {0.10, 0.15, 0.20};
    
    for (int i = 0; i <= sizeof(tipPercentages); i += 1) {
        if (tipPercentages[i] == defaultTip) {
            self.tipControl.selectedSegmentIndex = i;
        }
    }
    
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
