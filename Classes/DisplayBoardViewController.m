//
//  DisplayBoardViewController.m
//  DisplayBoard
//
//  Created by Sonny on 9/22/10.
//  Copyright 2010 SonsterMedia. All rights reserved.
//

#import "DisplayBoardViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "TemplateViewer.h"

@implementation UINavigationBar (UINavigationBarCategory)
//Used to change the NavBars Image
- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed: @"navigationbar.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}


@end

//http://www.ifullscreen.com/wallpapers/sci-fi/space/11-ipad-wallpaper_space_1024x1024.jpg
@implementation DisplayBoardViewController
@synthesize textbox, navbar, fullScreenView;
@synthesize scrollPages, scrollViewPreview;



-(void)BeginTempScreenView:(int)index{
	
	// Set up the create a temporary fullscreenview.
	TemplateViewer *full = [[TemplateViewer alloc] initWithNibName:@"TemplateViewerMobile" bundle:nil];
	full.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	
	
	
	
	switch (index) {
		case 0:
			full.labeltext = @"Hello";
			break;
		case 1:
			full.labeltext = @"Happy Birthday";
			break;
		case 2:
			full.labeltext = @"Yes";
			break;
		case 3:
			full.labeltext = @"No";
			break;
		case 4:
			full.labeltext = @"Go Team";
			break;
		case 5:
			full.labeltext = @"Welcome Home";
			break;
		case 6:
			full.labeltext = @"Reserved";
			break;
		case 7:
			full.labeltext = @"Open";
			break;
		case 8:
			full.labeltext = @"Closed";
			break;
		case 9:
			full.labeltext = @"iPad For Sale";
			break;
		default:
			full.labeltext = @"";
			break;
	}
	
	

[self presentModalViewController:full animated:YES]; // Present the view.
	
	[full release];
	
}	
	


-(IBAction)submit{
	

	[textbox resignFirstResponder];
}




-(IBAction)fullscreen{
	
	// Set up the create a temporary fullscreenview.
	FullScreenView *full = [[FullScreenView alloc] initWithNibName:@"FullScreenMobile" bundle:nil];
	full.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	full.labeltext = textbox.text;
	[self setFullScreenView:full]; // Set it to our property (nonatomic, retain).
	[full release]; // Clean up.
	
	[self presentModalViewController:fullScreenView animated:YES]; // Present the view.
	
}


- (BOOL)textFieldShouldReturn: (UITextField *)textField {
	//Return key dimisses keyboard
	[self fullscreen];
	[textField resignFirstResponder];
	return YES;
}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
	//dismisses keyboard if you touch outside textfield
	for (UIView* view in self.view.subviews) {
		if ([view isKindOfClass:[UITextField class]])
			[view resignFirstResponder];
	}
}

-(IBAction)clearTextField{
textbox.text= @"";	
	[textbox resignFirstResponder];
	
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	textbox.delegate = self;
	
    [super viewDidLoad];
	
	
	
	// We have some predefined images added to the project.
	self.scrollPages = [NSArray arrayWithObjects:@"Hello.png",
						@"happybirthday.png",
						@"yes.png",
						@"No.png",
						@"goteam.png",
						@"welcome_home.png",
						@"reserved.png",
						@"open.png",
						@"closed.png",
						@"ipadforsale.png",
						nil];
	
	// You can add the control programatically like so:
	// Position the scrollview. It will be centered in the portrait view. The viewSize defines the size 
	// of each item you want to display in your scroll view. The size of the "preview" on each side equals the
	// width of the frame minus the width of the "view", ie, 320 - 240 = 60 / 2 = 30. 
	//scrollViewPreview = [[BSPreviewScrollView alloc] initWithFrameAndPageSize:CGRectMake(0, 70, 320, 320) pageSize:CGSizeMake(240, 700)];
	
	[scrollViewPreview setBackgroundColor:[UIColor darkGrayColor]];
	scrollViewPreview.pageSize = CGSizeMake(480, 142);
	// Important to listen to the delegate methods.
	scrollViewPreview.delegate = self;
	//w[self.view addSubview:scrollViewPreview];
}


#pragma mark -
#pragma mark BSPreviewScrollViewDelegate methods
-(UIView*)viewForItemAtIndex:(BSPreviewScrollView*)scrollView index:(int)index
{
	// Note that the images are actually smaller than the image view frame, each image
	// is 210x280. Images are centered and because they are smaller than the actual 
	// view it creates a padding between each image. 
	CGRect imageViewFrame = CGRectMake(0.0f, 0.0f, 480, 135);

	
	// TapImage is a subclassed UIImageView that catch touch/tap events 
	TapImage *imageView = [[[TapImage alloc] initWithFrame:imageViewFrame] autorelease];
	imageView.userInteractionEnabled = YES;
	imageView.image = [UIImage imageNamed:[self.scrollPages objectAtIndex:index]];
	imageView.contentMode = UIViewContentModeCenter;
	imageView.positioninArray = index;
	
	
	
	return imageView;
}

-(int)itemCount:(BSPreviewScrollView*)scrollView
{
	// Return the number of pages we intend to display
	return [self.scrollPages count];
}





/*
 TAG GUIDE:
 
 Tags 101-117 are for the saved text controls
 
 Odd Tags (101, 103, etc...) are for the buttons with the exception of the last tag (117) which is for the advance button.
 Even Tags (102, 104, etc...) are for the text labels.
 
 All elements are automatically hidden in the app until they are programmatically shown.
 
 */

-(void)displaySavedContent
{

}




// Override to allow orientations other than the default portrait orientation.
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[textbox release];
	[navbar release];
	[scrollViewPreview release];
	[scrollPages release];
	

}

@end
