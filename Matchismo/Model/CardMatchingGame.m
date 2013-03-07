//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Marcello Sasaki on 06/03/13.
//  Copyright (c) 2013 Marcello Sasaki. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (strong,nonatomic) NSMutableArray *cards; // of Cards
@property (nonatomic,readwrite) int score;

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if ( !_cards ) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self)
    {
        for (int i = 0; i < count; i++)
        {
            Card * card = [deck drawRandomCard];
            if (!card)
            {
                self = nil;
            }
            else
            {
                self.cards[i] = card;
            }
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST           1
#define MATCH_BONUS         4
#define MISMATCH_PENALTY    2

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card * card = [self cardAtIndex:index];
    
    if (!card.isUnplayable)
    {
        if (!card.isFaceUp)
        {
            for (Card *anotherCard in self.cards)
                if (!anotherCard.isUnplayable && anotherCard.isFaceUp)
                {
                    int matchScore = [card match:@[anotherCard]];
                    if (matchScore)
                    {
                        anotherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    }
                    else
                    {
                        anotherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                }

            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}

@end
