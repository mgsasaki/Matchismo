//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Marcello Sasaki on 03/03/13.
//  Copyright (c) 2013 Marcello Sasaki. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck * deck;
@end

@implementation CardGameViewController

- (Deck *)deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    
    return _deck;
}

- (void)setFlipCount: (int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flips updated to %d", self.flipCount);
}

- (IBAction)flipCard:(UIButton *)sender
{
    if (!sender.isSelected)
    {
        Card * card = [self.deck drawRandomCard];
        
        [sender setTitle: card.contents forState: UIControlStateSelected];
        
        sender.selected = YES;
    }
    else
    {
        sender.selected = NO;
    }
    self.flipCount++;
}

@end
