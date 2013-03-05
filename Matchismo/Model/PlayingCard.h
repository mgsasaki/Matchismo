//
//  PlayingCard.h
//  Matchismo
//
//  Created by Marcello Sasaki on 04/03/13.
//  Copyright (c) 2013 Marcello Sasaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString  * suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
