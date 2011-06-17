    //
//  TextController.m
//  DisplayBoard
//
//  Created by Sonny on 10/1/10.
//  Copyright 2010 SonsterMedia. All rights reserved.
//
 
#import "TextController.h"
#import "DisplayBoardViewController.h"
#import "DisplayBoardAppDelegate.h"
#import "FullScreenView.h"
#import <QuartzCore/QuartzCore.h>

@implementation TextController
@synthesize textcontroller_label;

-(IBAction)done{
[self dismissModalViewControllerAnimated:YES];
}


-(IBAction)pickImageFromLibrary{
	
	imagePickerController = [[UIImagePickerController alloc] init];
	imagePickerController.delegate = self;
	imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	//DisplayBoardAppDelegate * appDel = (DisplayBoardAppDelegate *)[[UIApplication sharedApplication] delegate];
	[self.view addSubview:imagePickerController.view];
	
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
	// Dismiss the image selection, hide the picker and show the image view with the picked image
	[picker dismissModalViewControllerAnimated:YES];
	
	DisplayBoardAppDelegate * appDel = (DisplayBoardAppDelegate *)[[UIApplication sharedApplication] delegate];
	DisplayBoardViewController * mainView = appDel.viewController;
	FullScreenView * FullScreenViewReference = mainView.fullScreenView;
	
	
	UIColor *backgroundcol = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:image]];
	[FullScreenViewReference.background setBackgroundColor:backgroundcol];
	[backgroundcol release];
	
	
	//imagePickerController.view.hidden = YES;
	//imageView.image = image;
	//imageView.hidden = NO;
	//[window bringSubviewToFront:imageView];
}





- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
	//dismisses keyboard if you touch outside textfield
	for (UIView* view in self.view.subviews) {
		if ([view isKindOfClass:[UIViewController class]])
			[view resignFirstResponder];
	}
}


-(IBAction)ChangeText{

	DisplayBoardAppDelegate * appDel = (DisplayBoardAppDelegate *)[[UIApplication sharedApplication] delegate];
	DisplayBoardViewController * mainView = appDel.viewController;
	FullScreenView * FullScreenViewReference = mainView.fullScreenView;
	
	FullScreenViewReference.fullscreenLabel.text = textfield.text;
	[textfield resignFirstResponder];
	
	
/*	@try
	{
		Class UIKeyboardImpl = NSClassFromString(@"UIKeyboardImpl");
		id activeInstance = [UIKeyboardImpl performSelector:@selector(activeInstance)];
		[activeInstance performSelector:@selector(dismissKeyboard)];
	}
	@catch (NSException *exception)
	{
	}
 */
	
	
}


- (BOOL)textFieldShouldReturn: (UITextField *)textField {
	//Return key dimisses keyboard
	[textField resignFirstResponder];
	
	
	/*@try
	{
		Class UIKeyboardImpl = NSClassFromString(@"UIKeyboardImpl");
		id activeInstance = [UIKeyboardImpl performSelector:@selector(activeInstance)];
		[activeInstance performSelector:@selector(dismissKeyboard)];
	}
	@catch (NSException *exception)
	{
		NSLog(@"%@", exception);
	} 
	
	return YES;
     */
    
    return YES;
}





-(IBAction)fontSizeChange: (id) sender{
	int values;
	values = ((UIButton*) sender).tag;
	
	DisplayBoardAppDelegate * appDel = (DisplayBoardAppDelegate *)[[UIApplication sharedApplication] delegate];
	DisplayBoardViewController * mainView = appDel.viewController;
	FullScreenView * FullScreenViewReference = mainView.fullScreenView;
	
	NSLog(@"Value: %d", values);
	
	switch (values) {
		case 15:
			FullScreenViewReference.fullscreenLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];	
			break;
		case 16:
			FullScreenViewReference.fullscreenLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.0];	
			break;
		case 17:
			FullScreenViewReference.fullscreenLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:24.0];	
			break;
		case 18:
			FullScreenViewReference.fullscreenLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:36.0];		
			break;
		case 19:
			FullScreenViewReference.fullscreenLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:50.0];		
			break;
		case 20:
			FullScreenViewReference.fullscreenLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:60.0];		
			break;
		case 21:
			FullScreenViewReference.fullscreenLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:70.0];	
			break;
		default:
			FullScreenViewReference.fullscreenLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:90.0];	
			break;
	}
	
}





-(IBAction)TextColorvalChanged: (id) sender{
	int values;
	values = ((UIButton*) sender).tag;
	
	DisplayBoardAppDelegate * appDel = (DisplayBoardAppDelegate *)[[UIApplication sharedApplication] delegate];
	DisplayBoardViewController * mainView = appDel.viewController;
	FullScreenView * FullScreenViewReference = mainView.fullScreenView;
	
	NSLog(@"Value: %d", values);
	
	switch (values) {
		case 1:
			FullScreenViewReference.fullscreenLabel.textColor = [UIColor blackColor];	
			break;
		case 2:
			FullScreenViewReference.fullscreenLabel.textColor = [UIColor whiteColor];
			break;
		case 3:
			FullScreenViewReference.fullscreenLabel.textColor = [UIColor redColor];
			break;
		case 4:
			FullScreenViewReference.fullscreenLabel.textColor = [UIColor blueColor];	
			break;
		case 5:
			FullScreenViewReference.fullscreenLabel.textColor = [UIColor yellowColor];	
			break;
		case 6:
			FullScreenViewReference.fullscreenLabel.textColor = [UIColor greenColor];	
			break;
		case 7:
			FullScreenViewReference.fullscreenLabel.textColor = [UIColor purpleColor];	
			break;
		default:
			[FullScreenViewReference colorWhite];
			break;
	}
	
}



-(IBAction)ColorvalChanged: (id) sender{
	int values;
	values = ((UIButton*) sender).tag;
	
	DisplayBoardAppDelegate * appDel = (DisplayBoardAppDelegate *)[[UIApplication sharedApplication] delegate];
	DisplayBoardViewController * mainView = appDel.viewController;
	FullScreenView * FullScreenViewReference = mainView.fullScreenView;
	
	NSLog(@"Value: %d", values);
	
	switch (values) {
		case 8:
			NSLog(@"111111");
			[FullScreenViewReference colorWhite];
			break;
		case 9:
			[FullScreenViewReference colorBlack];
			break;
		case 10:
			[FullScreenViewReference colorRed];	
			break;
		case 11:
			[FullScreenViewReference  colorBlue];	
			break;
		case 12:
			[FullScreenViewReference colorGreen];
			break;
		case 13:
			[FullScreenViewReference  colorBlanko];
			break;
		case 14:
			[FullScreenViewReference  colorPureBlack];
			break;
		default:
			[FullScreenViewReference colorWhite];
			 break;
	}

}






/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	textfield.layer.cornerRadius = 10;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
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
}


@end
