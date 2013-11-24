//
//  ViewController.m
//  ETFoursquareImagesDemo
//
//  Created by Eugene Trapeznikov on 11/21/13.
//  Copyright (c) 2013 Eugene Trapeznikov. All rights reserved.
//

#import "ViewController.h"

#import "ETFoursquareImages.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    int imagesHeight = 160;
    
    ETFoursquareImages *foursquareImages = [[ETFoursquareImages alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-0)];
    [foursquareImages setImagesHeight:imagesHeight];
    
    NSArray *images  = [NSArray arrayWithObjects:[UIImage imageNamed:@"horses"], [UIImage imageNamed:@"surfer"], [UIImage imageNamed:@"bridge"], nil];
    
    [foursquareImages setImages:images];
    
    [self.view addSubview:foursquareImages];
    
    UITextView *hintTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0+imagesHeight, 320, 110)];
    hintTextView.userInteractionEnabled = NO;
    hintTextView.text = @"When you scroll, image's shown area will become bigger. Like it appears on place's page in Foursquare app.";
    hintTextView.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0];
    [foursquareImages.scrollView addSubview:hintTextView];
    
    UITextView *textview = [[UITextView alloc] initWithFrame:CGRectMake(0, 110+imagesHeight, 320, 535)];
    textview.userInteractionEnabled = NO;
    textview.text = @"When you scroll, image's shown area will become bigger. Like it appears on place's page in Foursqaure app.\nIf you can keep your head when all about you\nAre losing theirs and blaming it on you,\nIf you can trust yourself when all men doubt you,\nBut make allowance for their doubting too;\nIf you can wait and not be tired by waiting,\nOr being lied about, don't deal in lies,\nOr being hated, don't give way to hating,\nAnd yet don't look too good, nor talk too wise:\n\nIf you can dream -- and not make dreams your master;\nIf you can think -- and not make thoughts your aim;\nIf you can meet with Triumph and Disaster\nAnd treat those two impostors just the same;\nIf you can bear to hear the truth you've spoken\nTwisted by knaves to make a trap for fools,\nOr watch the things you gave your life to, broken,\nAnd stoop and build'em up with worn-out tools:\n\nIf you can make one heap of all your winnings\nAnd risk it on one turn of pitch-and-toss,\nAnd lose, and start again at your beginnings\nAnd never breathe a word about your loss;\nIf you can force your heart and nerve and sinew\nTo serve your turn long after they are gone,\nAnd so hold on when there is nothing in you\nExcept the Will which says to them: 'Hold on!'\n\nIf you can talk with crowds and keep your virtue,\nOr walk with Kings -- nor lose the common touch,\nIf neither foes nor loving friends can hurt you,\n\nIf all men count with you, but none too much;\nIf you can fill the unforgiving minute\nWith sixty seconds' worth of distance run,\nYours is the Earth and everything that's in it,\nAnd -- which is more -- you'll be a Man, my son!";
    [foursquareImages.scrollView addSubview:textview];
    
    foursquareImages.scrollView.contentSize = CGSizeMake(320, 535+110+imagesHeight);
    
    [foursquareImages.pageControl setCurrentPageIndicatorTintColor:[UIColor colorWithRed:(28/255.f) green:(189/255.f) blue:(141/255.f) alpha:1.0]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
