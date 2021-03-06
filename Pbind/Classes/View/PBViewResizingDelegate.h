//
//  PBViewResizingDelegate.h
//  Pbind <https://github.com/wequick/Pbind>
//
//  Created by Galen Lin on 2016/11/14.
//  Copyright (c) 2015-present, Wequick.net. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PBViewResizingDelegate <NSObject>

- (void)viewDidChangeFrame:(UIView *)view;

@end
