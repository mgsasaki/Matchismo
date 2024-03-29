//
//  PlayingCard.m
//  Matchismo
//
//  Created by Marcello Sasaki on 04/03/13.
//  Copyright (c) 2013 Marcello Sasaki. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (PlayingCard *anotherCard in otherCards)
    {
        if ([anotherCard.suit isEqualToString:self.suit]) {
            score += 1;
        }
        else if (anotherCard.rank == self.rank)
        {
            score += 4;
        }
    }
    
//    if (otherCards.count == 1)
//    {
//        PlayingCard *anotherCard = [otherCards lastObject];
//        if ([anotherCard.suit isEqualToString:self.suit])
//            score = 1;
//        else if (anotherCard.rank == self.rank)
//            score = 4;
//    }
    
    return score;
}

- (NSString *)contents
{
    NSArray * rankStrings = [PlayingCard rankStrings];
    
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)validSuits
{
    return @[@"♠",@"♦",@"♣",@"♥"];
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank
{
    return [self rankStrings].count - 1;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}

@end
