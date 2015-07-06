//
//  ViewController.m
//  ActionSheetExtension
//
//  Created by yixiang on 15/7/6.
//  Copyright (c) 2015年 yixiang. All rights reserved.
//

#import "ViewController.h"
#import "Item.h"
#import "SystemActionSheet.h"
#import "PicAndTextActionSheet.h"

@interface ViewController ()<DownSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect bounds = self.view.bounds;
    UIButton *dialPhone1 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(bounds)/2-100, 120, 200, 40)];
    dialPhone1.backgroundColor = [UIColor grayColor];
    [dialPhone1 setTitle:@"系统自带ActionSheet" forState:UIControlStateNormal];
    [dialPhone1 addTarget:self action:@selector(dialPhone1) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *dialPhone2 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(bounds)/2-100, 200, 200, 40)];
    dialPhone2.backgroundColor = [UIColor grayColor];
    [dialPhone2 setTitle:@"图文混排ActionSheet" forState:UIControlStateNormal];
    [dialPhone2 addTarget:self action:@selector(dialPhone2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:dialPhone1];
    [self.view addSubview:dialPhone2];
    
}


-(void) dialPhone1 {
    NSString *number1 = @"15951973122";
    NSString *number2 = @"15951973124";
    NSString *number3 = @"15951973127";
    NSArray *array = [NSArray arrayWithObjects:number1, number2,number3, nil];
    
    //SystemActionSheet *dialPhoneView = [[SystemActionSheet alloc] initViewWithPhone:number1 title:@"拨打电话"];
    SystemActionSheet *dialPhoneView = [[SystemActionSheet alloc] initViewWithMultiPhone:array title:@"拨打电话"];
    [dialPhoneView show];
    [self.view addSubview:dialPhoneView];
    
}

-(void) dialPhone2 {
    Item *item1 = [[Item alloc] init];
    item1.icon = @"journey_phone";
    item1.title = @"15195905888";
    Item *item2 = [[Item alloc] init];
    item2.icon = @"journey_phone";
    item2.title = @"15195905777";
    NSArray *listData = [NSArray arrayWithObjects:item1,item2, nil];
    
    PicAndTextActionSheet *sheet = [[PicAndTextActionSheet alloc] initWithList:listData title:@"拨打电话"];
    sheet.delegate = self;
    [sheet showInView:nil];
    
}

-(void) didSelectIndex:(NSInteger)index{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"您当前点击的是第%zi个按钮",index] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

@end
