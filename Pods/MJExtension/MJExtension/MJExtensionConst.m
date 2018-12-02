#ifndef __MJExtensionConst__M__
#define __MJExtensionConst__M__

#import <Foundation/Foundation.h>

/**
 *  成员变量类型（属性类型）
 */
NSString *const MJPropertyTypeInt = @"i";//int
NSString *const MJPropertyTypeShort = @"s";//short
NSString *const MJPropertyTypeFloat = @"f";//float
NSString *const MJPropertyTypeDouble = @"d";//double
NSString *const MJPropertyTypeLong = @"l";//long
NSString *const MJPropertyTypeLongLong = @"q";//long long
NSString *const MJPropertyTypeChar = @"c";// unsigned char
NSString *const MJPropertyTypeBOOL1 = @"c";//?
NSString *const MJPropertyTypeBOOL2 = @"b";//?
NSString *const MJPropertyTypePointer = @"*";// c 语言的字符串

NSString *const MJPropertyTypeIvar = @"^{objc_ivar=}";// ???
NSString *const MJPropertyTypeMethod = @"^{objc_method=}";// ??
NSString *const MJPropertyTypeBlock = @"@?";// block
NSString *const MJPropertyTypeClass = @"#";// 类的对象
NSString *const MJPropertyTypeSEL = @":";// 方法
NSString *const MJPropertyTypeId = @"@";//对象

#endif
