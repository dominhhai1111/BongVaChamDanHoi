//
//  Scene.h
//  BallNonStop
//
//  Created by Do Minh Hai on 10/14/15.
//  Copyright (c) 2015 Do Minh Hai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sprite.h"

@class Sprite; //Forward class declaration

@interface Scene : UIViewController
@property(nonatomic, strong) NSMutableDictionary *sprites;
@property(nonatomic, assign) CGSize size;

- (void) addSprite: (Sprite*) sprite;

- (void) removeSprite: (Sprite*) sprite;

- (void) removeSpriteByName: (NSString*) spriteName;
@end

