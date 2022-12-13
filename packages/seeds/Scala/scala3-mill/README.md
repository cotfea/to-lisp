# Scala3(dotty) seeds

## Test FrameWork

- scalameta.munit
  - https://scalameta.org/munit/
- scalatest
  - https://www.scalatest.org/

### seed

```bash
>> tree $dir

.
|-- build.sc
`-- example
    |-- src
    |   `-- Example.scala
    `-- test
        `-- src
            `-- ExampleTest.scala

4 directories, 3 files
```

- build.sc

```scala
import mill._, scalalib._

object example extends ScalaModule {
  def scalaVersion = "3.2.1"
}
```

#### munit

  https://scalameta.org/munit/docs/getting-started.html

- build.sc

```scala
object test extends Tests with TestModule.Munit {
  def ivyDeps =
    Agg(
      ivy"org.scalameta::munit::0.7.29"
    )
}
```

- ExampleTest.scala

```scala
class MySuite extends munit.FunSuite {
  test("hello") {
    val obtained = 42
    val expected = 42
    assertEquals(obtained, expected)
  }
  test("testFoo") {
    assert(true, "Test should pass")
  }

  test("testBar") {
    assert(true, "Test should pass")
  }
}
```

#### utest

- build.sc

```scala
object test extends Tests with TestModule.Utest {
  def ivyDeps = Agg(ivy"com.lihaoyi::utest:0.8.1")
}
```

```scala
object test extends Tests {
  def ivyDeps = Agg(ivy"com.lihaoyi::utest:0.8.1")
  def testFramework = "utest.runner.Framework"
}
```

- ExampleTest.scala

```scala
import utest._

object HelloTests extends TestSuite{
  val tests = Tests{
    test("test1"){
      throw new Exception("test1")
    }
    test("test2"){
      1
    }
    test("test3"){
      val a = List[Byte](1, 2)
      a(10)
    }
  }
}
```

#### scalatest

  https://alvinalexander.com/scala/mill-build-tool/unit-testing-scalatest-dependencies/

- build.sc

```scala
object test extends Tests {
  def ivyDeps = Agg(
    ivy"org.scalactic::scalactic:3.2.14",
    ivy"org.scalatest::scalatest:3.2.14"
  )
  def testFrameworks = Seq("org.scalatest.tools.Framework")
}
```

- ExampleTest.scala

```scala
import collection.mutable.Stack
import org.scalatest._
import flatspec._
import matchers._

class ExampleSpec extends AnyFlatSpec with should.Matchers {

  "A Stack" should "pop values in last-in-first-out order" in {
    val stack = new Stack[Int]
    stack.push(1)
    stack.push(2)
    stack.pop() should be (2)
    stack.pop() should be (1)
  }

  it should "throw NoSuchElementException if an empty stack is popped" in {
    val emptyStack = new Stack[Int]
    a [NoSuchElementException] should be thrownBy {
      emptyStack.pop()
    }
  }
}
```

#### specs2

  https://etorreborre.github.io/specs2/website/SPECS2-5.2.0/quickstart.html

- build.sc

```scala
object test extends Tests with TestModule.Specs2 {
  def ivyDeps = Agg(ivy"org.specs2::specs2-core:5.1.0")
}
```

- ExampleTest.scala

```scala

import org.specs2.*
class QuickStartSpec extends Specification:
  def is = s2"""

  This is my first specification
    it is working $ok
    really working! $ok

  """
```
