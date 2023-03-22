## gcsbrowsertest


## METADATA

* Project name: gcsbrowsertest
* Owner: tqc-michalp
* License: It is a property of [Thinqcraft](https://www.thinqcraft.com/). All rights reserved.


## ABOUT
The objective of this application is to develop a user-friendly frontend for a Google Cloud storage bucket. The user interface (UI) should facilitate effortless navigation through the storage bucket and enable users to easily view and download files.


## DECISIONS


#### CORE LOGIC

1. n/a


#### PATTERNS

1. Wrapper dir to keep objects calling external APIs,
1. The Facade directory contains files that implement the Facade design pattern. This pattern is used to provide a uniform interface to clients while hiding the implementation details of the underlying subsystems. In this context, each Facade implementation is responsible for retrieving data from a specific source, but clients interact with them using the same interface.
