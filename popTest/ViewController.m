//
//  ViewController.m
//  popTest
//
//  Created by Akring on 15/4/17.
//  Copyright (c) 2015年 Akring. All rights reserved.
//

#import "ViewController.h"
#import <MMTweenAnimation.h>
#import <CSNotificationView.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [CSNotificationView showInViewController:self
                                       style:CSNotificationViewStyleSuccess
                                     message:@"Great, it works."];
}
- (IBAction)clicked:(id)sender {
    
    MMTweenAnimation *anim = [MMTweenAnimation animation];
    anim.functionType   = MMTweenFunctionBounce;
    anim.easingType     = MMTweenEasingOut;
    anim.duration       = 2.0f;
    anim.fromValue      = 0;
    anim.toValue        = 200;
    anim.animationBlock = ^(double c,double d,double v,id target,MMTweenAnimation *animation)
    {
        //c: current time, from the beginning of animation
        //d: duration, always bigger than c
        //v: value, after the change at current time
        
        UIButton *t = (UIButton*)target;
        
        _button.center = CGPointMake(t.frame.origin.x, v);
    };
    
    [_button pop_addAnimation:anim forKey:@"center.y"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
