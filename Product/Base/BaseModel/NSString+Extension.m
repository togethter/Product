//
//  NSString+Extension.m
//  Product
//
//  Created by is on 2019/4/19.
//  Copyright © 2019 李学良. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (NSString *)mj_underlineFromCamel
{
  if (self.length == 0) return self;
  NSMutableString *string = [NSMutableString string];
  for (NSUInteger i = 0; i<self.length; i++) {
    unichar c = [self characterAtIndex:i];
    NSString *cString = [NSString stringWithFormat:@"%c", c];
    NSString *cStringLower = [cString lowercaseString];
    if ([cString isEqualToString:cStringLower]) {
      [string appendString:cStringLower];
    } else {
      [string appendString:@"_"];
      [string appendString:cStringLower];
    }
  }
  return string;
}

- (NSString *)mj_camelFromUnderline
{
  if (self.length == 0) return self;
  NSMutableString *string = [NSMutableString string];
  NSArray *cmps = [self componentsSeparatedByString:@"_"];
  for (NSUInteger i = 0; i<cmps.count; i++) {
    NSString *cmp = cmps[i];
    if (i && cmp.length) {
      [string appendString:[NSString stringWithFormat:@"%c", [cmp characterAtIndex:0]].uppercaseString];
      if (cmp.length >= 2) [string appendString:[cmp substringFromIndex:1]];
    } else {
      [string appendString:cmp];
    }
  }
  return string;
}

- (NSString *)mj_firstCharLower
{
  if (self.length == 0) return self;
  NSMutableString *string = [NSMutableString string];
  [string appendString:[NSString stringWithFormat:@"%c", [self characterAtIndex:0]].lowercaseString];
  if (self.length >= 2) [string appendString:[self substringFromIndex:1]];
  return string;
}

- (NSString *)mj_firstCharUpper
{
  if (self.length == 0) return self;
  NSMutableString *string = [NSMutableString string];
  [string appendString:[NSString stringWithFormat:@"%c", [self characterAtIndex:0]].uppercaseString];
  if (self.length >= 2) [string appendString:[self substringFromIndex:1]];
  return string;
}

- (BOOL)mj_isPureInt
{
  NSScanner *scan = [NSScanner scannerWithString:self];
  int val;
  return [scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)mj_isPureUnsignedLongLong {
  NSScanner *scan = [NSScanner scannerWithString:self];
  unsigned long long val;
  return [scan scanUnsignedLongLong:&val] && [scan isAtEnd];
}

- (NSUInteger)unsignedLongLongValue {
  
  NSScanner *scan = [NSScanner scannerWithString:self];
  unsigned long long val;
  BOOL isScanSuccess = [scan scanUnsignedLongLong:&val] && [scan isAtEnd];
  if (isScanSuccess) {
    return val;
  }
  return 0;
}
- (NSURL *)mj_url
{
  //    [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"!$&'()*+,-./:;=?@_~%#[]"]];
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
  return [NSURL URLWithString:(NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL,kCFStringEncodingUTF8))];
#pragma clang diagnostic pop
}


//@property (readonly) double doubleValue;
//@property (readonly) float floatValue;
//@property (readonly) int intValue;
//@property (readonly) NSInteger integerValue API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
//@property (readonly) long long longLongValue API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
//@property (readonly) BOOL boolValue API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));  // Skips initial space characters (whitespaceSet), or optional -/+ sign followed by zeroes. Returns YES on encountering one of "
@end
