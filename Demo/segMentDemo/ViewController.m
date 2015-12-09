//
//  ViewController.m
//  segMentDemo
//
//  Created by llbt on 15/11/30.
//  Copyright © 2015年 llbt. All rights reserved.
//

#import "ViewController.h"
#import "testSegment.h"

@interface ViewController ()<testSegmentDelegate>
{
    NSArray *itemArr;//标题数组
    NSArray *widthArr;//宽度数组
    NSArray *defaultBackgroundImagesArr;
    NSArray *selectedBackgroundImagesArr;
    NSInteger currentTag;//设置当前选中的tag值
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    itemArr = @[NSLocalizedString(@"功能1", @""),
                NSLocalizedString(@"功能2", @""),
                NSLocalizedString(@"功能3", @""),
                NSLocalizedString(@"功能4", @"")];
    widthArr = @[@"80",@"80",@"80",@"80"];
    defaultBackgroundImagesArr = @[[UIImage imageNamed:@"选项_1.png"],
                                   [UIImage imageNamed:@"选项_2.png"],
                                   [UIImage imageNamed:@"选项_3.png"],
                                   [UIImage imageNamed:@"选项_1.png"]];
    selectedBackgroundImagesArr = @[[UIImage imageNamed:@"选项_1Selected.png"],
                                    [UIImage imageNamed:@"选项_2Selected.png"],
                                    [UIImage imageNamed:@"选项_3Selected.png"],
                                    [UIImage imageNamed:@"选项_3Selected.png"]];

    [self createSegment];
}
- (void)createSegment {
    float width = self.view.bounds.size.width;
    testSegment*customSeg = [[testSegment alloc]initWithFrame:CGRectMake(10, 90, 320, 50) andTitles:itemArr andWidths:widthArr andDefaultsImages:defaultBackgroundImagesArr andSelectedImages:selectedBackgroundImagesArr andTextFont:14.0f andSeparateImage:[UIImage imageNamed:@"选项_分割线.png"]];
    
    customSeg.center = CGPointMake(width/2,115);//取中心位置
    customSeg.delegate = self;
    customSeg.tag = 50001;
    [customSeg selectedIndex:1];

    [self.view addSubview:customSeg];
}

- (void)sendSegmentIndex:(NSInteger)index {
    [self segmentBtnClick:index];
    
    //设置 选中segment值
    currentTag = index;
}


- (void)segmentBtnClick:(NSInteger)index {
    switch (index) {
        case 0:
        {//点击第一个seg
            
        }
            break;
            
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
