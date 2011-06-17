//
//  TextController.h
//  DisplayBoard
//
//  Created by Sonny on 10/1/10.
//  Copyright 2010 SonsterMedia. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TextController : UIViewController <UIApplicationDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
	IBOutlet UILabel * textcontroller_label;
	UIImagePickerController* imagePickerController;
	IBOutlet UITextField * textfield;
}
@property (nonatomic,retain) IBOutlet UILabel * textcontroller_label;
-(IBAction)done;
-(IBAction)ChangeText;
-(IBAction)fontSizeChange:(id)sender;
-(IBAction)ColorvalChanged: (id) sender;
-(IBAction)TextColorvalChanged:(id) sender;
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo;
//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
//-(IBAction)pickImageFromLibrary;

@end
