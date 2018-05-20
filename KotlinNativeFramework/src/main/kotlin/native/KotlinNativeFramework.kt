//
//  KotlinNativeFramework.kt
//  KotlinNativeFramework
//
//  Created by Victor Bolinches Marin on 17/05/2018.
//  Copyright © 2018 Victor Bolinches Marin. All rights reserved.
//

import kotlinx.cinterop.*
import platform.posix.*

class KotlinNativeFramework( ) {
    fun hi() = "Hello from Kotlin!"
    fun fullName(f : String, s : String ) = "$s, $f"
}