//
//  Scene.m
//  BallNonStop
//
//  Created by Do Minh Hai on 10/14/15.
//  Copyright (c) 2015 Do Minh Hai. All rights reserved.
//

#import "Scene.h"


@implementation Scene

- (void) loadView {
    [super loadView];
    self.sprites = [NSMutableDictionary new];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) addSprite: (Sprite*) sprite {
    [self.sprites setObject: sprite
                     forKey: sprite.name];
    [self.view addSubview: sprite.view];
}

- (void) removeSprite: (Sprite*) sprite {
    [self.sprites removeObjectForKey:sprite.name];
    [sprite.view removeFromSuperview];
}

- (void) removeSpriteByName:(NSString *)spriteName {
    UIView* removeView = self.sprites[spriteName];
    [removeView removeFromSuperview];
    [self.sprites removeObjectForKey:spriteName];
    
}
@end
