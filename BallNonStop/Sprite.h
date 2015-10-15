//
//  Sprite.h
//  BallNonStop
//
//  Created by Do Minh Hai on 10/14/15.
//  Copyright (c) 2015 Do Minh Hai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Scene.h"
@class Scene;

@interface Sprite : NSObject
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, weak) Scene *scene;

- (instancetype) initWithName: (NSString*) name
                      ownView: (UIView*) view
                      inScene: (Scene*) scene;
- (void) animate;
@end
