# Kotlin Native iOS  (WIP)
Kotlin-native ios experimental | [video](https://gaming.youtube.com/watch?v=9LrLrnD5p7I&feature=share)

![](/assets/kotlinNative.gif)


### Framework Kotlin 

```kotlin
import kotlinx.cinterop.*
import platform.posix.*

class KotlinNativeFramework( ) {
    fun hi() = "Hello from Kotlin!"
    fun fullName(f : String, s : String ) = "$s, $f"
}
```

### Parse to Objective-C

```objective-c
#import <Foundation/Foundation.h>

@class KNFKotlinNativeFramework;

NS_ASSUME_NONNULL_BEGIN

@interface KotlinBase : NSObject
-(instancetype) init __attribute__((unavailable));
+(instancetype) new __attribute__((unavailable));
+(void)initialize __attribute__((objc_requires_super));
@end;

@interface KotlinBase (KotlinBaseCopying) <NSCopying>
@end;

__attribute__((objc_runtime_name("KotlinMutableSet")))
@interface KNFMutableSet<ObjectType> : NSMutableSet<ObjectType>
@end;

__attribute__((objc_runtime_name("KotlinMutableDictionary")))
@interface KNFMutableDictionary<KeyType, ObjectType> : NSMutableDictionary<KeyType, ObjectType>
@end;

@interface NSError (NSErrorKotlinException)
@property (readonly) id _Nullable kotlinException;
@end;

__attribute__((objc_subclassing_restricted))
@interface KNFKotlinNativeFramework : KotlinBase
-(instancetype)init NS_SWIFT_NAME(init()) NS_DESIGNATED_INITIALIZER;
+ (instancetype)new OBJC_SWIFT_UNAVAILABLE("use object initializers instead");

-(NSString *)hi NS_SWIFT_NAME(hi());
-(NSString *)fullNameF:(NSString *)f s:(NSString *)s NS_SWIFT_NAME(fullName(f:s:));
@end;

NS_ASSUME_NONNULL_END
```
