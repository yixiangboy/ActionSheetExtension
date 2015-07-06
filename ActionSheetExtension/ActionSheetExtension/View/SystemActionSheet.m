//
//  SystemActionSheet.m
//  ActionSheetExtension
//
//  Created by yixiang on 15/7/6.
//  Copyright (c) 2015年 yixiang. All rights reserved.
//

#import "SystemActionSheet.h"

@interface SystemActionSheet()<UIActionSheetDelegate>

@property (nonatomic , strong) UIActionSheet *actionSheet;

@end

@implementation SystemActionSheet

-(id)initViewWithPhone:(NSString *)phone title:(NSString *)title{
    if (self = [self init]) {
        _actionSheet.title = title;
        [_actionSheet addButtonWithTitle:phone];
    }
    return self;
}

-(id)initViewWithMultiPhone:(NSArray *)array title:(NSString *)title{
    
    if (self = [self init]) {
        _actionSheet.title = title;
        for (NSString *phone in array) {
            [_actionSheet addButtonWithTitle:phone];
        }
    }
    return self;
}

-(id)init{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    if (self = [super initWithFrame:bounds]) {
        self.backgroundColor = [UIColor clearColor];
        
        _actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
        
        _actionSheet.cancelButtonIndex = [_actionSheet addButtonWithTitle:@"取消"];
    }
    return self;
}

-(void) show{
    [_actionSheet showInView : self];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        [self close];
    }else{
        [self onPhoneButtonClick:[_actionSheet buttonTitleAtIndex:buttonIndex]];
    }
}



- (void)onPhoneButtonClick:(NSString *)phone {
    NSLog(@"%@",phone);
    NSString *urlString = [NSString stringWithFormat:@"tel://%@", phone];
    BOOL result = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    if (!result) {
        [self close];
        NSLog(@"亲，您的设备不支持拨打电话功能");
    } else {
        [self close];
    }
}

-(void) close{
    for (UIView *v in [self subviews]) {
        [v removeFromSuperview];
    }
    [self removeFromSuperview];
}

@end
