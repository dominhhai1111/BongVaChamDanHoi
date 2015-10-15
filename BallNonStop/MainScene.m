//
//  MainScene.m
//  BallNonStop
//
//  Created by Do Minh Hai on 10/14/15.
//  Copyright (c) 2015 Do Minh Hai. All rights reserved.
//

#import "MainScene.h"
#import "Ball.h"
#import "Khung.h"
@interface MainScene ()

@end

@implementation MainScene
{
    Ball* ball  ;
    Khung* khung;
    CGFloat x1, //hoanh do diem 1
            x2, //hoanh do diem 2
            y1, // tung do diem 1
            y2, // tung do diem 2
            a , // he so goc a
            b , // he so b
            y , // tung do diem bien thien
            x , // hoanh do diem bien then
            leTrenKung ,
            leDuoiKhung,
            leTraiKhung,
            lePhaiKhung,
            banKinhBall;
    bool daoHuong  ;
    NSTimer* timer ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.size = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height) ;
    x1 = self.size.width/2;
    y1 = self.size.height/2;
    x2 = arc4random()%600;
    y2 = arc4random()%600;
    banKinhBall = 24;
    [self addKhung];
    [self addBall];
    NSLog(@"%f", self.view.bounds.size.height);
    NSLog(@"%f", self.view.bounds.size.width);
    x= x1;
    y= y1;
    leDuoiKhung = 11.27+ (self.size.height-320)/2;
    leTrenKung = 33.9+(self.size.height-320)/2;
    lePhaiKhung = 27.4+(self.size.width-427)/2;
    leTraiKhung =27.4+(self.size.width-427)/2;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.00888
                                             target:self
                                           selector:@selector(computePositionBall)
                                           userInfo:nil
                                            repeats:true];
}
-(void) addBall
{
    UIImage* ballPicture = [UIImage imageNamed:@"Soccer"];
    ball = [[Ball alloc] initWithName: @"ball"
                              ownView: [[UIImageView alloc] initWithImage:ballPicture]
                              inScene: self];
    ball.view.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2 );
    [self.view addSubview:ball.view];
    }
-(void) addKhung
{
    UIImage* khungPicture = [UIImage imageNamed:@"khung1"];
    khung = [[Khung alloc] initWithName: @"khung1"
                              ownView: [[UIImageView alloc] initWithImage:khungPicture]
                              inScene: self];
    khung.view.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2 );
    [self.view addSubview:khung.view];
}
-(void) computePositionBall
{
   
    
    a = (y2-y1)/(x2 - x1);
    b = y1 - a*x1;
    if (daoHuong ==YES) {
        x += 3;
    }else{
        x -= 3;
    }
    y =a*x+ b;
    ball.view.center = CGPointMake(x, y)  ;
    if ((y> self.size.height-banKinhBall-leDuoiKhung || y<banKinhBall+leTrenKung)
        && (x > self.size.width-banKinhBall-lePhaiKhung || x<banKinhBall+leTraiKhung)) {
        daoHuong = !daoHuong;
        y2 = y1 ;
        x2 = x1 ;
        y1 = y ;
        x1 = x ;
    }else {
               if (y> self.size.height-banKinhBall-leDuoiKhung || y<banKinhBall+leTrenKung) {
                if ( x - x1 > 0) {
                    daoHuong = YES;
                }else{
                    daoHuong = NO;
                }
                y2 = y1;
                x2 = 2*x - x1;
                y1 = y;
                x1 = x;
            }
            if (x > self.size.width-banKinhBall-lePhaiKhung || x<banKinhBall+leTraiKhung)  {
                if ( x2 - x1 > 0) {
                    daoHuong = YES;
                }else{
                    daoHuong = NO;
                }
                x2 = x1;
                y2 = 2*y - y1;
                y1 = y;
                x1 = x;
            }
    }
}
@end
