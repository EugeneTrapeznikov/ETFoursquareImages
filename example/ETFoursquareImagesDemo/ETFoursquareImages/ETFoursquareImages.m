//
//  ETFoursquareImages.m
//  ETFoursquareImagesDemo
//
//  Created by Eugene Trapeznikov on 11/21/13.
//  Copyright (c) 2013 Eugene Trapeznikov. All rights reserved.
//

#import "ETFoursquareImages.h"

@implementation ETFoursquareImages

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.scrollView.bounces = YES;
        self.scrollView.alwaysBounceVertical = YES;
        self.scrollView.delegate = self;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.contentSize = CGSizeMake(frame.size.width, frame.size.height);
        [self.scrollView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.scrollView];
        
        self.pageControlHeight = 18;
        
        pageControlIsChangingPage = NO;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)setImages:(NSArray *)_imagesArray{
    if (_imagesArray.count != 0) {
        
        //images
        imagesScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, imagesScrollStart, self.frame.size.width, self.frame.size.width)];
        imagesScrollView.backgroundColor = [UIColor whiteColor];
        imagesScrollView.canCancelContentTouches = NO;
        imagesScrollView.showsHorizontalScrollIndicator = NO;
        imagesScrollView.showsVerticalScrollIndicator = NO;
        imagesScrollView.bounces = NO;
        imagesScrollView.delegate = self;
        imagesScrollView.clipsToBounds = YES;
        imagesScrollView.scrollEnabled = YES;
        imagesScrollView.pagingEnabled = YES;
        
        for (int i=0;i<_imagesArray.count;i++){
            UIImage *image = [_imagesArray objectAtIndex:i];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.width)];
            [imageView setImage:image];
            [imagesScrollView addSubview:imageView];
        }
        imagesScrollView.contentSize = CGSizeMake(_imagesArray.count * self.frame.size.width, self.frame.size.width);
        [self.scrollView addSubview:imagesScrollView];
        
       // imagesHeight = 160 + 45 + dy;
        
        //  Page Control
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, imagesHeight- self.pageControlHeight, self.frame.size.width, self.pageControlHeight)];
        self.pageControl.numberOfPages = _imagesArray.count;
        self.pageControl.currentPage = 0;
        self.pageControl.hidesForSinglePage = YES;
        [self.pageControl setPageIndicatorTintColor:[UIColor whiteColor]];
        [self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
        [self.scrollView addSubview:self.pageControl];
        
        self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, imagesHeight, self.frame.size.width, self.frame.size.height - imagesHeight)];
        self.bottomView.backgroundColor = [UIColor whiteColor];
        [self.scrollView addSubview:self.bottomView];
    }
}

-(void)setImagesHeight:(int)_imagesHeight{
    imagesHeight = _imagesHeight;

    imagesScrollStart = -(self.frame.size.width - imagesHeight)/2 - 15;
    
    scrollingKoef = 0.2*imagesHeight/80.0;
}

#pragma mark - Actions
- (void)changePage:(UIPageControl *)pageControl {
    CGRect imagesFrame = imagesScrollView.frame;
    imagesFrame.origin.x = imagesFrame.size.width * pageControl.currentPage;
    imagesFrame.origin.y = 0;
    [imagesScrollView scrollRectToVisible:imagesFrame animated:YES];
    pageControlIsChangingPage = YES;
}

#pragma mark - ScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == self.scrollView){
        
        imagesScrollView.frame = CGRectMake(imagesScrollView.frame.origin.x, imagesScrollStart + scrollView.contentOffset.y*scrollingKoef, imagesScrollView.frame.size.width, imagesScrollView.frame.size.height);
        
        return;
    }
    
    if (pageControlIsChangingPage) {
        return;
    }
    CGFloat pageWidth = imagesScrollView.frame.size.width;
    NSUInteger page = floor((imagesScrollView.contentOffset.x - pageWidth / 2.0f) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)_scrollView {
    pageControlIsChangingPage = NO;
}

@end
