//
//  MKViewController.m
//  MorseKeyboard
//
//  Created by Wilson Tang on 12/11/12.
//  Copyright (c) 2012 WIl.7ang. All rights reserved.
//

#import "MKViewController.h"

#import "systemTest.h"


@interface MKViewController ()

@end

@implementation MKViewController
@synthesize theTextView;
@synthesize keyboardView;
@synthesize theButton;
@synthesize accView;
@synthesize lastTime;
@synthesize morseString;
@synthesize stalling;
@synthesize curTimer;
@synthesize morseDict;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    theTextView.inputView = keyboardView;
    theTextView.inputAccessoryView = accView;
    morseString = [[NSMutableString alloc] init];
    [theButton setImage:[UIImage imageNamed:@"buttonSel.png"] forState:UIControlStateSelected];
    
    morseDict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0", nil] forKeys:[NSArray arrayWithObjects:@".-", @"-...", @"-.-.", @"-..", @".", @"..-.", @"--.", @"....", @"..", @".---", @"-.-", @".-..", @"--", @"-.", @"---", @".--.", @"--.-", @".-.", @"...", @"-", @"..-", @"...-", @".--", @"-..-", @"-.--", @"--..", @".----", @"..---", @"...--", @"....-", @".....", @"-....", @"--...", @"---..", @"----.", @"-----", nil]];
    
    [systemTest runTest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doneEditing:(id)sender {
    [theTextView resignFirstResponder];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    textView.text = @"";
}

- (IBAction)touched:(id)sender {
    [self addText:[[NSDate date] timeIntervalSince1970] - lastTime];
    stalling = true;
    curTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(processText) userInfo:nil repeats:false];
}

- (IBAction)touchDown:(id)sender {
    lastTime = [[NSDate date] timeIntervalSince1970];
    [curTimer invalidate];
    stalling = false;
}

- (void)addText:(double)time
{
    if(time < 0.2)
    {
        [morseString appendString:@"."];
    }
    else if(time < 0.6)
        [morseString appendString:@"-"];
    else
    {
        theTextView.text = [theTextView.text substringToIndex:theTextView.text.length-1];
        [morseString setString:@""];
    }
}

- (void)processText
{
    if(stalling && morseString.length > 0)
    {
        if([morseDict objectForKey:morseString])
            theTextView.text = [NSString stringWithFormat:@"%@%@", theTextView.text, [morseDict objectForKey:morseString]];
        [morseString setString:@""];
        
        //curTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(processText) userInfo:nil repeats:false];
    }
    /*else if(stalling)
    {
        theTextView.text = [NSString stringWithFormat:@"%@ ", theTextView.text];
        stalling = false;
    }*/
}

- (IBAction)spaceButton:(id)sender {
    theTextView.text = [NSString stringWithFormat:@"%@ ", theTextView.text];
}

- (IBAction)spaceButtonAlt:(id)sender {
    theTextView.text = [NSString stringWithFormat:@"%@ ", theTextView.text];
}
@end
