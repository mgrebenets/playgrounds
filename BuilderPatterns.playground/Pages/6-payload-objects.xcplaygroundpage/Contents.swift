//: [Main](1-main)

import UIKit

/*:
 ## Payload Objects
 
 The idea is to pass a special *Payload Object* between view controllers. Payload object can be anything, any kind of loosely typed object, for example `[String: AnyObject]` dictionary or a tuple. Anything, but model itself.
 
 ## Pros
 
 Solves the original problem, and that's the end of pros.
 
 ## Cons

 Using dictionaries for heterogenous objects forces us to use `AnyObject`, which is not type safe.
 
 Each app will come up with its own type of payload object, its own way to name the keys, and so on.
 
 We are creating a whole new class of bugs just because payload object can be invalid by itself.
 
 No single approach that all the developers are familiar with. We will end up with endless arguments like "but that's how we do it in CommBank / Tablet / <Other Project Name>".
 */

