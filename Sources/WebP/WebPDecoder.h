//
//  WebPDecoder.h
//  NukeWebP
//
//  Created by ryokosuge on 2018/01/12.
//  Copyright © 2018年 RyoKosuge. All rights reserved.
//

#import "NukeWebPMacros.h"

#if NUKE_WEBP_MAC
    #import <AppKit/AppKit.h>
    #define Image   NSImage
#else
    #if NUKE_WEBP_UIKIT
        #import <UIKit/UIKit.h>
    #endif
    #define Image   UIImage
#endif

@interface WebPDecoder : NSObject

+ (nullable Image * )decodeWebPData:(nonnull NSData *)data;

@end

