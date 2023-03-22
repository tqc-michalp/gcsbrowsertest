## gcsbrowsertest


## METADATA

* Project name: gcsbrowsertest
* Owner: Createview AS
* License: It is a property of [Createview AS](https://createview.ai/). All rights reserved.


## ABOUT
gcsbrowsertest is a simple frontend to a Gogle Cloud Storage bucket.


## DECISIONS


#### CORE LOGIC

1. n/a


#### PATTERNS

1. Wrapper dir to keep objects calling external APIs,
1. The Facade directory contains files that implement the Facade design pattern. This pattern is used to provide a uniform interface to clients while hiding the implementation details of the underlying subsystems. In this context, each Facade implementation is responsible for retrieving data from a specific source, but clients interact with them using the same interface.
