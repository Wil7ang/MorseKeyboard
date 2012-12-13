//
//  MKViewController.h
//  MorseKeyboard
//
//  Created by Wilson Tang on 12/11/12.
//  Copyright (c) 2012 WIl.7ang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKViewController : UIViewController <UITextViewDelegate>
@property (retain, nonatomic) IBOutlet UITextView *theTextView;
@property (strong, nonatomic) IBOutlet UIView *keyboardView;
@property (weak, nonatomic) IBOutlet UIButton *theButton;
@property (strong, nonatomic) IBOutlet UIView *accView;
@property double lastTime;
@property BOOL stalling;
@property (strong, nonatomic) NSMutableString *morseString;
@property (strong, nonatomic) NSTimer *curTimer;

@property (strong, nonatomic) NSDictionary *morseDict;

- (IBAction)doneEditing:(id)sender;
- (IBAction)touched:(id)sender;
- (IBAction)touchDown:(id)sender;

- (void)addText:(double)time;
- (void)processText;

- (IBAction)spaceButton:(id)sender;
- (IBAction)spaceButtonAlt:(id)sender;

@end
