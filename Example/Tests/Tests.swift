// https://github.com/Quick/Quick

import Quick
import Nimble
import BlockiesSwift

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("these will succeed") {

            it("can do quick maths") {
                expect(2 + 2) == 4
                expect(2 + 2 - 1) == 3
            }

            it("can read") {
                expect("man's not hot") != "never hot"
            }

            it("will eventually succeed") {
                expect("time").toEventually(equal("time"))
            }
            
            context("these will pass") {

                it("can do maths") {
                    expect(23) == 23
                }

                it("can read") {
                    expect("🐮") == "🐮"
                }

                it("will eventually pass") {
                    var time = "passing"

                    DispatchQueue.main.async {
                        time = "done"
                    }

                    waitUntil { done in
                        Thread.sleep(forTimeInterval: 0.5)
                        expect(time) == "done"

                        done()
                    }
                }
            }
        }
    }
}
