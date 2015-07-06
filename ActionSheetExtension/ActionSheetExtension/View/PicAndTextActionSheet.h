//
//  PicAndTextActionSheet.h
//  ActionSheetExtension
//
//  Created by yixiang on 15/7/6.
//  Copyright (c) 2015年 yixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DownSheetDelegate <NSObject>

-(void)didSelectIndex : (NSInteger) index;

@end

@interface PicAndTextActionSheet : UIView

@property (nonatomic , strong) id<DownSheetDelegate> delegate;

-(id)initWithList : (NSArray *)list title : (NSString *) title;

-(void) showInView : (UIViewController *)controller;

@end
