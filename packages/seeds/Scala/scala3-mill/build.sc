import mill._, scalalib._

object example extends ScalaModule {
  def scalaVersion = "3.2.1"

  object test extends Tests with TestModule.Specs2 {
    def ivyDeps = Agg(ivy"org.specs2::specs2-core:5.1.0")
  }
}
