//
//  GRViewController.h
//  _26_Controllers
//
//  Created by Exo-terminal on 6/5/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRViewController : UIViewController
@property (assign, nonatomic) CGPoint newPosition;
@property (weak, nonatomic) IBOutlet UIImageView *imageMonster;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISwitch *rotateSlider;
@property (weak, nonatomic) IBOutlet UISwitch *scaleSlider;
@property (weak, nonatomic) IBOutlet UISwitch *moveSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *monstersList;

- (IBAction)actionValueChanged:(id)sender;
- (IBAction)replaceImage:(id)sender;
- (IBAction)actionTransformation:(id)sender;


@end
