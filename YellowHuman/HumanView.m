//
//  HumanView.m
//  YellowHuman
//
//  Created by 浩哥哥 on 2017/6/1.
//  Copyright © 2017年 浩哥哥. All rights reserved.
//

#define Color(r,g,b,a) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]
#define round  100

#import "HumanView.h"
#import <CoreGraphics/CoreGraphics.h>


@implementation HumanView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //绘制图形
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    drawBody(context, rect);
    //绘制眼睛
    drawEyes(context, rect);
    
    //绘制嘴巴
    drawMouth(context, rect);
}

//绘画身体部分
void drawBody(CGContextRef context,CGRect rect){
    
    //设置颜色
    [[UIColor yellowColor] set];
    
    //初始位置
    CGFloat startX = 100;
    CGFloat startY = 120;
    
    //讲画笔移动到指定的位置
    CGContextMoveToPoint(context, startX, startY);
    
    //设置上半部分椭圆
    CGFloat circleUpX = startX + round;
    CGFloat circleUpY = startY;
    //开始h画弧
    CGContextAddArc(context, circleUpX, circleUpY, round, 0, M_PI, 1);
    
    //画线
    CGFloat lineX = circleUpX + round;
    CGFloat lineY = circleUpY;
    CGContextAddLineToPoint(context, lineX, lineY);
    
    
    //画下面部分的半圆
    CGFloat circleDownX = lineX - round;
    CGFloat circleDownY = lineY + round;
    CGContextAddArc(context, circleDownX, circleDownY, round, 0, M_PI, 0);
    
    //合并线条
    CGContextClosePath(context);
    //绘制图形，并填充颜色
    CGContextFillPath(context);
    
    
}

void drawEyes(CGContextRef context, CGRect rect){
    
    //绘制黑色的围巾
    CGFloat startX = 100;
    CGFloat startY = 120;
    CGContextMoveToPoint(context, startX, startY);
    CGContextSetLineWidth(context, 15);
    
    CGFloat endX = 100 + round * 2;
    CGFloat endY = 120;
    CGContextAddLineToPoint(context, endX, endY);
    [[UIColor blackColor]set];
    CGContextStrokePath(context);
    
    //绘制眼睛
    //绘制最外层的黑的大眼珠
    CGFloat blackEyeX = startX + 100;
    CGFloat blackEyeY = startY;
    CGContextAddArc(context, blackEyeX, blackEyeY, round*0.5, 0, M_PI * 2, 1);
    CGContextFillPath(context);
    
    //绘制中间的白色的眼珠子
    CGContextAddArc(context, blackEyeX, blackEyeY, round*0.4, 0, M_PI * 2, 1);
    [[UIColor whiteColor]set];
    CGContextFillPath(context);
    
    //绘制最内层的灰色的眼珠子
    CGContextAddArc(context, blackEyeX, blackEyeY, round * 0.2, 0, M_PI * 2, 1);
    [[UIColor lightGrayColor]set];
    CGContextFillPath(context);
}

void drawMouth(CGContextRef context, CGRect rect){
    
    CGFloat startX = 150;
    CGFloat startY = 250;
    CGContextMoveToPoint(context, startX, startY);
    
    CGFloat endX = 250;
    CGFloat endY = 250;
    CGFloat controlX = 200;
    CGFloat controlY = 270;
    
    //使用贝塞尔曲线进行绘制
    CGContextAddQuadCurveToPoint(context, controlX, controlY, endX, endY);
    //设置曲线的颜色
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    //设置线宽
    CGContextSetLineWidth(context, 2);
    CGContextStrokePath(context);
}








@end
