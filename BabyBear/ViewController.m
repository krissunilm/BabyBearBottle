//
//  ViewController.m
//  BabyBear
//
//  Created by sunil maganti on 3/1/14.
//  Copyright (c) 2014 Kvana Inc. All rights reserved.
//

#import "ViewController.h"
#import "BabyObjects.h"

@interface ViewController () {


AVAudioPlayer *_audioPlayer;
}

@property (strong, nonatomic) BabyObjects *babyObjects;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //set up the FYX VisitManager
    self.visitManager = [FYXVisitManager new];
    self.visitManager.delegate = self;
    [self.visitManager start];
    
    
    //play with images
    self.bearImage.alpha = 1;
    self.bottleImage.alpha = 1;
    if (!self.babyObjects.isBearPresent) {
        self.bearImage.alpha = 0;
    }
    if (!self.babyObjects.isBottlePresent) {
        self.bottleImage.alpha = 0;
    }
    
    self.bearTxtSent = FALSE;
    self.bottleTxtSent = FALSE;
    
    NSLog(@"**  Alpha setting self.bearImage.alpha = %ld",(long)self.bearImage.alpha);
    NSLog(@"**  Alpha setting self.bottleImage.alpha = %ld",(long)self.bottleImage.alpha);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//lazy initialization of babyObjects
- (BabyObjects *) babyObjects {
    
    NSLog(@"Inside lazy instantiation of babyObjects");
    
    if (!_babyObjects) {
        _babyObjects.bearPresent = TRUE;
        _babyObjects.bottlePresent = FALSE;
        NSLog(@"** Inside _babyObjects");
    } else {
       NSLog(@"** Inside Else  _babyObjects");
        
    }
    
    NSLog(@"**  Alpha setting self.bearImage.alpha = %ld",(long)self.bearImage.alpha);
    NSLog(@"**  Alpha setting self.bottleImage.alpha = %ld",(long)self.bottleImage.alpha);

    
    return _babyObjects;
    
}

- (void)didArrive:(FYXVisit *)visit;
{
    // this will be invoked when an authorized transmitter is sighted for the first time
    NSLog(@"I arrived at a Gimbal Beacon!!! %@", visit.transmitter.name);
}
- (void)receivedSighting:(FYXVisit *)visit updateTime:(NSDate *)updateTime RSSI:(NSNumber *)RSSI;
{
    // this will be invoked when an authorized transmitter is sighted during an on-going visit
    //NSLog(@"I received a sighting!!! %@ ", visit.transmitter.name);
    
    float rssiValue = [RSSI floatValue];
    
    NSLog(@"I received a sighting!!! %@ %f", visit.transmitter.name, rssiValue);
    
    
    
    /*
    if ([category isEqualToString:@"Some String"])
    {
        // Do stuff...
    }
     */
    
    if (([visit.transmitter.name isEqualToString:@"Bear Beacon"]) && (rssiValue >= -65 ))
    {
        // Do stuff...
        [UIView beginAnimations:@"showbear" context:nil];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationDelegate:self];
        self.bearImage.alpha = 1;
        self.bearQuestion.alpha = 0;
        [UIView commitAnimations];
        NSLog(@"Found Bear");
       
    } else if(([visit.transmitter.name isEqualToString:@"Bear Beacon"]) && (rssiValue < -65 )) {
        // Do stuff...
        [UIView beginAnimations:@"showbear" context:nil];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationDelegate:self];
        self.bearImage.alpha = 0.5;
        self.bearQuestion.alpha = 1;
        [UIView commitAnimations];
        //http://young-retreat-6253.herokuapp.com/forgot?To=%2B17244489427&What=bear
        
        
        //audio
        //Setup the audio player
        NSURL *noSoundFileURL=[NSURL fileURLWithPath:
                               [[NSBundle mainBundle]
                                pathForResource:@"norecording" ofType:@"wav"]];
        
        _audioPlayer =  [[AVAudioPlayer alloc]
                         initWithContentsOfURL:noSoundFileURL error:nil];
        
        [_audioPlayer play];
        
        
        NSString *londonWeatherUrl =
        @"http://young-retreat-6253.herokuapp.com/forgot?To=%2B17244489427&What=bear";
        
        NSURLRequest *request = [NSURLRequest requestWithURL:
                                 [NSURL URLWithString:londonWeatherUrl]];
        if(self.bearTxtSent == FALSE) {
            self.bearTxtSent = TRUE;
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,
                                                   NSData *data,
                                                   NSError *connectionError) {
                                   // handle response
                                   
                                   
                                   
                                   NSLog(@"Got response %@", response);
                               }];
        }
        
        NSLog(@"Lost Bear");
    }
    
    //Hy1
    //Kris-SRX-Dogpatch Saloon
    
    if (([visit.transmitter.name isEqualToString:@"Kris-SRX-Dogpatch Saloon"]) && (
        rssiValue >= -65))
    {
        // Do stuff...
        [UIView beginAnimations:@"showbottle" context:nil];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationDelegate:self];
        self.bottleImage.alpha = 1;
        self.bottleQuestion.alpha = 0;
        [UIView commitAnimations];
        NSLog(@"Found Bottle");
      
    } else if (([visit.transmitter.name isEqualToString:@"Kris-SRX-Dogpatch Saloon"]) && (rssiValue < -65)) {
        
        [UIView beginAnimations:@"showbottle" context:nil];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationDelegate:self];
        self.bottleImage.alpha = 0.5;
        self.bottleQuestion.alpha = 1;
        [UIView commitAnimations];
        
        //audio
        //need to check why audio is not playing
        //Setup the audio player
        NSURL *noSoundFileURL=[NSURL fileURLWithPath:
                               [[NSBundle mainBundle]
                                pathForResource:@"norecording" ofType:@"wav"]];
        
        _audioPlayer =  [[AVAudioPlayer alloc]
                         initWithContentsOfURL:noSoundFileURL error:nil];
        
        [_audioPlayer play];
        
        NSString *londonWeatherUrl =
        @"http://young-retreat-6253.herokuapp.com/forgot?To=%2B17244489427&What=bottle";
        
        NSURLRequest *request = [NSURLRequest requestWithURL:
                                 [NSURL URLWithString:londonWeatherUrl]];
        if(self.bottleTxtSent == FALSE) {
            self.bottleTxtSent = TRUE;
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response,
                                                   NSData *data,
                                                   NSError *connectionError) {
                                   // handle response
                                   
                                   NSLog(@"Got response %@", response);
                               }];
        
        }
        
        
        
        
        
        NSLog(@"Lost Bottle");
    }
    
}
- (void)didDepart:(FYXVisit *)visit;
{
    // this will be invoked when an authorized transmitter has not been sighted for some time
    NSLog(@"I left the proximity of a Gimbal Beacon!!!! %@", visit.transmitter.name);
    NSLog(@"I was around the beacon for %f seconds", visit.dwellTime);
    
    if ([visit.transmitter.name isEqualToString:@"Kris-SRX-Dogpatch Saloon"])
    {
        // Do stuff...
        self.bearImage.alpha = 0.2;
        NSLog(@"Departing Bear");
    }
    
    if ([visit.transmitter.name isEqualToString:@"Hy1"])
    {
        // Do stuff...
        self.bottleImage.alpha = 0.2;
        NSLog(@"Departing Bottle");
    }
    
}

@end
