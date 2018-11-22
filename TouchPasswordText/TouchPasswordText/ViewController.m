//
//  ViewController.m
//  TouchPasswordText
//
//  Created by 杨彤 on 2018/11/21.
//  Copyright © 2018年 JJXT. All rights reserved.
//

#import "ViewController.h"
#import "ContentView.h"
#import "TouchPasswordHeader.h"
@interface ViewController ()<SelectNuberDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ContentView *view=[[ContentView alloc] initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, W*3+2*space+40)];
    [view setBackgroundColor:[UIColor whiteColor]];
    view.delegate=self;
    [self.view addSubview:view];
}

- (void)passwordWith:(NSArray *)data{
    if (data.count<=4) {
        
    }else{
        NSString *str=[data componentsJoinedByString:@","];
        NSLog(@"选择了数字%@",str);
    }
}


@end
