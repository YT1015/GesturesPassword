//
//  ElementView.m
//  TouchPasswordText
//
//  Created by 杨彤 on 2018/11/21.
//  Copyright © 2018年 JJXT. All rights reserved.
//

#import "ElementView.h"
#import "TouchPasswordHeader.h"
@interface ElementView (){
//    BOOL _isSelect;
    UIView *_centerView;
}
@end
@implementation ElementView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    _isSelect=NO;
   
    self.layer.cornerRadius=W/2.0;
    
    self.layer.masksToBounds=YES;
    
    self.layer.borderWidth=borderW;
    
    self.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    _centerView=[[UIView alloc] initWithFrame:CGRectMake(W/4, W/4, W/2, W/2)];
    
    [self addSubview:_centerView];
    _centerView.layer.masksToBounds=YES;
    _centerView.layer.cornerRadius=W/4;
    [_centerView setBackgroundColor:[UIColor whiteColor]];
    
}

- (void)selectCenterView{
    if (!_isSelect) {
        self.layer.borderColor=[UIColor grayColor].CGColor;
        [_centerView setBackgroundColor:[UIColor lightGrayColor]];
    }
      _isSelect=!_isSelect;
}

- (void)defCenterView{
    
    if (_isSelect) {
        [_centerView setBackgroundColor:[UIColor whiteColor]];
         self.layer.borderColor=[UIColor lightGrayColor].CGColor;
    }
    _isSelect=!_isSelect;
}

@end
