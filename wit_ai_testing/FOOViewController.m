//
//  FOOViewController.m
//  wit_ai_testing
//
//  Created by Peter Alderson on 4/9/14.
//  Copyright (c) 2014 Something. All rights reserved.
//

#import "FOOViewController.h"

@interface FOOViewController ()

@end

@implementation FOOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set the WitDelegate object
    [Wit sharedInstance].delegate = self;
    
    // create the button
    CGRect screen = [UIScreen mainScreen].bounds;
    CGFloat w = 100;
    CGRect rect = CGRectMake(screen.size.width/2 - w/2, 60, w, 100);
    
    WITMicButton* witButton = [[WITMicButton alloc] initWithFrame:rect];
    [self.view addSubview:witButton];
    
    // create the label
    labelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, screen.size.width, 50)];
    [self.view addSubview:labelView];
}

- (void)witDidGraspIntent:(NSString *)intent entities:(NSDictionary *)entities body:(NSString *)body error:(NSError *)e {
    if (e) {
        NSLog(@"[Wit] error: %@", [e localizedDescription]);
        return;
    }
    
    labelView = [NSString stringWithFormat:@"intent = %@", intent];
    
    [self.view addSubview:labelView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
