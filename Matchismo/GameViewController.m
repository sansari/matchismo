//
//  GameViewController.m
//  Matchismo
//
//  Created by Salman Ansari on 7/30/13.
//  Copyright (c) 2013 Dare To Build. All rights reserved.
//

#import "MatchingGame.h"
#import "GameViewController.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *gameStatus;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) MatchingGame *game;
@end

@implementation GameViewController

- (void)viewDidLoad {
    [self updateUI];
}

- (void)updateUI {
    return;
}

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)dealButton:(id)sender {
    self.game = nil;
    self.flipCount = 0;
    [self updateUI];
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

@end
