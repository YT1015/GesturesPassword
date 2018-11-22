//
//  ContentView.m
//  TouchPasswordText
//
//  Created by 杨彤 on 2018/11/21.
//  Copyright © 2018年 JJXT. All rights reserved.
//

#import "ContentView.h"
#import "ElementView.h"
#import "TouchPasswordHeader.h"
#import <CoreGraphics/CoreGraphics.h>
@interface ContentView(){
    CGPoint _cutrnPoint;
}
@property (nonatomic,strong)NSMutableArray *selectArr;
@end
@implementation ContentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (NSMutableArray *)selectArr{
    if (!_selectArr) {
        _selectArr=[[NSMutableArray alloc] init];
    }
    return _selectArr;
}
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        for (int i=0; i<9; i++) {
            
            ElementView *elementV=[[ElementView alloc] initWithFrame:CGRectMake(20+(W+space)*(i%3), 20+(W+space)*(i/3), W, W)];
            elementV.tag=101+i;
            [self addSubview:elementV];
            
        }
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch=[touches anyObject];
    
    CGPoint point=[touch locationInView:self];
    
    _cutrnPoint=point;
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self];
    ElementView *view=[self elementWith:point];
    if (view && !view.isSelect) {
        [self.selectArr addObject:view];
        [view selectCenterView];
    }else{
        _cutrnPoint=point;
    }
    //设置此方法会调 drawRect方法
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    
    for (ElementView *elementV in self.subviews) {
        [elementV defCenterView];
    }

    if (self.selectArr.count>0) {
        [self selectNuber];
    }
    [self.selectArr removeAllObjects];
    [self setNeedsDisplay];
    
     
}
- (ElementView *)elementWith:(CGPoint)point{
    
    for (ElementView *elev in self.subviews) {
        if (CGRectContainsPoint(elev.frame, point)) {
            return elev;
        }
        
    }
    return nil;
}

#pragma mark 存数据
-(void)selectNuber{
    
    if ([self.delegate respondsToSelector:@selector(passwordWith:)]) {
        NSMutableArray *arr=[NSMutableArray array];
        for (ElementView *view in self.selectArr) {
            [arr addObject:@(view.tag-100)];
        }
        [self.delegate passwordWith:arr];
    }
    
}
#pragma mark 绘制连线
- (void)drawRect:(CGRect)rect{
    
    CGContextRef ref=UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(ref, [UIColor redColor].CGColor);
    
    CGContextSetLineWidth(ref, borderW);
    
    UIBezierPath *path=[[UIBezierPath alloc] init];
    
    if (self.selectArr.count<=0) {
        return;
    }
    for (int i=0; i<self.selectArr.count; i++) {
        if (i==0) {
            ElementView *view=self.selectArr[i];
            CGPoint point=view.center;
            [path moveToPoint:point];
            
        }else{
            ElementView *view=self.selectArr[i];
            CGPoint point=view.center;
            [path addLineToPoint:point];
        }
    }
    [path addLineToPoint:_cutrnPoint];
    CGContextAddPath(ref, path.CGPath);
    CGContextStrokePath(ref);
}
@end
