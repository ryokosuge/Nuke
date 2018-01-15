//
//  NukeWebPMacros.h
//  NukeWebP
//
//  Created by nagisa-kosuge on 2018/01/15.
//  Copyright © 2018年 RyoKosuge. All rights reserved.
//

#import <TargetConditionals.h>

#ifndef NukeWebPMacros_h
#define NukeWebPMacros_h

#if !TARGET_OS_IPHONE && !TARGET_OS_IOS && !TARGET_OS_TV && !TARGET_OS_WATCH
    #define NUKE_WEBP_MAC 1
#else
    #define NUKE_WEBP_MAC 0
#endif

#if TARGET_OS_IOS || TARGET_OS_TV
    #define NUKE_WEBP_UIKIT 1
#else
    #define NUKE_WEBP_UIKIT 0
#endif

#if TARGET_OS_IOS
    #define NUKE_WEBP_IOS 1
#else
    #define NUKE_WEBP_IOS 0
#endif

#if TARGET_OS_TV
    #define NUKE_WEBP_TV 1
#else
    #define NUKE_WEBP_TV 0
#endif

#if TARGET_OS_WATCH
    #define NUKE_WEBP_WATCH 1
#else
    #define NUKE_WEBP_WATCH 0
#endif

#endif /* NukeWebPMacros_h */
