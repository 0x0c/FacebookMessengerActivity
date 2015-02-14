//
//  FacebookMessengerActivity.m
//  NewsPacker
//
//  Created by Akira Matsuda on 2014/05/27.
//  Copyright (c) 2014年 Akira Matsuda. All rights reserved.
//

#import "M2DFacebookMessengerActivity.h"

@implementation M2DFacebookMessengerActivity

+ (UIActivityCategory)activityCategory
{
	return UIActivityCategoryAction;
}

- (instancetype)initWithCompletionHandler:(FBDialogAppCallCompletionHandler)handler
{
	self = [super init];
	if (self) {
		self.handler = handler;
	}
	
	return self;
}

- (NSString *)activityType
{
    return @"com.uiactivity.akira.matsuda.fbmessenger";
}

- (UIImage *)activityImage
{
  UIImage *image =  [UIImage imageNamed:@"FacebookMessenger.png"];
  if (image==nil) {
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"FacebookMessengerActivity"
                                                 ofType:@"bundle"]];
    image = [UIImage imageNamed:@"FacebookMessenger.png"
                       inBundle:bundle
  compatibleWithTraitCollection:nil];
  }
  return image;
}

- (NSString *)activityTitle
{
    return @"Messenger";
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
	for (id activityItem in activityItems) {
		if ([activityItem isKindOfClass:[NSURL class]]) {
			FBLinkShareParams *params = [[FBLinkShareParams alloc] init];
			params.link = activityItem;
			if ([FBDialogs canPresentMessageDialogWithParams:params]) {
				return YES;
			}
			else {
				return NO;
			}
		}
	}
	
	return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
	[super prepareWithActivityItems:activityItems];
	
	NSString *shareTitle = nil;
	NSURL *shareURL = nil;
	for (id activityItem in activityItems) {
		if ([activityItem isKindOfClass:[NSURL class]]) {
			shareURL = activityItem;
		}
		else if ([activityItem isKindOfClass:[NSString class]]) {
			shareTitle = activityItem;
		}
	}
	if (shareURL != nil) {
		[FBDialogs presentMessageDialogWithLink:shareURL name:shareTitle handler:self.handler ?: ^(FBAppCall *call, NSDictionary *results, NSError *error) {
			if(error) {
				// An error occurred, we need to handle the error
				// See: https://developers.facebook.com/docs/ios/errors
				UIAlertView *alert = [[UIAlertView alloc] initWithTitle:error.localizedDescription message:error.localizedFailureReason delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
				[alert show];
			}
		}];
	}
}

- (UIViewController *)activityViewController
{
	return nil;
}

- (void)performActivity
{
	[super activityDidFinish:YES];
	
}

- (void)activityDidFinish:(BOOL)completed
{
	[super activityDidFinish:completed];
}

@end
