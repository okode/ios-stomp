//
//  OKViewController.h
//  StompClient
//
//  Created by Pedro Jorquera on 08/12/13.
//  Copyright (c) 2013 Okode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OKViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnPlay;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnPause;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnStop;
@property (weak, nonatomic) IBOutlet UITextView *output;

- (IBAction)play:(id)sender;
- (IBAction)pause:(id)sender;
- (IBAction)stop:(id)sender;

@end
