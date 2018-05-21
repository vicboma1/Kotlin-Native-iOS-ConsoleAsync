//
//  KotlinNativeFramework.kt
//  KotlinNativeFramework
//
//  Created by Victor Bolinches Marin on 17/05/2018.
//  Copyright © 2018 Victor Bolinches Marin. All rights reserved.
//

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
                val arg = konan.worker.attachObjectGraph<T>(stable = _argC)
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


