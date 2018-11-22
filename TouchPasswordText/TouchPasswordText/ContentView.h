//
//  ContentView.h
//  TouchPasswordText
//
//  Created by 杨彤 on 2018/11/21.
//  Copyright © 2018年 JJXT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SelectNuberDelegate <NSObject>

@required

- (void)passwordWith:(NSArray *)data;

@end
@interface ContentView : UIView
@property (nonatomic,weak) id <SelectNuberDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
