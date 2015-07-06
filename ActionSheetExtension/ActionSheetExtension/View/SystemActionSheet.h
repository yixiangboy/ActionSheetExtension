//
//  SystemActionSheet.h
//  ActionSheetExtension
//
//  Created by yixiang on 15/7/6.
//  Copyright (c) 2015年 yixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SystemActionSheet : UIView

-(id) initViewWithPhone : (NSString *) phone title : (NSString *) title;

-(id) initViewWithMultiPhone:(NSArray *) array title :(NSString *)title;

-(void) show;

@end
