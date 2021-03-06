    //
//  FullScreenView.m
//  DisplayBoard
//
//  Created by Sonny on 9/22/10.
//  Copyright 2010 SonsterMedia. All rights reserved.
//

#import "FullScreenView.h"
#include <QuartzCore/QuartzCore.h>
#import "TextController.h"


@implementation FullScreenView
@synthesize fullscreenLabel, labeltext, labelcolor, nav,views,background;
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


-(void)changeTextColor{
	fullscreenLabel.textColor = [UIColor whiteColor];	
}


-(IBAction)editTextSettings{
	//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"displayboard://settings?debug=true"]];
	TextController *tvc = [[TextController alloc] initWithNibName:@"TextControllerMobile" bundle:nil];
	tvc.modalPresentationStyle = UIModalPresentationFormSheet;
	tvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	tvc.textcontroller_label.text = fullscreenLabel.text;
	[self presentModalViewController:tvc animated:YES];
	
}


-(IBAction)dimiss{
	[self dismissModalViewControllerAnimated:YES];
}


-(void)toggleNav{
	if (navHidden == YES)
	{
		[nav setHidden:NO];
		navHidden = NO;
	}
	else
	{
		[nav setHidden:YES];
		navHidden = YES;
        
	}
		       
}
	








- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	NSUInteger tapCount = [touch tapCount];
	switch (tapCount) {
		case 2:
		//	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(singleTapMethod) object:nil];
			[self toggleNav];
			break;
		default:
			break;
		}
}




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
-(void)viewDidLoad {
	/*
	UIGraphicsBeginImageContext(self.view.bounds.size);
	[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
	UIGraphicsEndImageContext();
	*/
    [super viewDidLoad];
	[background setBackgroundColor:[UIColor whiteColor]];
	fullscreenLabel.text = labeltext;
	//fullscreenLabel.textColor = labelcolor;
	
}


-(void)colorWhite{
	UIColor *backgroundcol = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"grid.png"]];
	[background setBackgroundColor:backgroundcol];
	[backgroundcol release];
	
}


-(void)colorBlanko{
	[background setBackgroundColor:[UIColor whiteColor]];
	}


-(void)colorPureBlack{
	[background setBackgroundColor:[UIColor blackColor]];
}


-(void)colorBlack{
	
	UIColor *backgroundcol = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"BlackBoard.png"]];
	[background setBackgroundColor:backgroundcol];
	[backgroundcol release];
	
}
-(void)colorRed{
	UIColor *backgroundcol = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"yellowpaper.png"]];
	[background setBackgroundColor:backgroundcol];
	[backgroundcol release];
	
}
-(void)colorBlue{
	UIColor *backgroundcol = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Woven.png"]];
	[background setBackgroundColor:backgroundcol];
	[backgroundcol release];
	
}
-(void)colorGreen{
	UIColor *backgroundcol = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Metal.png"]];
	[background setBackgroundColor:backgroundcol];
	[backgroundcol release];
	
}


-(IBAction)valChanged: (id) sender{
	
	int values;
	values = ((UISegmentedControl*) sender).selectedSegmentIndex;
	
	
	NSLog(@"Value: %d", values);
	
	switch (values) {
		case 0:
			[self colorWhite];
			break;
		case 1:
			[self colorBlack];
			break;
		case 2:
			
			[self colorRed];
						
		//	[background setBackgroundColor:[UIColor redColor]];	
			break;
		case 3:
			[self colorBlue];	
			break;
		case 4:
			[self colorGreen];
			break;
		default:
			[background setBackgroundColor:[UIColor whiteColor]];	
			break;
	}
	
	
	
}




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	if (interfaceOrientation == UIDeviceOrientationLandscapeLeft){
		return YES;
	}
	else if (interfaceOrientation == UIDeviceOrientationLandscapeRight){
		return YES;
	}
	
	
	else{
		return NO;
	}
	
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[fullscreenLabel release];
	[labeltext release];
	[labelcolor release];
    [background release];
    [views release];
	[nav release];
}


@end
