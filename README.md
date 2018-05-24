# Kotlin Native iOS 
Kotlin-native ios experimental | [video](https://gaming.youtube.com/watch?v=9LrLrnD5p7I&feature=share)

![](/assets/kotlinNative.gif)


### Console Async
```
Simulator session started with process 8450

pthread[0x604000004f88] -> application : <UIApplication: 0x7fbcb1900750>
pthread[0x604000005088] -> viewDidLoad 
pthread[0x60000000f728] -> applicationDidBecomeActive : <UIApplication: 0x7fbcb1900750>
pthread[0x60000000f798] -> prepare : Optional("Victor, Bolin")
pthread[0x60000000fd58] -> viewDidLoad : Hello from Kotlin!
pthread[0x604000005028] -> applicationWillResignActive : <UIApplication: 0x7fbcb1900750>
pthread[0x60000000f728] -> applicationDidEnterBackground : <UIApplication: 0x7fbcb1900750>
pthread[0x6000000047c8] -> applicationWillEnterForeground : <UIApplication: 0x7fbcb1900750>
pthread[0x604000007378] -> applicationDidBecomeActive : <UIApplication: 0x7fbcb1900750>
```


### Framework Kotlin 

```kotlin
import kotlinx.cinterop.*
import platform.posix.*
import platform.posix.errno_t

class KotlinNativeFramework( ) {
    fun hi() = "Hello from Kotlin!"
    fun fullName(f: String, s: String) = "$s, $f"

    fun printAsync(str : String) = processor<String> { str }

    private inline fun <reified T> processor(crossinline action : ()-> T ) {
        val arena = Arena()
        memScoped {
            val thread = alloc<pthread_tVar>()
            val rc = pthread_create(thread.ptr, null, staticCFunction {
                _argC ->
                initRuntimeIfNeeded()
                val arg = konan.worker.attachObjectGraph<T>(_argC)
                println(arg)
                null as COpaquePointer?
            },konan.worker.detachObjectGraph { "pthread[${thread.rawPtr}] -> ${action()}" } )
            pthread_join(thread.value, null)

            if (rc != 0)
                errExitEN(rc, "pthread_create")

            pthread_join(thread.value, null)
        }
        arena.clear()
    }

    private fun errExitEN(en: Int, msg: String) {
        do {
            h_errno = en;
            perror(msg);
            exit(EXIT_FAILURE);
        } while (true)
    }

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


--->>> [Repo: Kotlin  Koans](https://github.com/vicboma1/Kotlin-Koans)  <<<---

--->>>  [Repo: Getting Started Kotlin](https://github.com/vicboma1/GettingStartedKotlin)   <<<---

--->>>   [Repo: Problems Kotlin](https://github.com/vicboma1/Kotlin-Examples-Problems/blob/master/README.md)   <<<---

--->>>   [Repo: GameBoy Emulator Enviroment](https://github.com/vicboma1/GameBoyEmulatorEnvironment)   <<<---

--->>>   [Repo: Kotlin Mobile](https://github.com/vicboma1/KotlinMobilePoC_MasterUV2018)   <<<---

--->>> [Repo: Kotlin JavaScript](https://github.com/vicboma1/kotlinJavaScript)  <<<---
