//
//  GRViewController.m
//  _26_Controllers
//
//  Created by Exo-terminal on 6/5/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRViewController.h"

@interface GRViewController ()

@end
typedef enum{
    MonsterOne,
    MonsterTwo,
    MonsterThree
    
}Monster;

@implementation GRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView* imgView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.imageMonster.frame)-50,
                                                                        CGRectGetMidY(self.imageMonster.frame)-50,
                                                                        100 , 100)];
    
    imgView.image = [UIImage imageNamed:@"monster4.png"];
    
    self.imageMonster = imgView;
    
    [self.view addSubview:self.imageMonster];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Action -

- (IBAction)actionValueChanged:(id)sender {
    
      [self startAnimation];
}

- (IBAction)replaceImage:(id)sender {
    
    switch (self.monstersList.selectedSegmentIndex) {
        case MonsterOne:
            self.imageMonster.image = [UIImage imageNamed:@"monster4.png"];
            break;
        case MonsterTwo:
            self.imageMonster.image = [UIImage imageNamed:@"monster5.png"];
            break;
        case MonsterThree:
            self.imageMonster.image = [UIImage imageNamed:@"moster6.png"];
            break;
            
            
        default:
            break;
    }
}

- (IBAction)actionTransformation:(id)sender {
    
    [self startAnimation];
}



#pragma mark - Animation image -


-(void)startAnimation{
    
    if (self.rotateSlider.isOn) {
        [self rotateImage];
    }else{
        [self.imageMonster.layer removeAnimationForKey:@"rotate"];
    }
    if (self.scaleSlider.isOn) {
        [self scaleImage];
    }else{
        [self.imageMonster.layer removeAnimationForKey:@"scale"];
    }
    
    if (self.moveSlider.isOn) {
        [self moveImage];
    }else{
        CGPoint point = CGPointMake(CGRectGetMidX([[self.imageMonster.layer presentationLayer] frame]),
                                    CGRectGetMidY([[self.imageMonster.layer presentationLayer] frame]));
        self.imageMonster.center = point;
        
        [self.imageMonster.layer removeAnimationForKey:@"move"];
    }
    
}


#pragma mark - Transform -

-(void)rotateImage{

     CABasicAnimation *rotationAnimation;
     rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
     rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2];
     rotationAnimation.duration = self.slider.value;
     rotationAnimation.repeatCount = HUGE_VALF;
    
     [self.imageMonster.layer addAnimation:rotationAnimation forKey:@"rotate"];

}

-(void)scaleImage{
    
    CABasicAnimation *scaleAnimation;
    scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.5];
    scaleAnimation.duration = self.slider.value;
    scaleAnimation.repeatCount = HUGE_VALF;
    scaleAnimation.autoreverses = YES;
    
    [self.imageMonster.layer addAnimation:scaleAnimation forKey:@"scale"];

}

-(void)moveImage{
    
    CGPoint point = CGPointMake(CGRectGetMidX([[self.imageMonster.layer presentationLayer] frame]),
                                CGRectGetMidY([[self.imageMonster.layer presentationLayer] frame]));
    self.imageMonster.center = point;
    
    int width = (CGRectGetMaxX(self.view.bounds)) - 100;
    int x = (arc4random()%width) + 50;
    
    int height = (CGRectGetMaxY(self.view.bounds))/2;
    int y = arc4random()%height;
    
    CGPoint moveToPoint = CGPointMake(x, y);
    
    CABasicAnimation *moveAnimation;
    moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAFilterLinear];
    
    moveAnimation.fromValue = [NSValue valueWithCGPoint: point];
    moveAnimation.toValue = [NSValue valueWithCGPoint:moveToPoint];
    moveAnimation.duration = self.slider.value;
    moveAnimation.autoreverses = YES;
    moveAnimation.repeatCount = HUGE_VAL;
    
    [self.imageMonster.layer addAnimation:moveAnimation forKey:@"move"];
    
  
  
}

@end



























