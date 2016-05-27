//
//  JSCopyableLabel.m
//  BaiSiBuDeJie
//
//  Created by  江苏 on 16/5/27.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSCopyableLabel.h"

@implementation JSCopyableLabel

-(BOOL)canBecomeFirstResponder{
    return YES;
}

-(void)awakeFromNib{
    [self awakeFromNib];
    
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)setUp{
    self.userInteractionEnabled=YES;
    //创建并添加长按手势
    UILongPressGestureRecognizer* longPregress=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPregress)];
    [self addGestureRecognizer:longPregress];
}

-(void)longPregress{
    //创建并设置菜单控制器
    UIMenuController* menu=[[UIMenuController alloc]init];
    UIMenuItem* itemCopy=[[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(copy:)];
    menu.menuItems=@[itemCopy];
    [menu setTargetRect:self.bounds inView:self];
    [menu setMenuVisible:YES animated:YES];
}

-(void)copy:(UIMenuController*)menu{
    //复制到剪贴板
    UIPasteboard* pasteBoard=[UIPasteboard generalPasteboard];
    pasteBoard.string=self.text;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    //仅可以复制
    return @selector(copy:);
}
@end
