//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Marcello Sasaki on 06/03/13.
//  Copyright (c) 2013 Marcello Sasaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSInteger)cardCount
              usingDeck:(Deck *)deck;

- (NSString *)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly) int score;

@end
