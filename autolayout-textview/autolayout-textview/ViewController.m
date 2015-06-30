//
//  ViewController.m
//  autolayout-textview
//
//  Created by Yoseob Lee on 6/29/15.
//  Copyright (c) 2015 Yoseob Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textFieldView;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) NSLayoutConstraint *textFieldViewBottom;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.view.constraints];
    self.textFieldView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.textFieldView removeConstraints:self.textFieldView.constraints];
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rightButton removeConstraints:self.rightButton.constraints];
    self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.leftButton removeConstraints:self.leftButton.constraints];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(deviceOrientationDidChangeNotification:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    NSLayoutConstraint *textFieldViewLeft = [NSLayoutConstraint constraintWithItem:self.textFieldView
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeLeft
                                                                 multiplier:1
                                                                   constant:10];
    [self.view addConstraint:textFieldViewLeft];
    
    NSLayoutConstraint *textFieldViewRight = [NSLayoutConstraint constraintWithItem:self.textFieldView
                                                                      attribute:NSLayoutAttributeRight
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.view
                                                                      attribute:NSLayoutAttributeRight
                                                                     multiplier:1
                                                                       constant:-10];
    [self.view addConstraint:textFieldViewRight];
    
    NSLayoutConstraint *textFieldViewTop = [NSLayoutConstraint constraintWithItem:self.textFieldView
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1
                                                                   constant:20];
    [self.view addConstraint:textFieldViewTop];
    
    self.textFieldViewBottom = [NSLayoutConstraint constraintWithItem:self.textFieldView
                                                                      attribute:NSLayoutAttributeBottom
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.rightButton
                                                                      attribute:NSLayoutAttributeTop
                                                                     multiplier:1
                                                                       constant:-20];
    [self.view addConstraint:self.textFieldViewBottom];
    
    NSLayoutConstraint *rightButtonX = [NSLayoutConstraint constraintWithItem:self.rightButton
                                                                   attribute:NSLayoutAttributeRight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1
                                                                    constant:-10];
    [self.view addConstraint:rightButtonX];
    
    NSLayoutConstraint *rightButtonY = [NSLayoutConstraint constraintWithItem:self.rightButton
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:-10];
    [self.view addConstraint:rightButtonY];
    
    NSLayoutConstraint *leftButtonX = [NSLayoutConstraint constraintWithItem:self.leftButton
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:10];
    [self.view addConstraint:leftButtonX];
    
    NSLayoutConstraint *leftButtonY = [NSLayoutConstraint constraintWithItem:self.leftButton
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1
                                                                    constant:-10];
    [self.view addConstraint:leftButtonY];
    
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (void)deviceOrientationDidChangeNotification:(NSNotification*)note
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if (orientation == UIDeviceOrientationPortrait)
    {
        [self.view removeConstraints:@[self.textFieldViewBottom]];
        
        self.textFieldViewBottom = [NSLayoutConstraint constraintWithItem:self.textFieldView
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.rightButton
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1
                                                                 constant:-20];
        [self.view addConstraint:self.textFieldViewBottom];
        
    }
    else if (orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight)
    {
        [self.view removeConstraints:@[self.textFieldViewBottom]];
        
        self.textFieldViewBottom = [NSLayoutConstraint constraintWithItem:self.textFieldView
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.rightButton
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1
                                                                 constant:-10];
        [self.view addConstraint:self.textFieldViewBottom];
    }
}

@end
