//
//  Deck.h
//  Matchismo
//
//  Created by Marcello Sasaki on 03/03/13.
//  Copyright (c) 2013 Marcello Sasaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard: (Card *)card
          atTop: (BOOL)atTop;

- (Card *)drawRandomCard;

@end
