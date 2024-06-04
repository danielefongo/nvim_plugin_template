local function setup_test_cov()
  after_each(function()
    if os.getenv("TEST_COV") then
      require("luacov.runner").save_stats()
    end
  end)
end

-- helpers

local helpers = {}

function helpers.setup(opts)
  opts = opts or {}

  setup_test_cov()
end

return helpers
