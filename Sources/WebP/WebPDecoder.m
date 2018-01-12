//
//  WebPDecoder.m
//  NukeWebP
//
//  Created by ryokosuge on 2018/01/12.
//

#import "WebPDecoder.h"
#import "webp/decode.h"

void free_image_data(void *info, const void *data, size_t size) {
    if (info != NULL) {
        WebPFreeDecBuffer(&((WebPDecoderConfig *) info)->output);
        free(info);
    }

    free((void *) data);
}

@implementation WebPDecoder

+ (nullable UIImage *)decodeWebPData:(nonnull NSData *)data {

    WebPDecoderConfig *config = malloc(sizeof(WebPDecoderConfig));
    
    if (!WebPInitDecoderConfig(config)) {
        return nil;
    }

    if (WebPGetFeatures([data bytes], [data length], &config->input) != VP8_STATUS_OK) {
        return nil;
    }

    config->output.colorspace = config->input.has_alpha != 0 ? MODE_RGBA : MODE_RGB;

    if (WebPDecode([data bytes], [data length], config) != VP8_STATUS_OK) {
        return nil;
    }
    
    int width = config->input.width;
    int height = config->input.height;

    uint8_t *rgbaData;

    if (config->input.has_alpha != 0) {
        rgbaData = WebPDecodeRGBA([data bytes], [data length], &width, &height);
    } else {
        rgbaData = WebPDecodeRGB([data bytes], [data length], &width, &height);
    }

    int components = config->input.has_alpha != 0 ? 4 : 3;

    CGDataProviderRef provider = CGDataProviderCreateWithData(config, rgbaData, config->options.scaled_width * config->options.scaled_width * components, free_image_data);
    if (!provider) {
        return nil;
    }

    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaLast;
    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;

    CGImageRef imageRef = CGImageCreate(width, height, 8, components * 8, components * width, colorSpaceRef, bitmapInfo, provider, NULL, YES, renderingIntent);
    if (!imageRef) {
        return nil;
    }

    UIImage *result = [UIImage imageWithCGImage:imageRef];

    CGImageRelease(imageRef);
    CGColorSpaceRelease(colorSpaceRef);
    CGDataProviderRelease(provider);

    return result;
}

@end
