//: [Main](1-main)

import UIKit

/*:
 ## Builder Pattern with Closures
 
 This looks rather like a spin-off from original Builder pattern.
 
 Check details description [at this link](https://github.com/ochococo/Design-Patterns-In-Swift?hc_location=ufi#-builder)
 
 In general, it's a [Builder Pattern with `var`s](10-builder-pattern-with-vars), which also adds up a way to configure builder using closures.
 ## Pros
 
 Same as for builder with vars.
 
 ## Cons
 
 It feels like the closures are used for the sake of using closures. 
 
 It's an attempt to add the actual building blocks functionality to the var-only builder.
 
 The same functionality can be achieved by just setting var values directly. There's no way to enforce the use of closures only, so they appear to be redundant.
 */

