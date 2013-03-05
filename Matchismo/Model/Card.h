//
//  Card.h
//  Matchismo
//
//  Created by Marcello Sasaki on 03/03/13.
//  Copyright (c) 2013 Marcello Sasaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString * contents;

@property (nonatomic, getter = isFaseUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;

- (int)match: (NSArray *)otherCards;

@end
