//
//  SearchAnimateView.m
//  GiMiHelper
//
//  Created by user on 15/4/25.
//  Copyright (c) 2015年 Jenury Cheng. All rights reserved.
//

#import "SearchAnimateView.h"

#define RADIUS_DISTANCE     (self.frame.size.width/2.0/4.0)

@interface SearchAnimateView()
{
    NSTimer *_timer;
    NSInteger _count;
}

@end

@implementation SearchAnimateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.backgroundColor = [UIColor clearColor];
}

- (void)animate:(BOOL)animate;
{
    if (animate) {
        if (!_timer) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(reDraw:) userInfo:nil repeats:YES];
        }
    }else
    {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)reDraw:(NSTimer *)t
{
    _count ++;
    _count = _count % (int)RADIUS_DISTANCE;
    [self setNeedsDisplayInRect:self.frame];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawYuan:context];
}

-(void)drawYuan:(CGContextRef)context
{
    //画圆和椭圆
    CGPoint center = self.center;
    float radius0 = RADIUS_DISTANCE*0 + _count;
    float radius1 = RADIUS_DISTANCE*1 + _count;
    float radius2 = RADIUS_DISTANCE*2 + _count;
    float radius3 = RADIUS_DISTANCE*3 + _count;
    
    CGContextSetRGBStrokeColor(context, 255, 100, 100, 0.7 + 0.3*(RADIUS_DISTANCE-_count)/RADIUS_DISTANCE);
    CGContextSetLineWidth(context, 2.0 + 1*_count/RADIUS_DISTANCE);
    CGContextAddEllipseInRect(context, CGRectMake(center.x - radius0, center.y - radius0, 2*radius0, 2*radius0));
    CGContextStrokePath(context);
    
    CGContextSetRGBStrokeColor(context, 255, 100, 100, 0.4 + 0.3*(RADIUS_DISTANCE-_count)/RADIUS_DISTANCE);
    CGContextSetLineWidth(context, 3.0 + 1*_count/RADIUS_DISTANCE);
    CGContextAddEllipseInRect(context, CGRectMake(center.x - radius1, center.y - radius1, 2*radius1, 2*radius1));
    CGContextStrokePath(context);
    
    CGContextSetRGBStrokeColor(context, 255, 100, 100, 0.2 + 0.2*(RADIUS_DISTANCE-_count)/RADIUS_DISTANCE);
    CGContextSetLineWidth(context, 4.0 + 1*_count/RADIUS_DISTANCE);
    CGContextAddEllipseInRect(context, CGRectMake(center.x - radius2, center.y - radius2, 2*radius2, 2*radius2));
    CGContextStrokePath(context);
    
    CGContextSetRGBStrokeColor(context, 255, 100, 100, 0.0 + 0.2*(RADIUS_DISTANCE-_count)/RADIUS_DISTANCE);
    CGContextSetLineWidth(context, 5.0 + 1*_count/RADIUS_DISTANCE);
    CGContextAddEllipseInRect(context, CGRectMake(center.x - radius3, center.y - radius3, 2*radius3, 2*radius3));
    CGContextStrokePath(context);
}


@end
