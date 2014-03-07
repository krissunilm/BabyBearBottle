//
//  ViewController.h
//  BabyBear
//
//  Created by sunil maganti on 3/1/14.
//  Copyright (c) 2014 Kvana Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FYX/FYXVisitManager.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@interface ViewController : UIViewController <FYXVisitDelegate>


@property (weak, nonatomic) IBOutlet UIImageView *bearImage;
@property (weak, nonatomic) IBOutlet UIImageView *bottleImage;
@property (weak, nonatomic) IBOutlet UILabel *bearQuestion;
@property (weak, nonatomic) IBOutlet UILabel *bottleQuestion;

@property (nonatomic) BOOL bearTxtSent;
@property (nonatomic) BOOL bottleTxtSent;

@property (nonatomic) FYXVisitManager *visitManager;

@end
