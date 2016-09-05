//
//  NK_CommonButton.m
//  NK_CommonButton
//
//  Created by 李麒 on 15/4/28.
//  Copyright © 2016年 NKSpro. All rights reserved.
//

#import "NK_CommonButton.h"

#define KMargin 5

@interface NK_CommonButton ()


@end

@implementation NK_CommonButton

- (instancetype)initWithType:(CommonButtonType)type {

    return [NK_CommonButton shareWCommonButton:type];
    
}


+ (instancetype)shareNKCommonButton:(CommonButtonType)type  {
    
    //使用self  这样子类使用这个方法时,也同样有效
    NK_CommonButton *button = [[self alloc] init];
    //默认属性
    [button aboutButton:type];
    
    return button;
    
}



+ (instancetype)shareNKCommonButton:(CommonButtonType)type frame:(CGRect)frame {
    
    //使用self  这样子类使用这个方法时,也同样有效
    NK_CommonButton *button = [[self alloc] initWithFrame:frame];
    //默认属性
    [button aboutButton:type];
 
    return button;
    
}


#pragma mark - 默认的属性
- (void)aboutButton:(CommonButtonType)type {
    
    //赋值
    self.btnType = type;
    
    //文字默认居中
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    //默认字体颜色
    self.normalTitleColor = [UIColor blackColor];

    
}


#pragma mark - set方法重写
//普通模式下

//文字内容
- (void)setNormalTitle:(NSString *)normalTitle {
    
    _normalTitle = normalTitle;
    
    [self setTitle:normalTitle forState:UIControlStateNormal];
    
    
}



//图片内容
- (void)setNormalImageName:(NSString *)normalImageName {
    
    _normalImageName = normalImageName;
    
    [self setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    
    
}


//背景
- (void)setNormalBackground:(NSString *)normalBackground {
    
    _normalBackground = normalBackground;
    
    [self setBackgroundImage:[UIImage imageNamed:normalBackground] forState:UIControlStateNormal];
    
}


//文字颜色
- (void)setNormalTitleColor:(UIColor *)normalTitleColor {
    
    _normalTitleColor = normalTitleColor;
    
    [self setTitleColor:normalTitleColor forState:UIControlStateNormal];
    
    
}

//选中模式下

//文字内容
- (void)setSelectedTitle:(NSString *)selectedTitle {
    
    _selectedTitle = selectedTitle;
    
    [self setTitle:selectedTitle forState:UIControlStateSelected];
    
}



//图片内容
- (void)setSelectedImageName:(NSString *)selectedImageName {
    
    _selectedImageName = selectedImageName;
    
    [self setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    
    
}


//背景
- (void)setSelectedBackground:(NSString *)selectedBackground {
    
    _selectedBackground = selectedBackground;
    
    [self setBackgroundImage:[UIImage imageNamed:selectedBackground] forState:UIControlStateSelected];
    
}


//文字颜色
- (void)setSelectedTitleColor:(UIColor *)selectedTitleColor {
    
    _selectedTitleColor = selectedTitleColor;
    
    [self setTitleColor:selectedTitleColor forState:UIControlStateSelected];
    
    
}


//高亮模式下


//文字内容
- (void)setHighlightedTitle:(NSString *)highlightedTitle {
    
    _highlightedTitle = highlightedTitle;
    
    [self setTitle:highlightedTitle forState:UIControlStateHighlighted];
    
    
}


//图片内容
- (void)setHighlightedImageName:(NSString *)highlightedImageName {
    
    _highlightedImageName = highlightedImageName;
    
    [self setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    
}


-(void)setHighlightedBackground:(NSString *)highlightedBackground {
    
    _highlightedBackground = highlightedBackground;
    
    [self setBackgroundImage:[UIImage imageNamed:highlightedBackground] forState:UIControlStateHighlighted];
    
}


//文字颜色
- (void)setHighlightedTitleColor:(UIColor *)highlightedTitleColor {
    
    _highlightedTitleColor = highlightedTitleColor;
    
    [self setTitleColor:highlightedTitleColor forState:UIControlStateHighlighted];
    
}





//文字大小
- (void)setTitleFont:(CGFloat)titleFont {
    
    _titleFont = titleFont;
    
    self.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    
    
}

#pragma mark - 一次性设置不同状态下的文字,图片,文字颜色
- (void)setTitle:(NSString *)title titleColor:(UIColor *)titleColor image:(NSString *)imageName forState:(UIControlState)state {
    
    
    if (title) {
        
        //文字
        [self setTitle:title forState:state];
        
    }
    
    
    //文字颜色
    if (titleColor) {
        
        //文字颜色
        [self setTitleColor:titleColor forState:state];
        
        
    }else {//没有颜色时,就给个默认颜色
        
        self.normalTitleColor = [UIColor blackColor];
        
    }
    
    
    
    if (imageName) {
        
        //图片
        [self setImage:[UIImage imageNamed:imageName] forState:state];
        
    }
    
    
    
}



#pragma mark - 布局
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    
    CGFloat Width = self.frame.size.width;
    //    CGFloat Height = self.frame.size.height;
    
    CGFloat imageH = self.imageView.frame.size.height;
    CGFloat imageW = self.imageView.frame.size.width;
//    CGFloat imageX = self.imageView.frame.origin.x;
    CGFloat imageY = self.imageView.frame.origin.y;
    
    //    CGFloat titleX = self.titleLabel.frame.origin.x;
    CGFloat titleY = self.titleLabel.frame.origin.y;
    CGFloat titleW = self.titleLabel.frame.size.width;
    CGFloat titleH = self.titleLabel.frame.size.height;
    
    switch (self.btnType) {
            
        case ImageTitleNormal:
            
            //正常显示  就不用再对图片和文字布局
            
            break;
            
        case ImageUpTitleDown:
            
            
            self.imageView.frame = CGRectMake(Width * 0.5 - imageW * 0.5, 0, imageW, imageH);
            
            self.titleLabel.frame = CGRectMake(0, imageH + KMargin, Width, titleH);
            
            
            break;
            
        case ImageRightTitleLeft:
            
            self.titleLabel.frame = CGRectMake(0, titleY, titleW, titleH);
            
            
            self.imageView.frame = CGRectMake(titleW, imageY, imageW, imageH);
            
            break;
            
            
        default:
            
            
            
            break;
            
            
    }

}






//取消高亮

@end
