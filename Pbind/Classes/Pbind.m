//
//  Pbind.m
//  Pbind <https://github.com/wequick/Pbind>
//
//  Created by Galen Lin on 16/8/31.
//  Copyright (c) 2015-present, Wequick.net. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "Pbind+API.h"
#import "UIView+Pbind.h"

@implementation Pbind : NSObject

static const CGFloat kDefaultSketchWidth = 1080.f;
static CGFloat kValueScale = 0;
static NSMutableArray *kResourcesBundles = nil;

+ (void)setSketchWidth:(CGFloat)sketchWidth {
    kValueScale = [UIScreen mainScreen].bounds.size.width / sketchWidth;
}

+ (CGFloat)valueScale {
    if (kValueScale == 0) {
        kValueScale = [UIScreen mainScreen].bounds.size.width / kDefaultSketchWidth;
    }
    return kValueScale;
}

+ (void)addResourcesBundle:(NSBundle *)bundle {
    if (kResourcesBundles == nil) {
        kResourcesBundles = [[NSMutableArray alloc] init];
        [kResourcesBundles addObject:[NSBundle mainBundle]];
    }
    
    if ([kResourcesBundles indexOfObject:bundle] != NSNotFound) {
        return;
    }
    [kResourcesBundles insertObject:bundle atIndex:0];
}

+ (NSArray<NSBundle *> *)allResourcesBundles {
    if (kResourcesBundles == nil) {
        kResourcesBundles = [[NSMutableArray alloc] init];
        [kResourcesBundles addObject:[NSBundle mainBundle]];
    }
    return kResourcesBundles;
}

+ (void)reloadViewsOnPlistUpdate:(NSString *)plist {
    // TODO: reload the specify views that using the plist.
    UIViewController *controller = PBTopController();
    [controller.view pb_reloadPlist];
}

+ (void)reloadViewsOnAPIUpdate:(NSString *)action {
    // TODO: reload the specify views that using the API.
    UIViewController *controller = PBTopController();
    [controller.view pb_reloadClient];
}

@end