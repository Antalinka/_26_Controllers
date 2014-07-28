//
//  GRViewController.h
//  _26_ControllsTest
//
//  Created by Exo-terminal on 6/4/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UISlider *redComponentSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenComponentSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueComponentSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSchemeControl;

- (IBAction)actionSlider:(UISlider *)sender;
- (IBAction)actionEnabled:(UISwitch *)sender;

@end
