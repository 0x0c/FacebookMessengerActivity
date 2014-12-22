//
//  FacebookMessengerActivity.h
//  NewsPacker
//
//  Created by Akira Matsuda on 2014/05/27.
//  Copyright (c) 2014年 Akira Matsuda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface M2DFacebookMessengerActivity : UIActivity

@property (nonatomic, strong) FBDialogAppCallCompletionHandler handler;

- (instancetype)initWithCompletionHandler:(FBDialogAppCallCompletionHandler)handler;

@end
