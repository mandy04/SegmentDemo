//
//  testSegment.m
//  fengzhuangSegment
//
//  Created by mandy on 15/5/23.
//  Copyright (c) 2015年 machunhui. All rights reserved.
//

#import "testSegment.h"

@implementation testSegment

@synthesize delegate = _delagate;

- (id)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles andWidths:(NSArray *)widths andDefaultsImages:(NSArray *)defaultImages andSelectedImages:(NSArray *)selectedImages andTextFont:(NSInteger)textFontSize andSeparateImage:(UIImage *)separateImage{
    self =[super initWithFrame:frame];
    if (self) {
        _titles = [titles copy];
        _widths = [widths copy];
        _defaultsImages = [defaultImages copy];
        _selectedImages = [selectedImages copy];
        _textFontSize = textFontSize;
        _separateImage = [separateImage copy];
        _saveButtons =[[NSMutableArray alloc]init];
        
        [self createView];
    }
    return self;
}

- (void)createView {
    
    float xPos = 0.0f;
    float yPos = 0.0f;
   // float width = self.frame.size.width;
    float height = self.frame.size.height;
    for (int i =0 ; i<_titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(xPos, yPos, [[_widths objectAtIndex:i]floatValue], height);
        button.titleLabel.font = [UIFont systemFontOfSize:_textFontSize];
        button.userInteractionEnabled = YES;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        if (i == 0) {
            UIImage *Image = [_defaultsImages objectAtIndex:0];
            [button setBackgroundImage:[Image stretchableImageWithLeftCapWidth:25 topCapHeight:15] forState:UIControlStateNormal];
        }else if (i == [_titles count]-1){
            UIImage *image = [_defaultsImages objectAtIndex:2];
            [button setBackgroundImage:[image stretchableImageWithLeftCapWidth:25 topCapHeight:15] forState:UIControlStateNormal];
        }else {
            UIImage *image =[_defaultsImages objectAtIndex:1];
            [button setBackgroundImage:[image stretchableImageWithLeftCapWidth:25 topCapHeight:15] forState:UIControlStateNormal];
        }
        [button setTitle:[_titles objectAtIndex:i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(segmentIndex:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [_saveButtons addObject:button];

        if (i != [_titles count]-1) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(xPos+[[_widths objectAtIndex:i]floatValue]-2, yPos, 2, height)];
            imageView.image = _separateImage;
            [self addSubview:imageView];
        }
        
        xPos += [[_widths objectAtIndex:i]floatValue];
        
    }
}

- (void)segmentIndex:(UIButton*)button {
    NSInteger index = [_saveButtons indexOfObject:button];
    if (_curIndex == index) {
        return;
    }
    //设置所有的默认图片
    [self setDefaultImage];
    //设置选中时图片
    [self setSelectedImage:index];
    _curIndex = index;

    if (_delagate && [_delagate respondsToSelector:@selector(sendSegmentIndex:)]) {
        [_delagate sendSegmentIndex:index];
    }
}

-(void)setDefaultImage {

    for (int i =0 ; i<_saveButtons.count; i++) {
        UIButton *button = [_saveButtons objectAtIndex:i];
        if (i ==0) {
            UIImage *image = [_defaultsImages objectAtIndex:0];
            [button setBackgroundImage:[image stretchableImageWithLeftCapWidth:25 topCapHeight:15] forState:UIControlStateNormal];
        }else if (i == [_saveButtons count] -1){
            UIImage *image = [_defaultsImages objectAtIndex:2];
            [button setBackgroundImage:[image stretchableImageWithLeftCapWidth:25 topCapHeight:15] forState:UIControlStateNormal];
        }else{
            UIImage *image = [_defaultsImages objectAtIndex:1];
            [button setBackgroundImage:[image stretchableImageWithLeftCapWidth:25 topCapHeight:15] forState:UIControlStateNormal];
        }
    }
}


- (void)setSelectedImage:(NSInteger)index {
    UIButton *button =[_saveButtons objectAtIndex:index];
    if (index == 0) {
        UIImage *image = [_selectedImages objectAtIndex:0];
        [button setBackgroundImage:[image stretchableImageWithLeftCapWidth:25 topCapHeight:15] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];

    }else if (index == [_saveButtons count] -1){
        UIImage *image = [_selectedImages objectAtIndex:2];
        [button setBackgroundImage:[image stretchableImageWithLeftCapWidth:25 topCapHeight:15] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];

    }else {
        UIImage *image = [_selectedImages objectAtIndex:1];
        [button setBackgroundImage:[image stretchableImageWithLeftCapWidth:25 topCapHeight:15] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    }
}


- (void)selectedIndex:(NSInteger)index {
    
    UIButton *button =[_saveButtons objectAtIndex:index];
    [self segmentIndex:button];
    
}
@end
