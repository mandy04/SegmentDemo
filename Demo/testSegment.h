//
//  testSegment.h
//  fengzhuangSegment
//
//  Created by mandy on 15/11/30.
//  Copyright (c) 2015年 machunhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol testSegmentDelegate <NSObject>
-(void)sendSegmentIndex:(NSInteger)index;
@end

@interface testSegment : UIView
{
    NSArray *_titles;
    NSArray *_widths;
    NSArray *_defaultsImages;
    NSArray *_selectedImages;
    NSInteger _textFontSize;
    id<testSegmentDelegate>delegate;
    NSInteger _curIndex;
    UIImage *_separateImage;
    NSMutableArray *_saveButtons;
    
}

@property (nonatomic,weak)id<testSegmentDelegate>delegate;

- (void)selectedIndex:(NSInteger)index;

- (id)initWithFrame:(CGRect)frame andTitles:(NSArray*)titles andWidths:(NSArray*)widths andDefaultsImages:(NSArray*)defaultImages andSelectedImages:(NSArray*)selectedImages andTextFont:(NSInteger)textFontSize andSeparateImage:(UIImage *)separateImage;

@end
