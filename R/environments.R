# Environments
# see http://digitheadslabnotebook.blogspot.ca/2011/06/environments-in-r.html
# and
# see http://adv-r.had.co.nz/Environments.html

# At first glance, environments are simple enough: an environment is just a place to store variables. 
# If you start up R and make an assignment, you're adding an entry to the global environment.

# Most functional languages have some concept of environments, which serves as a higher level of abstraction over implementation details like allocating variables on the heap or stack.
# Saying that environments are "first-class", which in R they are, means that you can manipulate them from within the langauge.
# Several advanced language features of R are built out of environments.

# The R Language definition provides the following definition:

##  Environments can be thought of as consisting of two things: a frame, which is a
##  set of symbol-value pairs, and an enclosure, a pointer to an enclosing
##  environment. When R looks up the value for a symbol the frame is examined and if
##  a matching symbol is found its value will be returned. If not, the enclosing
##  environment is then accessed and the process repeated.
##  Environments form a tree structure in which the enclosures play the role of 
##  parents. The tree of environments is rooted in an empty environment, available
##  through emptyenv(), which has no parent.

# You can make a new environment with new.env() and assign a couple of variables.

a <- "hello"
my.env <- new.env()
my.env # show the address of the new environment
ls(my.env) # my.env is an empty character value in the global environment
assign("goodbye", 999, envir=my.env) # create a variable "goodbye" with the value 999 in my.env
my.env$foo = "This is the variable foo."
ls(my.env) # shows the variables in my.env
parent.env(my.env) # Returns R_GlobalEnv, the global environment

# Note that we have two variables named a: one in the global environment and one in my.env.

# A variable can be accessed using get or the dollar operator. 
# By default, get continues up the chain of parents until it either finds a binding or reaches the empty environment.
# The dollar operator looks specifically in the given environment.

b <- 4567
get ('a', envir=my.env) # will return 999
get ('b', envir=my.env) # will find nothing in my.env so will go up to its parent, here the global environment, and find b is 4567
my.env$a # will return 999
my.env$b # will return NULL

# Functions have their own environments. The language definition provides:

##  Functions (or more precisely function closures) have three basic components:
##  a formal argument list, a body, and an environment. [...] A function's environment
##  is the environment that was active at the time that the function was created. [...]
##  When a function is called, a new environment (called the evaluation environment)
##  is created, whose enclosure is the environment from the function closure. This new
##  environment is initially populated with the unevaluated arguments to the function;
##  as evaluation proceeds, local variables are created within it.

createCounter <- function(value) { 
    function(i) {
      value <<- value + i
    }
}

# Note the use of the special <<- assignment operator. If we had used the normal
# assignment operator, we would have created a new variable, 'value' in the
# evaluation environment masking the value in the function closure environment.
# That environment disappears as soon as the function returns, sending our new
# value into the ether. What we want to do is change the value in the function closure
# environment, so that assignments to value will be persistent across invocations
# of counter. Mutable state is generally not the default in functional languages,
# so we have to use the special assignment operator.

# put another way, <- always creates a binding in the current environment;
# <<- rebinds an existing name in a parent of the current environment


counter <- createCounter(0)
counter(1)
a <- counter(0)
a
counter(1)
counter(1)
a <- counter(1)
a
a <- counter(5)
a

# Note that each name is a pointer to an object stored elsewhere in memory:
e <- new.env()
e$a <- FALSE
e$b <- "a"
e$c <- 2.3
e$d <- 1:3

# Because the objects don't live in the environment, multiple names can point to the same object:
e$a <- e$d #e$a has been remapped to point to the same object that e$d points to (we haven't just copied the value in e$d to e$a, we've copied the reference)

# We can also point to different objects that have the same value
e$a <- 1:3 #e$a resolves to the same value as it did when it pointed to the same object as e$d but now a change to e$d will not change e$a

# R is a garbage collected language, so when an object has no names pointing to is, it gets automatically deleted by the gc.

# We use the metaphor of a family to refer to environments. The grandparent of an environment is the parent's parent, and the ancestors include all parent environments up to the empty environment.
# It's rare to talk about the children of environments because there are no back links: given an environment we have no way to find its children.

# There are four special environments:
#
# * The global environment ("globalenv()"). The parent of the global environment is the last package you attached with library() or require().
# * The base environment ("baseenv()"). This is the environment of the base package. Its parent is the empty environment
# * The emptyenv(). This is the ultimate ancestor of all environments, and the only environment without a parent.
# * The environment() is the current environment.

# search() lists all parents of the global environment. This is called the search path because objects in these environments can be found from the top-level interactive workspace.
# You can access any environment on the search list using as.environment()

search()
as.environment("package:stats")

# To create an environment manually, use new.env(). You can list the bindings in the environment's frame with:
# ls()
# and see its parent with
# parent.env()
# another useful way to view an environment is ls.str()

# Deleting objects from environments works a little differently from lists. With a list you can remove an entry by setting it to NULL. In environments, that will create a new binding to NULL. Instead, use rm() to remove the binding.

# Function environments
# Most environments are not created by yoiu with new.env() but are created as a consequence of using functions.
# This section discusses the four types of environments associated with a function:
# enclosing, binding, execution, and calling.

# The enclosing environment
# When a function is created, it gains reference to the environment where it was made.
# This is the enclosing environment and is used for lexical scoping.
# You can determine the enclosing environment of a function by calling environment() with a function as its first argument:
y <- 1
f <- function(x) x + y
environment(f) # returns <environment: R_GlobalEnv>

# Binding environments
# The name of a function is defined by a binding.
# The binding environments of a function are all the environments which have a binding to it.
y <- 1 # y is a binding in globalenv()
e <- new.env()
e$g <- function() 1 # g is name in e.
# The enclosing environment belongs to the function, and never changes, even if the function is moved to a different environment.
# The enclosing environment determines how the function finds values; the binding environments determine how we find the function.

# Execution environments
# What will the following function return the first time it's run? What about the second?
g <- function(x) {
  if (!exists("a", inherits = FALSE)) {
    message("Defining a")
    a <- 1
  } else {
    a <- a + 1
  }
  a
}
g(10)
g(10)

# This function returns the same value every time it is called because of the "fresh start" principle.
# Each time a function is called, a new environment is created to host execution. 
# The parent of the execution environment is the enclosing environment of the function.
# Once the function has completed, this environment is thrown away.

# When you create a function inside another function, the enclosing environment of the child function is the execution environment of the parent, and the execution environment is no longer ephemeral.
# The following example illustrates that idea with a function factory, plus().
# We use that factory to create a function called plus_one(). 
# The enclosing environment of plus_one() is the execution environment of plus() where x is bound to the value 1:
plus <- function(x) {
  function(y) x + y
}
plus_one <- plus(1)

# Calling environments
# Look at the following code. What do you expect i() to return when the code is run?
h <- function() {
  x <- 10
  function() {
    x
  }
}
i <- h()
x <- 20
i()
# The top-level x (bound to 20) is a red herring: using the regular scoping rules, h() looks first where it is defined and finds that the value associated with x is 10.
# However, it's still meaningful to ask what value x is associated within the environment where i() is called: x is 10 in the environment where h() is defined, but it is 20 in the environment where h() is called.
# We can access this environment using the unfortunately-named parent.frame(). 
# This function returns the environment where the function was called. 
# We can also use this function to look up the value of names in that environment:
f2 <- function () {
  x <- 10
  function() {
    def <- get("x", environment())
    cll <- get("x", parent.frame())
    list(defined = def, called = cll)
  }
}
g2 <- f2()
x <- 20
str(g2())

# In more complicated scenarios, there's not just one parent call, but a sequence of calls which lead all the way back to the initiating functioned, called from the top-level.

# The regular assignment arrow, <-, always creates a variable in the current environment.
# The deep assignment arrow, <<-, NEVER creates a variable in the current environment, but instead modifies and existing variable found by walking up the parent environments.
# You can also do deep binding with assign(): 
#     name <<- value
# is equivalent to:
#     assign("name", value, inherits = TRUE)

# If <<- doesn't find an existing variable, it will create one in the global environment.







