//
//  ElementView.h
//  TouchPasswordText
//
//  Created by 杨彤 on 2018/11/21.
//  Copyright © 2018年 JJXT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ElementView : UIView
@property (nonatomic,assign)  BOOL isSelect;
- (void)selectCenterView;

- (void)defCenterView;
@end

NS_ASSUME_NONNULL_END
