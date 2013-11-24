ETFoursquareImages
==================

When you scroll, image's shown area will become bigger. Like it appears on places' page in Foursquare app.

![example](https://raw.github.com/EugeneTrapeznikov/ETFoursquareImages/master/demo_source/demo.gif)

Requirements
------------

- Xcode 5.
- iOS 6 or later.
- ARC.

How to use
=======================

`ETFoursquareImages` is a simple `UIScrollView` with images on the top of this `UIScrollView`.

Include the `ETFoursquareImages.h` and `ETFoursquareImages.m` in your project.

To display  `ETFoursquareImages`, simply do it like basic `UIVIew`'s `initWithFrame`:

    ETFoursquareImages *foursquareImages = [[ETFoursquareImages alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    [self.view addSubview:foursquareImages];

Then you should set images' height and images array. I recommend you to set image's height about 160 pixels:

    int imagesHeight = 160;
    [foursquareImages setImagesHeight:imagesHeight];
    NSArray *images  = [NSArray arrayWithObjects:[UIImage imageNamed:@"horses"], [UIImage imageNamed:@"surfer"], [UIImage imageNamed:@"bridge"], nil];
    [foursquareImages setImages:images];

When you add subview or set scrollView's content size don't forget about images height.

    UITextView *hintTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, imagesHeight+10, 320, 110)];
    hintTextView.text = @"When you scroll, image's shown area will become bigger. Like it appears on place's page in Foursquare app.";
    [foursquareImages.scrollView addSubview:hintTextView];
    
    foursquareImages.scrollView.contentSize = CGSizeMake(320, 110+imagesHeight);

You can adapt scroll view, page control and and view below images (`bottomView`) throught this variables:

    @property (nonatomic, strong) UIPageControl *pageControl;
    @property (nonatomic) int pageControlHeight;

    @property (nonatomic, strong) UIScrollView *scrollView;
    @property (nonatomic, strong) UIView *bottomView;

Example project included.

License
=======================

The MIT License (MIT)

Copyright (c) 2013 Eugene Trapeznikov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

Support / Contact / Bugs / Features
-----------------------------------

I can't promise to answer questions about how to use the code.

If you want to submit a feature request or bug report, please use [GitHub's issue tracker for this project](https://github.com/EugeneTrapeznikov/ETFoursquareImages/issues).  Or preferably fork the code and implement the feature/fix yourself, then submit a pull request.

Enjoy!

Eugene Trapeznikov

