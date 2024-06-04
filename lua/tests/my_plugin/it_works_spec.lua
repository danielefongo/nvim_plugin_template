local helpers = require("tests.helpers")
local my_plugin = require("my_plugin")

describe("events", function()
  helpers.setup()

  it("it works", function()
    assert.are.same(42, my_plugin(42))
  end)
end)
