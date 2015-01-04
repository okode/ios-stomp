//
//  OKViewController.m
//  StompClient
//
//  Created by Pedro Jorquera on 08/12/13.
//  Copyright (c) 2013 Okode. All rights reserved.
//

#import "OKViewController.h"
#import <StompKit/StompKit.h>

#define kModelCapacity      20
#define kChannel            @"/topic/demo"
#define kUser               @"admin"
#define kPassword           @"password"

@interface OKViewController ()
@property (strong, nonatomic) NSMutableArray *model;
@property (assign, nonatomic) NSUInteger index;
@property (strong, nonatomic) STOMPClient *stomp;
@property (strong, nonatomic) STOMPSubscription *subscription;
@end

@implementation OKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.model = [[NSMutableArray alloc] initWithCapacity:kModelCapacity];
    self.index = 0;
    
    self.stomp = [[STOMPClient alloc] initWithHost:@"localhost"
                                              port:61613];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateOutput
{
    NSMutableString* text = [[NSMutableString alloc] init];
    for (NSString* message in self.model) {
        [text appendString:message];
        [text appendString:@"\n"];
    }
    self.output.text = text;
}

- (void)addMessage:(NSString *)message
{
    self.model[self.index++] = message;
    if (self.index == kModelCapacity) {
        self.index = 0;
    }
    [self updateOutput];
}

- (IBAction)play:(id)sender
{
    if (!self.btnStop.enabled) {

        [self.stomp connectWithLogin:kUser
                            passcode:kPassword
                   completionHandler:^(STOMPFrame *connectedFrame, NSError *error)
        {
                   
            if (error) {
                NSLog(@"%@", error);
                return;
            }

            self.subscription = [self.stomp subscribeTo:kChannel
                                         messageHandler:^(STOMPMessage *message)
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self addMessage:message.body];
                });
            }];

        }];
    } else {
        self.subscription = [self.stomp subscribeTo:kChannel
                                     messageHandler:^(STOMPMessage *message)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self addMessage:message.body];
            });
        }];
    }
    
    self.btnPlay.enabled = NO;
    self.btnPause.enabled = YES;
    self.btnStop.enabled = YES;
}

- (IBAction)pause:(id)sender
{
    if (self.subscription != nil) {
        [self.subscription unsubscribe];
    } else {
        NSLog(@"Could not unsubscribe from nil subscription");
    }
    self.btnPlay.enabled = YES;
    self.btnPause.enabled = NO;
    self.btnStop.enabled = YES;
}

- (IBAction)stop:(id)sender
{
    self.btnStop.enabled = NO;
    self.btnPause.enabled = NO;
    self.subscription = nil;
    [self.stomp disconnect:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.btnPlay.enabled = YES;
        });
    }];
}
@end
