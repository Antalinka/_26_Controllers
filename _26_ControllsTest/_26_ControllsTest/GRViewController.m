//
//  GRViewController.m
//  _26_ControllsTest
//
//  Created by Exo-terminal on 6/4/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRViewController.h"

@interface GRViewController ()

@end

typedef enum{
    ColorSchemeTypeRGB,
    ColorSchemeTypeHSV
}ColorSchemeType;

@implementation GRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self refreshScreen];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Privat Method -

-(void) refreshScreen{
    
    CGFloat red = self.redComponentSlider.value;
    CGFloat green = self.greenComponentSlider.value;
    CGFloat blue = self.blueComponentSlider.value;
    
    
    
    UIColor* color = nil;
    
    if (self.colorSchemeControl.selectedSegmentIndex == ColorSchemeTypeRGB) {
        color = [UIColor colorWithRed:red green:green blue:blue alpha:1];

    }else{
        
        color = [UIColor colorWithHue:red saturation:green brightness:blue alpha:1];
    }
    
    CGFloat hue,saturation,brigtness, alpha;
    
    NSString* result = @"";
    
    if ([color getRed:&red green:&green blue:&blue alpha:&alpha]) {
        
        result = [result stringByAppendingFormat:@"\tRGB:{%.2f %.2f %.2f }", red, green, blue];
    }else{
        result = [result stringByAppendingFormat:@"RGB no data"];
    }
    
    if ([color getHue:&hue saturation:&saturation brightness:&brigtness alpha:&alpha]) {
        
        result = [result stringByAppendingFormat:@"\tHSV:{%.2f %.2f %.2f }", hue, saturation, brigtness];
    }else{
        result = [result stringByAppendingFormat:@"HSV no data"];
    }
    
    
    self.infoLabel.text = result;
    
    self.view.backgroundColor = color;
}


#pragma mark - Action -

- (IBAction)actionSlider:(UISlider *)sender {
    
    [self refreshScreen];
}

- (IBAction)actionEnabled:(UISwitch *)sender {
    
    self.redComponentSlider.enabled =
    self.greenComponentSlider.enabled =
    self.blueComponentSlider.enabled = sender.isOn;
    
    /*[[UIApplication sharedApplication]beginIgnoringInteractionEvents];
    
    double delayInSeconds = 0.2;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([[UIApplication sharedApplication]isIgnoringInteractionEvents]) {
            [[UIApplication sharedApplication]endIgnoringInteractionEvents];
        }
    });*/
    
    
    
}

@end
