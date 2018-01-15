//
//  WebPDecoder.h
//  NukeWebP
//
//  Created by nagisa-kosuge on 2018/01/12.
//

#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
    #import <UIKit/UIKit.h>
    #define Image UIImage
#else
    #import <Cocoa/Cocoa.h>
    #define Image NSImage
#endif

@interface WebPDecoder : NSObject

+ (nullable Image * )decodeWebPData:(nonnull NSData *)data;

@end

