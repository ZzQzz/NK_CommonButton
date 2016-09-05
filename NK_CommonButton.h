//
//  NK_CommonButton.h
//  NK_CommonButton
//
//  Created by 李麒 on 15/4/23.
//  Copyright © 2015年 LWSpro. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    ImageTitleNormal = 110, //正常显示图片
    ImageUpTitleDown,       //图片在上,文字在下
    ImageRightTitleLeft     //图片在右,文字在左
    
}CommonButtonType;

@interface W_CommonButton : UIButton
//样式
@property (nonatomic,assign) CommonButtonType btnType;

//普通模式下的文字内容
@property (nonatomic,copy) NSString *normalTitle;

//选中模式下的文字内容
@property (nonatomic,copy) NSString *selectedTitle;

//高亮模式下的文字内容
@property (nonatomic,copy) NSString *highlightedTitle;

//普通模式下字体颜色
@property (nonatomic,strong) UIColor *normalTitleColor;

//高亮模式下字体颜色
@property (nonatomic,strong) UIColor *selectedTitleColor;

//选中模式下字体的颜色
@property (nonatomic,strong) UIColor *highlightedTitleColor;

//字体大小
@property (nonatomic,assign) CGFloat titleFont;

//普通模式下的图片内容
@property (nonatomic,copy) NSString *normalImageName;

//选中模式下的图片内容
@property (nonatomic,copy) NSString *selectedImageName;

//高亮模式下的图片内容
@property (nonatomic,copy) NSString *highlightedImageName;

//普通模式下的背景图片内容
@property (nonatomic,copy) NSString *normalBackground;

//选中模式下的背景图片内容
@property (nonatomic,copy) NSString *selectedBackground;

//高亮模式下的背景图片内容
@property (nonatomic,copy) NSString *highlightedBackground;




//创建
- (instancetype)initWithType:(CommonButtonType)type;

+ (instancetype)shareNKCommonButton:(CommonButtonType)type ;

//根据不同状态设置文字内容,文字颜色,图片内容
- (void)setTitle:(NSString *)title titleColor:(UIColor *)titleColor image:(NSString *)imageName forState:(UIControlState)state;

//创建button 传入枚举值,来对button进行布局
+ (instancetype)shareNKCommonButton:(CommonButtonType)type frame:(CGRect)frame;


@end
