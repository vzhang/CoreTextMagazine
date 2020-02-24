//
//  CTView.m
//  CoreTextMagazine
//
//  Created by Ming Zhang on 2020/2/24.
//  Copyright © 2020 Ming Zhang. All rights reserved.
//

#import "CTView.h"

@implementation CTView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    CFStringRef textString = CFSTR("Hello World");
    CFMutableAttributedStringRef attrString = CFAttributedStringCreateMutable(kCFAllocatorDefault, 0);
    CFAttributedStringReplaceString(attrString, CFRangeMake(0, 0), textString);
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(attrString);
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);

    CTFrameDraw(frame, context);
    
    CFRelease(attrString);
    CFRelease(path);
    CFRelease(frame);
    CFRelease(framesetter);
    
}


@end
