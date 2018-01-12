//
//  WebPDecoder.h
//  NukeWebP
//
//  Created by nagisa-kosuge on 2018/01/12.
//

#import <UIKit/UIKit.h>

@interface WebPDecoder : NSObject

+ (nullable UIImage * )decodeWebPData:(nonnull NSData *)data;

@end
