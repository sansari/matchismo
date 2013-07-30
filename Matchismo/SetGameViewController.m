//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Salman Ansari on 6/21/13.
//  Copyright (c) 2013 Dare To Build. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"
#import "SetMatchingGame.h"
#import "SetCard.h"

@interface SetGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *gameStatus;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) SetMatchingGame *game;
@end

@implementation SetGameViewController

- (SetMatchingGame *)game
{
    
    if (!_game) _game = [[SetMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                          usingDeck:[[SetCardDeck alloc] init]];
    return _game;
}

- (void)setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;
}

- (void)updateUI {
    
    for (UIButton *cardButton in self.cardButtons) {
        SetCard *card = (SetCard*)[self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];

        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;

        NSUInteger number = [card.number integerValue];
        NSString *displayValue = [@"" stringByPaddingToLength:[card.number integerValue] withString:card.symbol startingAtIndex:0];

        NSRange range = NSMakeRange(0, number);

        NSMutableAttributedString *face = [[NSMutableAttributedString alloc] initWithString:displayValue];
        [face addAttributes:@{
            NSForegroundColorAttributeName: card.color,
            NSFontAttributeName: [UIFont systemFontOfSize:13]
         } range:range];
        
        if ([card.shading isEqualToString:@"striped"]) {
            [face addAttributes:@{
     NSStrokeWidthAttributeName: @-3,
     NSStrokeColorAttributeName: [card.color colorWithAlphaComponent:0.8],
 NSForegroundColorAttributeName: [card.color colorWithAlphaComponent:0.3]}
                          range:range];
        } else if ([card.shading isEqualToString:@"open"]) {
            [face addAttributes:@{NSStrokeWidthAttributeName: @5,
                                  NSStrokeColorAttributeName: card.color}
                  range:range];
        }

        if (cardButton.selected) {
            cardButton.backgroundColor = [UIColor lightGrayColor];
        } else {
            cardButton.backgroundColor = [UIColor whiteColor];
        }

        if (!cardButton.enabled) {
            cardButton.alpha = 0;
        } else {
            cardButton.alpha = 1;
        }

        [cardButton setAttributedTitle:face forState:UIControlStateNormal];
        [cardButton setAttributedTitle:face forState:UIControlStateSelected];
        [cardButton setAttributedTitle:face forState:UIControlStateNormal|UIControlStateDisabled];
    }

    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.gameStatus.text = self.game.status;
}


@end