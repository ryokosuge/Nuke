//
//  WebPDecoder.h
//  NukeWebP
//
//  Created by nagisa-kosuge on 2018/01/12.
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

