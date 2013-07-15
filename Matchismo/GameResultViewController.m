//
//  GameResultViewController.m
//  Matchismo
//
//  Created by Salman Ansari on 7/14/13.
//  Copyright (c) 2013 Dare To Build. All rights reserved.
//

#import "GameResultViewController.h"

@interface GameResultViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;

@end

@implementation GameResultViewController

- (void)setup
{
    // init that can't wait till viewDidLoad
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}

@end
